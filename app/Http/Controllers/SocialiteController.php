<?php

namespace App\Http\Controllers;

use App\Models\Provider;
use Laravel\Socialite\Facades\Socialite;
use App\Models\User;

class SocialiteController
{
    public function redirectProvider($provider)
    {
        return Socialite::driver($provider)->stateless()->redirect();
    }

    public function callbackProvider($provider)
    {
        $socialiteUser = Socialite::driver($provider)->stateless()->user();

        $user = User::updateOrCreate([
            'email' => $socialiteUser->email,
        ], [
            'name' => $socialiteUser->name,
            'email_verified_at' => now(),
        ]);

        Provider::updateOrCreate([
            'user_id' => $user->id,
        ], [
            'provider_id' => $socialiteUser->id,
            'provider_name' => $provider,
            'provider_token' => $socialiteUser->token,
            'provider_refresh_token' => $socialiteUser->refreshToken,
        ]);

        $token = $user->tokens()->first();
        if ($token) {
            $token->delete();
        }

        $createToken = $user->createToken($user->name . ' Token')->plainTextToken;

        return redirect()->route('action.completed', ['token' => $createToken]);
    }
}
