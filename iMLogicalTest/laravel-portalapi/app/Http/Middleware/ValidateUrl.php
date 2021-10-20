<?php

namespace App\Http\Middleware;

use App\Services\UserLoginService;
use Closure;
use Illuminate\Http\Request;
use UrlSigner;

class ValidateUrl
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if ($request->user()->tokenCan('access:account')) {
            if (empty($request->get('url'))) {
                $message = "url not found";
                $responseCode = 400;
            } else {
                if (UrlSigner::validate($request->get('url')) == true) {
                    if (!empty($request->get('uuid'))) {
                        //created service object to call service methods.
                        $userLoginService = new UserLoginService();
                        $validateUser = $userLoginService->validateUser($request->get('uuid'), $request->get('url'));
                        if ($validateUser === 1) {
                            return $next($request);
                        } else {
                            $message = "link is already used";
                            $responseCode = 403;
                        }
                    } else {
                        $message = "url not found";
                        $responseCode = 400;
                    }
                } else {
                    $message = "link is expired";
                    $responseCode = 403;
                }
            }
        } else {
            $message = 'token is not able for this route';
            $responseCode = 403;
        }
        $result = [
            'meta' => [
                'response_code' => $responseCode,
                'message' => $message,
            ],
        ];
        return response()->json($result)->setStatusCode($responseCode);
    }
}
