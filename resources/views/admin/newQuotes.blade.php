@extends('layouts.admin')
@section('content')

<h1>Recherche une #Pire par son numéro</h1>

{!! Form::open(array('url' => "admin/postResearch-quote", 'class'=>'well')) !!}
	
	@if(Session::has('error_quote'))
		<div class="alert alert-danger">
			{!! Session::get('error_quote') !!}
		</div>
	@endif
	
	Numéro : 
	{!! Form::text('quote','') !!}
	<br>
	<div class="form-group">
		<div class="col-md-6 col-md-offset-4">
			<button type="submit" class="btn" style="margin-right: 15px;">
				Envoyer
			</button>
		</div>
	</div>
	<br>

{!! Form::close() !!}

<br>

<h1>Nouvelles #Pires</h1>

@foreach($newQuotes as $quote)

	<div class="visu">
		<div class="entry">
			<h3 class="heading">id : {!! $quote->id !!}</h3>
			<span class="date">{!! date('d/m/Y H:i', strtotime($quote->created_at)) !!} par <i>{!! $quote->auteur !!} (ip : {!! $quote->ip !!})</i></span>
			<p>
				{!! $quote->contenu !!}
				<br>
				<i>#LaPire</i>
			</p>
			
			<a class="btn" href='{!! URL::to("admin/valider-quote/$quote->id") !!}' >Valider</a>
		
			<a class="btn" href='{!! URL::to("admin/modifier-quote/$quote->id") !!}' >Modifier</a>
		
			<a class="btn" href='{!! URL::to("admin/supprimer-quote/$quote->id") !!}' >Supprimer</a>
		
		</div>
	</div>

@endforeach

@endsection