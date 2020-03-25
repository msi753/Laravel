<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    // 키의 이름을 변경하기
    // 주어진 모델의 클래스를 찾을 때 id 와는 다른 데이터베이스 컬럼을 사용하는 모델 바인딩을 하고자 한다면, Eloquent 모델의 getRouteKeyName 메소드를 재지정하면 됩니다:
    public function getRouteKeyName()
    {        
        return 'id';    //Article::where('slug', $article)->first();
    }

    //User::create(request()->all()); 이런 식으로 하면 모든 권한에 상관없이 모든 유저가 데이터를 변경 할 수 있기 때문에 문제가 생긴다
    //protected $fillable = ['title', 'excerpt', 'body'];   //테이블을 채울 수 있는 컬럼명을 적어준다
    protected $guarded = [];    //아무것도 막지 않는다

    public function path() {
        return route('articles.show', $this);   //현재 인스턴스인 $article이라서 $this 사용
    }
}
