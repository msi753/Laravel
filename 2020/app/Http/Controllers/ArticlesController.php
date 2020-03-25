<?php

namespace App\Http\Controllers;

use App\Tag;
use App\Article;
use Illuminate\Http\Request;

class ArticlesController extends Controller
{



    //render a list of a resource.
    public function index() {
        if(request('tag')) {
            $articles = Tag::where('name', request('tag'))->firstOrFail()->articles;
        } else {      
            $articles= Article::latest()->get();
        }


        //web.php에서 지정한 라우트의 이름name을 적어준다.
        //$article->id를 파라미터로 넘기는 거지만 $article이라고 써도 알아듣는다.
        return view('articles.index', ['articles'=>$articles]);
    }



    //show a single resource.
    /*
    web.php에 써 있는 내용
    Route::get('/articles/{foobar}', 'ArticlesController@show'); 
    http://gittest.vm.etoday.co.kr/articles/1 로 요청하면 라라벨이 알아서 인식함
    라우터에 있는 와일드카드와 컨트롤러의 매개변수명이 일치해야 한다.
    */
    //public function show($id){
    public function show(Article $foobar) {
        //$article = Article::where('id', 1)->first();
        return view('articles.show', ['article'=>$foobar]);
    }



    public function create() {
        //shows a view to create a new resource.
        return view('articles.create');
    }

    

    public function store() {
        //persist

        //유효성 검사
        /*
        $validatedAttributes = request()->validate([
            'title'   => ['required', 'min:3', 'max:255'],
            'excerpt' => 'required',
            'body'    => 'required'
        ]);

        Article::create($validatedAttributes);
        */

        //유효성검사와 테이블 생성을 합침
        Article::create($this->validateArticle());

        /*
        $article = new Article();
        $article->title = request('title');
        $article->excerpt = request('excerpt');
        $article->body = request('body');
        $article->save();        

        //new Article() 생성자 메서드에서 save()까지를 create배열로 해결
        Article::create([
            'title' => request('title'),
            'excerpt' => request('excerpt'),
            'body' => request('body'),
        ]);
        */

        //return redirect('/articles');
        return redirect(route('articles.index'));
    }    



    //public function edit($id) {
    public function edit(Article $article) {
        //$article = Article::findOrFail($id);

        //finc the article associated with the id

        return view('articles.edit', compact('article'));
        //return view('articles.edit', ['article'=>$article]); 아래와 동일
    }   



    public function update(Article $article) {
        /*
        //유효성 검사
        request()->validate([
            'title'   => ['required', 'min:3', 'max:255'],
            'excerpt' => 'required',
            'body'    => 'required'
        ]);
        
        //$article = Article::findOrFail($id);
        
        $article->title = request('title');
        $article->excerpt = request('excerpt');
        $article->body = request('body');
        $article->save();
        */

        //유효성검사와 업데이트를 한 번에
        $article->update($this->validateArticle());

        //Article.php에서 지정한 path를 사용하는 방법
        return redirect($article->path());  
        //return redirect('/articles/'.$article->id );
    }    



    public function destroy() {

    }



    //유효성 검사 내용이 중복되어 함수를 따로 뺌
    protected function validateArticle() {
        return request()->validate([
            'title'   => ['required', 'min:3', 'max:255'],
            'excerpt' => 'required',
            'body'    => 'required'   
        ]);
    }
}
