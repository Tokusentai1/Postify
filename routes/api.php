<?php

use App\Http\Controllers\SocialiteController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\PasswordController;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PostController;
use Illuminate\Support\Facades\Route;

Route::middleware(['throttle:10,1'])->group(
    function () {
        Route::post('login', [UserController::class, 'login']);

        Route::post('register', [UserController::class, 'register']);

        Route::post('send-reset-link', [PasswordController::class, 'sendResetLink']);

        Route::post('reset-password', [PasswordController::class, 'resetPassword']);

        Route::get('redirect/{provider}', [SocialiteController::class, 'redirectProvider']);

        Route::get('callback/{provider}', [SocialiteController::class, 'callbackProvider']);
    }
);

Route::middleware(['auth:sanctum', 'verified'])->group(
    function () {
        Route::apiResource('users', UserController::class);

        Route::apiResource('categories', CategoryController::class);

        Route::apiResource('posts', PostController::class);

        Route::post('search', [PostController::class, 'search']);
    }
);

Route::middleware('auth:sanctum')->group(
    function () {
        Route::post('email/verification-notification', [EmailController::class, 'resendEmail'])->name('verification.send');

        Route::get('/email/verify-notice', [EmailController::class, 'emailNotice'])->name('verification.notice');
    }
);

Route::middleware('signed', 'throttle:10,1')->get('email/verify/{id}/{hash}', [EmailController::class, 'verifyEmail'])->name('verification.verify');
