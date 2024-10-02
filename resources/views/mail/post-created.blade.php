@component('mail::message')
# New Post Created

A new post titled **{{ $post->title }}** has been created.

The Post Content: **{{$post->description}}**.

@if($post->image)
<img src="{{ asset('storage/' . $post->image) }}" alt="Post Image" />
@endif

Thanks,<br>
{{ config('app.name') }}
@endcomponent