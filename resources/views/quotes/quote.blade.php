@extends('layouts.default')
@section('content')

<div class="hero-unit">
	<h2>#{!! $quote->numero !!}</h2>
	<br>
	<p><i>
		"{!! $quote->contenu !!}"
		<br><br>
		#LaPire
	</i></p>

	<span class="stringVote">#LaPire ({!! $quote->like !!})</span>
	<span class="stringVote">Ma grand-mère fait pire ({!! $quote->dislike !!})</span>
</div>


@if(!Auth::check())
	<div class="alert alert-error">
		Vous devez être connecté pour poster des commentaires et pour voter.
	</div>
@else
	<h3>Poste un commentaire</h3>
	@if (count($errors) > 0)
		<div class="alert alert-danger">
			<strong>Whoops!</strong> Les champs ci-dessous ne sont pas corrects :<br><br>
			<ul>
				@foreach ($errors->all() as $error)
					<li>{{ $error }}</li>
				@endforeach
			</ul>
		</div>
	@endif
	@if (Session::has('error_calcul'))
		<div class="alert alert-danger">
			<strong>Whoops!</strong> Les champs ci-dessous ne sont pas corrects.<br><br>
			<ul>
				<li>{!! Session::get('error_calcul') !!}</li>
			</ul>
		</div>
	@endif

	{!! Form::open(array('url' => "postComment/$answer", 'class'=>'well', 'name'=>'addCom')) !!}

		{!! Form::textarea('comment','',array('class'=>'input-xxlarge', 'rows'=>4, 'id'=>'comment', 'onKeyDown'=>"limiteur();", 'onKeyUp'=>"limiteur();")) !!}
		<br>
		{!! $number_1 !!} + {!! $number_2 !!} = 
		{!! Form::text('calcul','', array('style'=>'width:20px;')) !!}

		{!! Form::hidden('idQuote',$quote->id) !!}
		<br>
		<h5>Il vous reste <span id="indicateur">400</span> caractères.</h5>
		<br>
		<p>
			{!! Form::submit('Envoyer',array('type'=>'button', 'id'=>'submit', 'class'=>'btn')) !!}
		</p>

	{!! Form::close() !!}
@endif

<h3>Commentaires</h3>
<br>
<?php 
	$comments = $quote->comments()->orderBy('like', 'DESC')->orderBy('dislike', 'ASC')->get();
?>
@foreach( $comments as $comment)
	<div class="visu">
		<span class="date">{!! date('d/m/Y H:i', strtotime($comment->created_at)) !!} par <i>{!! $comment->user->pseudo !!}</i> 
			@if(Auth::check())
				@if(Auth::user()->role=="admin")
					@if($comment->modere==0)
						<span class="action-comments"> <a href='{!! URL::to("admin/delete-comment/$comment->id") !!}' title="supprimer">Supprimer ce commentaire</a></span>
					@else
						<span class="action-comments"> <a href='{!! URL::to("admin/valider-comment/$comment->id") !!}' title="valider">Remettre ce commentaire</a></span>
					@endif
				@endif
			@endif
		</span>
		<p>
			@if($comment->modere==0)
				{!! $comment->contenu !!}
			@else
				<i><sub>Commentaire supprimé pour non respect des règles.</sub></i>
				@if(Auth::check())
					@if(Auth::user()->role=="admin")
					<br>
						<i><sub>{!! $comment->contenu !!}</sub></i>
					@endif
				@endif
			@endif
		</p>

		@if($comment->modere==0)
			<img id="likedCom{!! $comment->id !!}" src="{!! URL::to('img/greenlike.png') !!}" onMouseOver="onOver('like', 'likedCom{!! $comment->id !!}');" onMouseOut="onOut('like', 'likedCom{!! $comment->id !!}');"  onclick="vote('like', {!! $comment->id !!}, {!! $comment->like !!})"alt="like"  > 
			<span id="comLike{!! $comment->id !!}">({!! $comment->like !!})</span>

			<img id="dislikedCom{!! $comment->id !!}" src="{!! URL::to('img/reddislike.png') !!}" onMouseOver="onOver('dislike', 'dislikedCom{!! $comment->id !!}');" onMouseOut="onOut('dislike', 'dislikedCom{!! $comment->id !!}');"  onclick="vote('dislike', {!! $comment->id !!}, {!! $comment->dislike !!})" alt="dislike"  > 
			<span id="comDislike{!! $comment->id !!}">({!! $comment->dislike !!})</span>
		@endif


	</div>
	<hr>
@endforeach

<script>


	function limiteur()
	{
		maximum = 400;
		champ = document.addCom.comment;
		indic = document.getElementById('indicateur');

		if (champ.value.length > maximum)
		  champ.value = champ.value.substring(0, maximum);
		else 
		{
			restant = maximum - champ.value.length;
			indic.innerHTML=restant;
		}
		  
	}

	function onOver (type, id) {
		if(type=="dislike")
			document.getElementById(id).src="{!! URL::to('img/reddislike_big.png') !!}";
		else
			document.getElementById(id).src="{!! URL::to('img/greenlike_big.png') !!}";

	}

	function onOut (type, id) {
		if(type=="dislike")
			document.getElementById(id).src="{!! URL::to('img/reddislike.png') !!}";
		else
			document.getElementById(id).src="{!! URL::to('img/greenlike.png') !!}";	
	}

	function vote (type, id, nb) {
		var phpLike ="<?php echo URL::to('likeComment') ?>"+"/"+type+"/"+id;
		$(function() {
      		$.ajax({
        		type: 'GET',
        		url: phpLike,
        		timeout: 3000,
        		success: function(data) {
        			if(data=='nc')
            				alert('Vous devez vous être connecté pour voter.');
            			else
            			{
            				if(data=='av')
            					alert('Vous avez déjà voter pour ce commentaire.');
            				else
            				{
            					if(data='success')
            					{
            						if(type=='like')
            							document.getElementById("comLike"+id).innerHTML="("+(nb+1)+")";
            						else
            							document.getElementById("comDislike"+id).innerHTML="("+(nb+1)+")";
            					}
            				}
            			}
          		},
        		error: function() {
          			alert('La requête n\'a pas abouti'); }
      		});      
  		});
	}
</script>

@endsection