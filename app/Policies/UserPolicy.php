<?php

namespace App\Policies;

use App\Models\User;

class UserPolicy
{

    public function view(User $user, User $model): bool
    {
        return true;
    }

    public function create(User $user): bool
    {
        return true;
    }

    public function update(User $user, User $model): bool
    {
        return $user->id === $model->id || $user->is_admin && str_ends_with($user->email, '@admin.com');
    }

    public function delete(User $user, User $model): bool
    {
        return $user->id === $model->id || $user->is_admin && str_ends_with($user->email, '@admin.com');
    }
}
