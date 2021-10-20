<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use GuzzleHttp\Client;
use Log;

class LoginController extends Controller
{
    /**
     * Validate email address.
     *
     * @param $request for requesting data from form.
     *
     * @return response.
     */
    public function login(LoginRequest $request)
    {
        $email = $request->email;
        $client = new Client();
        //ngrok link for 8001 port
        $serverUrl = env('SERVER_URL', '');
        $response = $client->post(
            $serverUrl,
            ['form_params' => [
                'email' => $email,
            ]]
        );
        $result = json_decode($response->getBody());
        return response()->json($result)->setStatusCode($result->meta->response_code);
    }
}
