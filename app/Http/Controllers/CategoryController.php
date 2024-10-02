<?php

namespace App\Http\Controllers;

use App\Models\Category;

class CategoryController
{
    public function index()
    {
        return response()->json(Category::all(), 200);
    }

    public function show(string $id)
    {
        $category = Category::find($id);

        if ($category) {
            $posts = $category->posts;
            $formattedPosts = $posts->map(function ($post) {
                return array(
                    'id' => $post->id,
                    'title' => $post->title,
                    'description' => $post->description,
                    'image' => $post->image,
                );
            });
            return response()->json($formattedPosts, 200);
        } else {
            return response()->json(['message' => 'Category not found'], 404);
        }
    }
}
