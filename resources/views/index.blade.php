@extends('layouts.default')
@section('content')

		
	<!-- Hero -->
	<div class="hero-unit">
		<h1>La pire!</h1>
		<br>
		<p><i>
			"{!! $param->quoteHome !!}"
			<br>
			#LaPire
		</i></p>
	</div><!-- ENDS hero -->

	
	<!-- info -->
	<section id="quote" class="information" >
		<div  class="page-header"><h1>Vos #Pires <small>{!! $param->sloganHome !!}</small></h1></div>
	
	
		<ul id="information-tabs" class="nav nav-pills ">
			<li><a href="#news" data-toggle="tab">Nouvelles</a></li>
			<li><a href="#top" data-toggle="tab">Top</a></li>
			<li><a href="#flop" data-toggle="tab">Flop</a></li>
			<li><a href="#random" data-toggle="tab">Aléatoire</a></li>
		</ul>
		
		
		<!-- tab content -->
		<div class="tab-content">
			<script>
				var tabLike = new Object();
				var tabDislike = new Object();
			</script>

			<!-- News -->
			<div class="tab-pane listing" id="news">
				@foreach($newQuotes as $quote)
					<div class="visu">
						<div class="entry">
							<h3 class="heading">#{!! $quote->numero !!}</h3>
							<span class="date">{!! date('d/m/Y H:i', strtotime($quote->updated_at)) !!} par <i>{!! $quote->auteur !!}</i></span>
							<p>
								{!! $quote->contenu !!}
								<br>
								<i>#LaPire</i>
							</p>
							<span class="stringAlreadyVote" id="new_already_like{!! $quote->id !!}">
							</span>
							<span class="stringVote" id="new_like{!! $quote->id !!}">
								<a class="btn" href="#"  id="{!! $quote->id !!}" onclick="fctLike({!! $quote->id !!}, {!! $quote->like !!});">#LaPire ({!! $quote->like !!})</a>
							</span>
							<span class="stringVote" id="new_dislike{!! $quote->id !!}">
								<a class="btn" href="#" id="{!! $quote->id !!}" onclick="fctDislike({!! $quote->id !!}, {!! $quote->dislike !!});">Ma grand-mère fait pire ({!! $quote->dislike !!})</a>
							</span>

							<br>
							<a href='{!! URL::to("quote/$quote->id") !!}'>{!! $quote->comments()->count(); !!} commentaires</a>
						</div>
					</div>
					<script>
						var id = '<?php echo $quote->id ?>';
						if(localStorage['LikedPost' + id] == 'true')
						{
							var like = '<?php echo $quote->like ?>';
							tabLike[id]=like;
						}
						if(localStorage['DislikedPost' + id] == 'true') 
						{
							var dislike = '<?php echo $quote->dislike ?>';
							tabDislike[id]=dislike;
						}
					</script>
					
				@endforeach
				{!! $newQuotes->render() !!}
			</div>

			<!-- ENDS News -->
			
			
			<!-- Top -->
			<div class="tab-pane listing" id="top">
				@foreach($topQuotes as $quote)
					<div class="visu">
						<div class="entry">
							<h3 class="heading">#{!! $quote->numero !!}</h3>
							<span class="date">{!! date('d/m/Y H:i', strtotime($quote->updated_at)) !!} par <i>{!! $quote->auteur !!}</i></span>
							<p>
								{!! $quote->contenu !!}
								<br>
								<i>#LaPire</i>
							</p>
							<span class="stringAlreadyVote" id="top_already_like{!! $quote->id !!}">
							</span>
							<span class="stringVote" id="top_like{!! $quote->id !!}">
								<a class="btn" href="#"  id="{!! $quote->id !!}" onclick="fctLike({!! $quote->id !!}, {!! $quote->like !!});">#LaPire ({!! $quote->like !!})</a>
							</span>
							<span class="stringVote" id="top_dislike{!! $quote->id !!}">
								<a class="btn" href="#" id="{!! $quote->id !!}" onclick="fctDislike({!! $quote->id !!}, {!! $quote->dislike !!});">Ma grand-mère fait pire ({!! $quote->dislike !!})</a>
							</span>

							<br>
							<a href='{!! URL::to("quote/$quote->id") !!}'>{!! $quote->comments()->count(); !!} commentaires</a>
						</div>
					</div>
				@endforeach
				{!! $topQuotes->render() !!}
			</div>
			<!-- ENDS Top -->
			
			
			<!-- Flop -->
			<div class="tab-pane listing" id="flop">
				@foreach($flopQuotes as $quote)
					<div class="visu">
						<div class="entry">
							<h3 class="heading">#{!! $quote->numero !!}</h3>
							<span class="date">{!! date('d/m/Y H:i', strtotime($quote->updated_at)) !!} par <i>{!! $quote->auteur !!}</i></span>
							<p>
								{!! $quote->contenu !!}
								<br>
								<i>#LaPire</i>
							</p>
							<span class="stringAlreadyVote" id="flop_already_like{!! $quote->id !!}">
							</span>
							<span class="stringVote" id="flop_like{!! $quote->id !!}">
								<a class="btn" href="#"  id="{!! $quote->id !!}" onclick="fctLike({!! $quote->id !!}, {!! $quote->like !!});">#LaPire ({!! $quote->like !!})</a>
							</span>
							<span class="stringVote" id="flop_dislike{!! $quote->id !!}">
								<a class="btn" href="#" id="{!! $quote->id !!}" onclick="fctDislike({!! $quote->id !!}, {!! $quote->dislike !!});">Ma grand-mère fait pire ({!! $quote->dislike !!})</a>
							</span>

							<br>
							<a href='{!! URL::to("quote/$quote->id") !!}'>{!! $quote->comments()->count(); !!} commentaires</a>
						</div>
					</div>
				@endforeach
				{!! $flopQuotes->render() !!}
			</div>
			<!-- ENDS Flop -->
			
			<!-- Random -->
			<div class="tab-pane listing" id="random">
				@foreach($randQuotes as $quote)
					<div class="visu">
						<div class="entry">
							<h3 class="heading">#{!! $quote->numero !!}</h3>
							<span class="date">{!! date('d/m/Y H:i', strtotime($quote->updated_at)) !!} par <i>{!! $quote->auteur !!}</i></span>
							<p>
								{!! $quote->contenu !!}
								<br>
								<i>#LaPire</i>
							</p>
						
							<span class="stringAlreadyVote" id="rand_already_like{!! $quote->id !!}">
							</span>
							<span class="stringVote" id="rand_like{!! $quote->id !!}">
								<a class="btn" href="#"  id="{!! $quote->id !!}" onclick="fctLike({!! $quote->id !!}, {!! $quote->like !!});">#LaPire ({!! $quote->like !!})</a>
							</span>
							<span class="stringVote" id="rand_dislike{!! $quote->id !!}">
								<a class="btn" href="#" id="{!! $quote->id !!}" onclick="fctDislike({!! $quote->id !!}, {!! $quote->dislike !!});">Ma grand-mère fait pire ({!! $quote->dislike !!})</a>
							</span>

							<br>
							<a href='{!! URL::to("quote/$quote->id") !!}'>{!! $quote->comments()->count(); !!} commentaires</a>
						</div>
					</div>
				@endforeach
				{!! $randQuotes->render() !!}
			</div>
			<!-- ENDS Random -->
			
		</div><!-- ENDS tab content -->
	</section><!-- ENDS info -->
	
	<!-- Contact -->
	<section id="contact-section" >
		<div  class="page-header"><h1>Contact <small> Get in touch</small></h1></div>
		
		<div class="row">
		<!-- Form col -->
		<div class="span8">
			<form class="well" id="contactForm" action="#" method="post">
				<label>Your Name</label>
				<input type="text" class="input-xlarge" placeholder="Whats your name?" name="name" id="name">
				<label>Your Email</label>
				<input type="text" class="input-xlarge" placeholder="How can i contact you?" name="email" id="email">
				<label>Your Web</label>
				<input type="text" class="input-xlarge" placeholder="Have a website?" name="web" id="web">
				<label>Message</label>
				<textarea class="input-xxlarge"  rows="4"  name="comments"  id="comments"></textarea>
				<!-- send mail configuration -->
				<input type="hidden" value="your@email.com" name="to" id="to" />
				<input type="hidden" value="Enter the subject here" name="subject" id="subject" />
				<input type="hidden" value="send-mail.php" name="sendMailUrl" id="sendMailUrl" />
				<!-- ENDS send mail configuration -->
				
				<p><input type="button" value="Send" name="submit" id="submit" class="btn"/></p>
			</form>
			<div id="error" class="alert alert-error"></div>
			<div id="sent-form-msg" class="alert alert-success">Your message was sent!</div>
		</div><!-- ENDS form col -->
		
		
		<div class="span4">
			<ul class="address-block unstyled">
    			<li class="address"><i class="icon-home"></i> Address line, city, state ZIP</li>
    			<li class="phone"><i class="icon-comment"></i> +123 456 789</li>
    			<li class="email"><i class="icon-envelope"></i><a href="mailto:email@server.com"> email@server.com</a></li>
    		</ul>
		</div>
		
		</div>
	</section><!-- ENDS Contact -->

	
	<script>

		for(id in tabLike)
		{
			document.getElementById("new_like"+id).innerHTML="#LaPire ("+tabLike[id]+")";
			document.getElementById("top_like"+id).innerHTML="#LaPire ("+tabLike[id]+")";
			document.getElementById("flop_like"+id).innerHTML="#LaPire ("+tabLike[id]+")";
			document.getElementById("rand_like"+id).innerHTML="#LaPire ("+tabLike[id]+")";
		}
		for(id in tabDislike)
		{
			document.getElementById("new_dislike"+id).innerHTML="Ma grand-mère fait pire ("+tabDislike[id]+")";
			document.getElementById("top_dislike"+id).innerHTML="Ma grand-mère fait pire ("+tabDislike[id]+")";
			document.getElementById("flop_dislike"+id).innerHTML="Ma grand-mère fait pire ("+tabDislike[id]+")";
			document.getElementById("rand_dislike"+id).innerHTML="Ma grand-mère fait pire ("+tabDislike[id]+")";
		}

		function fctLike (id, like) {
		 	if(localStorage['LikedPost' + id] == 'true') 
			{
				document.getElementById("new_already_like"+id).innerHTML="Vous avez déjà voté <br>";
				document.getElementById("top_already_like"+id).innerHTML="Vous avez déjà voté <br>";
				document.getElementById("flop_already_like"+id).innerHTML="Vous avez déjà voté <br>";
				document.getElementById("rand_already_like"+id).innerHTML="Vous avez déjà voté <br>";
				return; // abort if already voted
			}
     		localStorage['LikedPost' + id] = 'true';
			var phpLike ="btnLike/"+id;
			$(function() {
          		$.ajax({
            		type: 'GET',
            		url: phpLike,
            		timeout: 3000,
            		success: function() {
              			document.getElementById("new_like"+id).innerHTML="#LaPire ("+(like+1)+")";
              			document.getElementById("top_like"+id).innerHTML="#LaPire ("+(like+1)+")";
              			document.getElementById("flop_like"+id).innerHTML="#LaPire ("+(like+1)+")";
              			document.getElementById("rand_like"+id).innerHTML="#LaPire ("+(like+1)+")";
              		},
            		error: function() {
              			alert('La requête n\'a pas abouti'); }
          		});      
      		});
		}
		function fctDislike (id, dislike) {
			if(localStorage['DislikedPost' + id] == 'true') 
			{
				document.getElementById("new_already_like"+id).innerHTML="Vous avez déjà voté <br>";
				document.getElementById("top_already_like"+id).innerHTML="Vous avez déjà voté <br>";
				document.getElementById("flop_already_like"+id).innerHTML="Vous avez déjà voté <br>";
				document.getElementById("rand_already_like"+id).innerHTML="Vous avez déjà voté <br>";
				return; // abort if already voted
			}
     		localStorage['DislikedPost' + id] = 'true';
			var phpLike ="btnDislike/"+id;
			$(function() {
          		$.ajax({
            		type: 'GET',
            		url: phpLike,
            		timeout: 3000,
            		success: function() {
              			document.getElementById("new_dislike"+id).innerHTML="Ma grand-mère fait pire ("+(dislike+1)+")";
              			document.getElementById("top_dislike"+id).innerHTML="Ma grand-mère fait pire ("+(dislike+1)+")";
              			document.getElementById("flop_dislike"+id).innerHTML="Ma grand-mère fait pire ("+(dislike+1)+")";
              			document.getElementById("rand_dislike"+id).innerHTML="Ma grand-mère fait pire ("+(dislike+1)+")";
              		},
            		error: function() {
              			alert('La requête n\'a pas abouti'); }
          		});      
      		});
		}
  	</script>



	
@endsection
	
	
	
	
	