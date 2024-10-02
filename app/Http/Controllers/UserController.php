<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\User;

class UserController
{
    use AuthorizesRequests;

    public $rules = array(
        "name" => "Required|min:3|max:20|string",
        "email" => "Required|email|unique:users,email|string",
        "gender" => "Required|string|min:4|max:6",
        "password" => "Required|min:8|max:30|string|regex:/[0-9]/|regex:/[!@#$%^]/",
    );

    public function index()
    {
        return response()->json(User::all());
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        } else {
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->gender = $request->gender;
            $user->password = $request->password;
            $user->save();

            $user->sendEmailVerificationNotification();

            $token = $user->createToken($user->name . ' Token')->plainTextToken;
            return response()->json([
                'user' =>  $user,
                'token' => $token
            ], 201);
        }
    }

    public function show(string $id)
    {
        $user = User::find($id);
        if ($user) {
            $user->posts;
            return response()->json($user);
        } else {
            return response()->json(['message' => "User Not Found"], 404);
        }
    }

    public function update(Request $request, string $id)
    {
        $editRules = array(
            "name" => "Sometimes|min:4|max:20|string",
            "email" => "Sometimes|email|unique:users,email,{$id}|string",
            "password" => "Sometimes|min:8|max:30|string|regex:/[0-9]/|regex:/[!@#$%^-_]/",
        );

        $validator = Validator::make($request->all(), $editRules);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        } else {
            $data = $request->only(['name', 'email', 'password']);

            $user = User::find($id);

            $this->authorize('update', $user);

            if (!$user) {
                return response()->json(['message' => "User Not Found"], 404);
            } else {
                $user->update($data);
                return response()->json(['message' => "user Updated Successfully"], 200);
            }
        }
    }

    public function destroy(string $id)
    {
        $user = User::find($id);

        $this->authorize('delete', $user);

        if ($user) {
            return response()->json(['message' => "User Deleted Successfully"], 200);
        } else {
            return response()->json(['message' => "User Not Found"], 404);
        }
    }

    public function login(Request $request)
    {
        $loginRules = array(
            "email" => "Required|email|max:255|string",
            'password' => 'Required|min:8|max:255|string',
        );

        $validator = Validator::make($request->all(), $loginRules);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $user = User::where('email', strtolower($request->email))->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['message' => "These credentials do not match our records"], 401);
        }

        $token = $user->tokens()->first();
        if ($token) {
            $token->delete();
        }

        $createdToken = $user->createToken($user->name . ' Token')->plainTextToken;

        return response()->json([
            'user' => $user,
            'token' => $createdToken
        ], 201);
    }
}
