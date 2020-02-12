<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'BlogController@index')->name('blog');
Route::get('/post/{post}', 'BlogController@post')->name('post');
Route::get('/post/payment/{post}', 'PostController@payment')->name('posts.payment');
Route::get('/post}', 'PostController@post')->name('posts.list');
Route::get('/post/registro_financiero/{user}', 'PostController@registro_financiero')->name('posts.registro_financiero');
Route::get('/post/tag/{tag}', 'BlogController@tag')->name('tag');
Route::get('/post/category/{category}', 'BlogController@category')->name('category');
Route::put('/post/registro_financiero_guardar', 'PostController@registro_financiero_guardar')->name('posts.registro_financiero_guardar');
Route::get('/home', 'HomeController@User_saldos') ->name('User_saldos');
Route::get('/home/miactividad', 'HomeController@miactividad') ->name('home.miactividad');
Route::get('/home/misinversiones/{id}', 'HomeController@misinversiones') ->name('home.misinversiones');

Auth::routes();
Route::group(
    ['middleware' => ['role:user']],
//Route::middleware(['auth'])->group(function() {
    function () {
    // Dashboard
    Route::get('/home', 'HomeController@index')
        ->name('home')
        ->middleware('role:user');
     

    Route::resource('roles', 'RoleController');
    Route::resource('permissions', 'PermissionController');
    Route::resource('permission_groups', 'PermissionGroupController');
    Route::resource('users', 'UserController');
    Route::resource('categories', 'CategoryController');
    Route::resource('tags', 'TagController');
    Route::resource('posts', 'PostController');
    Route::resource('User_saldos', 'User_saldosController');
    Route::resource('user', 'User_saldosController');

    // Menus
    Route::resource('menus', 'MenuController');
    Route::post('/menus/{menu}/order', 'MenuController@sort_item')->name('menus.order');
    Route::get('/menus/{menu}/builder', 'MenuItemController@builder')->name('menus.builder');
    Route::post('/menus/{menu}/item/', 'MenuItemController@store')->name('menus.item.add');
    Route::put('/menus/{menu}/item/', 'MenuItemController@update')->name('menus.item.update');
    Route::delete('/menus/{menu}/item/{id}', 'MenuItemController@destroy')->name('menus.item.destroy');

    Route::get('/home/miactividad', 'HomeController@miactividad') ->name('miactividad');
   
Route::get('/home/misinversiones/{id}', 'HomeController@misinversiones') ->name('home.misinversiones');


});
