<?php

namespace App\Services;

use App\Models\UserLogin;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\URL;
use UrlSigner;
use Webpatser\Uuid\Uuid;

/**
 * Class UserLoginService
 * @package App\Services
 */
class UserLoginService
{
    /**
     * login/register user and mail dynamic url.
     *
     * @param $email,$url,$uuid from controller.
     *
     * @return response
     */
    public function loginRegisterService($email, $url, $uuid)
    {
        $user = UserLogin::where('email', '=', $email)->first();
        //details send in mail template.
        $details = [
            'title' => 'Mail from testProject.com',
            'body' => 'Below is your link to login into testProject.com',
            'message' => "Link will be expired in 30 minutes",
            'url' => $url,
        ];
        if (empty($user)) {
            $user = UserLogin::create([
                'uuid' => $uuid,
                'email' => $email,
                'token' => '',
                'url' => '',
                'role' => 'user',
                'verified_status' => 0,
            ]);
            //generate token using uuid
            try {
                $token = $user->createToken('tokens', ['access:account'])->plainTextToken;
            } catch (Exception $e) {
                Log::error($e);
            }
            $user->token = $token;
            $user->url = $url;
            $user->save();
            $data['uuid'] = $uuid;
            $data['token'] = $token;
            //sending dynamic url to user using postmark mail service.
            \Mail::to($email)->send(new SendDynamicUrlMail($details));
            $message = "user created and mail send successfully";
            $responseCode = 201;
        } else {
            $credentials = UserLogin::where('email', '=', $email)->first();
            //validate dynamic url.
            if (UrlSigner::validate($credentials->url) == true) {
                $responseCode = 403;
                if ($user->verified_status == 1) {
                    $data = [];
                    $message = "user already verified";
                } else {
                    $data['uuid'] = $credentials->uuid;
                    $data['token'] = $credentials->token;
                    $message = "user already exist in database";
                }
            } else {
                $token = $credentials->createToken('tokens', ['access:account'])->plainTextToken;
                $user = UserLogin::updateOrCreate(
                    [
                        'email' => $email,
                    ],
                    [
                        'token' => $token,
                        'url' => $url,
                    ]
                );
                $data['uuid'] = $user->uuid;
                $data['token'] = $token;
                //sending dynamic url to user using postmark mail service.
                \Mail::to($email)->send(new SendDynamicUrlMail($details));
                $data['token'] = $credentials->token;
                $message = "url send successfully";
                $responseCode = 200;
            }
        }
        $result = [
            'response_code' => $responseCode,
            'message' => $message,
            'data' => $data,
        ];
        return $result;
    }
    /**
     * validate user
     *
     * @param $uuid.
     * @param $url
     *
     * @return Boolean
     */
    public function validateUser($uuid, $url)
    {
        $user = UserLogin::where([['uuid', $uuid], ['url', $url], ['verified_status', '!=', 1]])->first();
        if (!empty($user)) {
            $user->verified_status = 1;
            $user->save();
            $validate = 1;
        } else {
            $validate = 0;
        }
        return $validate;
    }
}
