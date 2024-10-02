<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('passwordResetForm/{token}', function ($token) {
    return view('auth.reset-password', ['token' => $token]);
})->name("password.reset")->middleware('throttle:10,1');


Route::get('actionCompleted', function () {
    return view('provider.socialite-callback');
})->name('action.completed')->middleware('throttle:10,1');
