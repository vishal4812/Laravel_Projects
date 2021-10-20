<?php

use App\Http\Controllers\Api\UserLoginController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', [UserLoginController::class, 'login'])->name('login');

Route::post('/me', function (Request $request) {
    //when user successfully verified and authenticated then only we are passing token in response.
    $token = $request->bearerToken();
    $result = [
        'meta' => [
            'response_code' => 200,
            'message' => 'hello welcome you are successfully logged in',
            'token' => $token,
        ],
    ];
    return response()->json($result)->setStatusCode($result['meta']['response_code']);
})->middleware('verify.url', 'auth:sanctum')->name('account');
