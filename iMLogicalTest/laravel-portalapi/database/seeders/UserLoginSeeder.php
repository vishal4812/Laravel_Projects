<?php

namespace Database\Seeders;

use App\Models\UserLogin;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use UrlSigner;
use Webpatser\Uuid\Uuid;

class UserLoginSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i < 20; $i++) {
            $uuid = Uuid::generate()->string;
            $static_url = env('STATIC_URL');
            $urlExpiration = env('URL_EXPIRATION');
            $requestUrl = $static_url . $uuid; //route('account');
            //genrating dynamic url for 30 minutes.
            $url = UrlSigner::sign($requestUrl, now()->addMinutes($urlExpiration));
            $user = UserLogin::create([
                'uuid' => $uuid,
                'email' => Str::random(20) . '@gmail.com',
                'verified_status' => 0,
                'token' => '',
                'url' => $url,
                'role' => 'user',
            ]);
            $token = $user->createToken('tokens', ['access:account'])->plainTextToken;
            $user->token = $token;
            $user->save();
        }
    }
}
