<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->bootRocketSocialite();
    }

    public function bootRocketSocialite()
    {
        $socialite = $this->app->make('Laravel\Socialite\Contracts\Factory');
        $socialite->extend(
            'rocket',
            function ($app) use ($socialite) {
                $config = $app['config']['services.rocket'];
                return $socialite->buildProvider(RocketChatProvider::class, $config);
            }
        );
    }
}
