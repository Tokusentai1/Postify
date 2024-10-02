<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class EmailController
{
    public function verifyEmail($id, $hash)
    {
        $user = User::find($id);

        if (!$user || !hash_equals($hash, sha1($user->getEmailForVerification()))) {
            return view('mail.email-verified', ["message" => "Invalid email verification link !"]);
        }

        if ($user->hasVerifiedEmail()) {
            return view('mail.email-verified', ["message" => "Email already verified !"]);
        }

        $user->markEmailAsVerified();


        return view('mail.email-verified', ["message" => "Email verified successfully !"]);
    }

    public function resendEmail(Request $request)
    {
        $user = $request->user();

        if ($user->hasVerifiedEmail()) {
            return response()->json(['message' => 'Email already verified'], 200);
        }

        $user->sendEmailVerificationNotification();

        return response()->json(['message' => 'Email verification link sent'], 200);
    }

    public function emailNotice()
    {
        return response()->json(['message' => "Your Email is not verified please verify your email."], 403);
    }
}
