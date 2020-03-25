<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateArticlesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('articles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id');  //외래키로 사용될 예정 User테이블의 id와 데이터 타입이 일치하는지 확인!
            $table->string('title');            
            $table->text('excerpt');
            $table->text('body');
            $table->timestamps();

            //참조하고 있는 user의 id가 사라지면 외래키 user_id의 값도 함께 사라진다(foreignkey constraint 외래키 제약조건)
            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('articles');
    }
}
