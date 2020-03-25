@extends('simplelayout')

@section('content')
<div id="wrapper">
	<div id="page" class="container">
		<div id="sidebar">
			<ul class="style1">
				@foreach($articles as $article)
				<li class="first">
					<!-- <h3><a href="/articles/{{ $article->id }}">{{ $article->title }}</a></h3> -->
					<!-- <h3><a href="{{ route('articles.show', $article) }}">{{ $article->title }}</a></h3> -->
					<h3><a href="{{ $article->path() }}">{{ $article->title }}</a></h3>
					<p>{{ $article->excerpt }}</p>
				</li>
				@endforeach
			</ul>
		</div>
	</div>
</div>
@endsection

