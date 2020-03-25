<?php

use Illuminate\Support\Facades\Route;

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

/*
Route::get('/', function () {
    return view('welcome');
});

Route::get('/welcome', function () {
    //return 'Hello World!';  //String도 리턴 가능
    return ['foo'=>'bar'];  //Json도 리턴 가능
});

Route::prefix('/board')->group(function() {
    Route::view('index', 'board.index');
});

//http://gittest.vm.etoday.co.kr/?name=명심
Route::get('/', function () {
    $name = request('name');

    return view('welcome', [
        'name' => $name
    ]);
});

Route::get('/', function () {
    return view('welcome', [
        'name' => request('name')
    ]);
});

//http://gittest.vm.etoday.co.kr/board/my-first-post
Route::get('/board/{post}', function ($post) {
    $posts = [
        'my-first-post' =>  'Hello, this is my first blog post!',
        'my-second-post'=>  'Now I am getting the hang of this blogging thing'
    ];

    if(!array_key_exists($post, $posts)) {
        abort(404, 'Sorry, that post was not found');
    }

    return view('/board/index', [
        'post' => $posts[$post]
    ]);
});

Route::get('/board/{post}', 'PostsController@show');
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/contact', function () {
    return view('contact');
});

Route::get('/about', function () {
    //$article = App\Article::paginate(2);    //total
    return view('about', [
        'article' => App\Article::take(3)->latest()->get()
    ]);
});

//순서도 중요함
Route::get('/articles', 'ArticlesController@index')->name('articles.index');
Route::post('/articles', 'ArticlesController@store');   //포스트 방식
Route::get('/articles/create', 'ArticlesController@create');
Route::get('/articles/{foobar}', 'ArticlesController@show')->name('articles.show');
Route::get('/articles/{article}/edit', 'ArticlesController@edit');
Route::put('/articles/{article}', 'ArticlesController@update'); //업데이트


//라라벨에서 CRUD는 GET, POST, PUT(업데이트), DELETE로 
// GET /articles
// GET /articles/:id
// POST /articles
// PUT /articles/:id
// DELETE /articles/:id