<?php

namespace App\Policies;

use App\Models\Category;
use App\Models\User;

class CategoryPolicy
{
    public function viewAny(User $user): bool
    {
        return true;
    }

    public function view(User $user, Category $category): bool
    {
        return true;
    }

    public function create(User $user): bool
    {
        return $user->is_admin && str_ends_with($user->email, '@admin.com');
    }
}
