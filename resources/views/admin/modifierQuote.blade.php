@extends('layouts.admin')
@section('content')

{!! Form::open(array('url' => "admin/post-modifier-quote", 'class'=>'well')) !!}
	<input type="hidden" name="_token" value="{{ csrf_token() }}">

	<div class="form-group">
		Modifier la #Pire :
		<br><br>
		<div class="col-md-6">
			Hier, {!! Form::textarea('quote',$quote->contenu,array('class'=>'input-xxlarge')) !!}
		</div>
		&emsp;&emsp;#LaPire
		<br>
	</div>
	<br>

	{!! Form::hidden('id', $quote->id) !!}

	<div class="form-group">
		<div class="col-md-6 col-md-offset-4">
			<button type="submit" class="btn" style="margin-right: 15px;">
				Modifier
			</button>
		</div>
	</div>
{!! Form::close() !!}

<a class="btn" href='{!! URL::to("admin/supprimer-quote/$quote->id") !!}' >Supprimer cette #Pire</a>

@endsection