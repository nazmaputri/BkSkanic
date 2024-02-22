<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', [App\Http\Controllers\Api\Auth\LoginController::class, 'index']);

Route::group(['middleware' => 'auth:api'], function () {
    Route::post('/logout', [App\Http\Controllers\Api\Auth\LoginController::class, 'logout']);
});
Route::prefix('public')->group(function () {
   Route::post('/register', [App\Http\Controllers\Api\Auth\RegisterController::class, 'store']);

   Route::post('/submission', [App\Http\Controllers\Api\Public\SubmissionController::class, 'store']);
   
   Route::get('/submission/index', [App\Http\Controllers\Api\Public\SubmissionController::class, 'index']);
   
   Route::get('/submission/show/{id}', [App\Http\Controllers\Api\Public\SubmissionController::class, 'show']);
     
});


Route::prefix('admin')->group(function () {
    Route::group(['middleware' => 'auth:api'], function() {
        Route::apiResource('/users', 'App\Http\Controllers\Api\Admin\UserController')->middleware('permission:users.index|users.store|users.update|users.delete');
    });
});