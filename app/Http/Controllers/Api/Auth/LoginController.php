<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator; // Perbaikan pada 'Support'
use Tymon\JWTAuth\Facades\JWTAuth;

class LoginController extends Controller
{
    public function index(Request $request){

        $validator = Validator::make($request->all(), [
            'email'    => 'required|email',
            'password' => 'required', 
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        
        $credentials = $request->only('email', 'password'); // Perbaikan pada 'password'

        if(!$token = auth()->guard('api')->attempt($credentials)) {
            return response()->json([
                'success' => false,
                'message' => 'Email or password is incorrect' // Perbaikan pada 'incorrect'
            ], 400);
        }

        return response()->json([
            'success'     => true,
            'user'        => auth()->guard('api')->user()->only(['name', 'email','id']),
            'permission'  => auth()->guard('api')->user()->getPermissionArray(), // Perbaikan pada 'permission'
            'token'       => $token
        ], 200);
    }


    public function logout()
    {

        JWTAuth::invalidate(JWTAuth::getToken());

        return response()->json([
            'success'      => true,
        ], 200);
    }
}

