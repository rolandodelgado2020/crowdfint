@extends('layouts.blog')

@section('bg-img', Storage::disk('local')->url($post->image))

@section('header')
<div>
<h1 style="color: light; font-size: 26px;">Proyecto</h1>
<h1 style="color: white; font-size: 146px;">{{ $post->title }}</h1>
<h1 class="display-1">Proyecto:</h1>
<p>Texto del ejemplo</p>
<h1 class="display-2">Ejemplo h1 display-2</h1>
<p>Texto del ejemplo</p>
<h1 class="display-3">Ejemplo h1 display-3</h1>
<p>Texto del ejemplo</p>
<h1 class="display-4">Ejemplo h1 display-4</h1>
<p>Texto del ejemplo</p>
    <h2 cla"subheadss=ing">{{ $post->subtitle }}</h2>
    <span class="meta">
      {{ $post->created_at->diffForHumans() }}
    </span>
    @foreach ($post->categories as $category)
             <a href="{{ $post->title }}"   class="badge badge-pill badge-primary">{{ $post->ubicacion }}</a>
    @endforeach
</div>
@stop

@section('content')
<article>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                {!! htmlspecialchars_decode($post->body) !!}
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                @if ($post->tags)
                    <ul class="list-inline">
                        @foreach($post->tags as $tag)
                            <li class="tag">
                                <a href="{{ route('tag', $tag->slug) }}" class="badge badge-pill badge-primary"><i class="fas fa-tag"></i> {{ $tag->name }}</a>
                            </li>
                        @endforeach
                    </ul>
                @endif
            </div>
        </div>
    </div>
</article>
@stop
