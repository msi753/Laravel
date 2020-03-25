@extends('layout');

@section('content')
<div class="flex-center position-ref full-height">
    @if (Route::has('login'))
        <div class="top-right links">
            @auth
                <a href="{{ url('/home') }}">Home</a>
            @else
                <a href="{{ route('login') }}">Login</a>

                @if (Route::has('register'))
                    <a href="{{ route('register') }}">Register</a>
                @endif
            @endauth
        </div>
    @endif

    <div class="content">
        <div class="title m-b-md">라라벨</div>

        <div class="links">
            <a href="https://laravel.com/docs">Docs</a>
            <a href="https://laracasts.com">게시판</a>
            <a href="http://www.etoday.co.kr/news/">News</a>
            <a href="https://blog.laravel.com">Blog</a>
            <a href="https://nova.laravel.com">Todo리스트</a>
            <a href="https://forge.laravel.com">코로나</a>
            <a href="https://vapor.laravel.com">Vapor</a>
            <a href="https://github.com/msi753/laravel">GitHub</a>
        </div>
    </div>
</div>
@endSection