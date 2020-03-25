<?php

namespace App\Http\Controllers;

use DB;
use App\Post;

use Illuminate\Http\Request;

class PostsController extends Controller{
    public function show($slug) {


        //$post = DB::table('posts')->where('slug', $slug)->first();
        //$post = Post::where('slug', $slug)->firstOrFail();

        /*
        dd($post);  //dead and die

        $posts = [
            'my-first-post' =>  'Hello, this is my first blog post!',
            'my-second-post'=>  'Now I am getting the hang of this blogging thing'
        ];
    
        if(!array_key_exists($post, $posts)) {
            abort(404, 'Sorry, that post was not found');
        }

        if(!$post) {
            abort(404);
        }*/
    
        return view('/board/index', [
            'post' => Post::where('slug', $slug)->firstOrFail()
        ]);
    }
}
