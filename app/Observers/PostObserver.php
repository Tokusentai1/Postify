<?php

namespace App\Observers;

use Illuminate\Support\Facades\Storage;
use App\Models\Post;

class PostObserver
{
    public function saved(Post $post): void
    {
        if ($post->isDirty('image')) {
            Storage::disk('public')->delete($post->getOriginal('image'));
        }
    }

    public function deleted(Post $post): void
    {
        if (! is_null($post->image)) {
            Storage::disk('public')->delete($post->image);
        }
    }
}
