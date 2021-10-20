<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\UserLoginService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\URL;
use UrlSigner;
use Webpatser\Uuid\Uuid;

class UserLoginController extends Controller
{
    public function __construct(UserLoginService $UserLoginService)
    {
        $this->UserLoginService = $UserLoginService;
    }
    /**
     * login/register user and mail dynamic url.
     *
     * @param $request for requesting data from guzzal server.
     *
     * @return response.
     */
    public function login(Request $request)
    {
        if (empty($request->email)) {
            $result = [
                'meta' => [
                    'response_code' => 400,
                    'message' => 'email not exist',
                ],
            ];
            return $result;
        } else {
            $email = $request->email;
            //generating uuid
            $uuid = Uuid::generate()->string;
            $static_url = env('STATIC_URL');
            $urlExpiration = env('URL_EXPIRATION');
            $requestUrl = $static_url . $uuid; //route('account');
            //genrating dynamic url for 30 minutes.
            $url = UrlSigner::sign($requestUrl, now()->addMinutes($urlExpiration));
            $result = $this->UserLoginService->loginRegisterService($email, $url, $uuid);
            $response = [
                'meta' => [
                    'response_code' => $result['response_code'],
                    'message' => $result['message'],
                ],
                'data' => $result['data'],
            ];
            return response()->json($response);
        }
    }
}
