<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail;
use App\Mail\PostCreatedMail;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Post;

class PostController
{
    use AuthorizesRequests;

    public $rules = array(
        "title" => "Required|min:4|max:50|string",
        "description" => "Required|min:10|max:200|string",
        "image" => "Required|mimes:jpeg,png,jpg|max:2048",
        "user_id" => "Required|Integer|exists:users,id",
        "category_ids" => "Required|Array",
        "category_ids.*" => "Required|Integer|exists:categories,id"
    );

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        } else {
            $fileName = $request->file('image')->getClientOriginalName();
            $fileNameWithOutExtension = pathinfo($fileName, PATHINFO_FILENAME);
            $getFileExtension = $request->file('image')->getClientOriginalExtension();
            $newFileName = Str::random(20) . '_' . str_replace(' ', '_', $fileNameWithOutExtension) . '.' . $getFileExtension;
            $request->file('image')->storeAs('public/images', $newFileName);

            $post = new Post();
            $post->title = $request->title;
            $post->description = $request->description;
            $post->image = 'images/' . $newFileName;
            $post->user_id = $request->user_id;
            $post->save();
            $post->categories()->attach($request->category_ids);
            Mail::to($request->user())->send(new PostCreatedMail($post));
            return response()->json(['message' => "Post Created Successfully"], 201);
        }
    }

    public function show(string $id)
    {
        $post = Post::find($id);
        if ($post) {
            $response = [
                'post' => [
                    'id' => $post->id,
                    'title' => $post->title,
                    'description' => $post->description,
                    'image' => asset('storage/' . $post->image),
                ],
                'author' => $post->user->name,
                'user_id' => $post->user_id,
            ];
            return response()->json($response, 200);
        } else {
            return response()->json(['message' => "Post Not Found"], 404);
        }
    }

    public function update(Request $request, string $id)
    {
        $editRules = array(
            "title" => "Sometimes|min:4|max:50|string",
            "description" => "Sometimes|min:10|max:200|string",
            "category_ids" => "Sometimes|Array",
            "category_ids.*" => "Sometimes|Integer|exists:categories,id"
        );

        $validator = Validator::make($request->all(), $editRules);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $post = Post::find($id);

        $this->authorize('update', $post);

        if (!$post) {
            return response()->json(['message' => "Post Not Found"], 404);
        }

        $data = $request->only(['title', 'description', 'category_ids']);

        $post->update($data);
        $post->categories()->sync($request->category_ids);

        return response()->json(['message' => "Post Updated Successfully"], 200);
    }

    public function destroy(string $id)
    {
        $post = Post::find($id);

        $this->authorize('delete', $post);

        if ($post) {
            if ($post->image) {
                $fileExist = storage_path('app/public/' . $post->image);
                if (file_exists($fileExist)) {
                    unlink($fileExist);
                }
            }
            $post->delete();

            return response()->json(['message' => "Post Deleted Successfully"], 200);
        } else {
            return response()->json(['message' => "Post Not Found"], 404);
        }
    }

    public function search(Request $request)
    {
        $searchRule = array(
            "title" => "Required|string",
        );

        $validator = Validator::make($request->all(), $searchRule);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        } else {
            $search = Post::search($request->title)->get();

            return response()->json($search, 200);
        }
    }
}
