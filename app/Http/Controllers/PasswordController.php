<?php

namespace App\Http\Controllers;

use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Password;
use Illuminate\Http\Request;

class PasswordController
{
    public function sendResetLink(Request $request)
    {
        try {
            $request->validate([
                'email' => 'required|email',
            ]);
        } catch (\Throwable $validationError) {
            return response()->json(['message' => $validationError->getMessage()], 400);
        }

        $status = Password::sendResetLink(
            $request->only('email')
        );

        return $status === Password::RESET_LINK_SENT
            ? response()->json(['message' => "We have emailed your password reset link!"], 200)
            : response()->json(['message' => "We can't find a user with that email or that we already sent a email reset."], 404);
    }

    public function resetPassword(Request $request)
    {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|max:30|string|regex:/[0-9]/|regex:/[!@#$%^]/|confirmed',
        ]);

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user, $password) {
                $user->forceFill([
                    'password' => $password,
                ]);

                $user->save();

                event(new PasswordReset($user));
            }
        );

        return $status === Password::PASSWORD_RESET
            ? view('auth.password-reset-success', ['message' => "Your password has been reset !"])
            : view('auth.password-reset-success', ['message' => "Password reset failed !"]);
    }
}
