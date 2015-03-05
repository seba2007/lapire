<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!-- Consider adding a manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!--> <html class="no-js" lang="fr"> <!--<![endif]-->
<head>
  <meta charset="utf-8">

  <title>#LaPire</title>
  <meta name="description" content="">

  <!-- Mobile viewport optimized: h5bp.com/viewport -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Place favicon.ico and apple-touch-icon.png in the root directory: mathiasbynens.be/notes/touch-icons -->
  


  
  {!! HTML::style('css/style.css') !!}
  {!! HTML::style('css/bootstrap.css') !!}
  {!! HTML::style('css/bootstrap-responsive.css') !!}
  {!! HTML::style('js/fancybox/jquery.fancybox-1.3.4.css') !!}
  {!! HTML::style('css/responsive.css') !!}

  
  
  
  <link href='http://fonts.googleapis.com/css?family=Lato:700' rel='stylesheet' type='text/css'>

  <!-- More ideas for your <head> here: h5bp.com/d/head-Tips -->

  <!-- All JavaScript at the bottom, except this Modernizr build.
       Modernizr enables HTML5 elements & feature detects for optimal performance.
       Create your own custom Modernizr build: www.modernizr.com/download/ -->

    {!! HTML::script('js/modernizr-2.5.3.min.js') !!}
  
  
</head>
<body id="top-section" data-spy="scroll" data-target="#topnav"  data-offset="70" >


<div class="container">

  <header>

	<!-- navbar -->
	<div id="topnav" class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				
				<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
      
				<!-- Collapse - Everything you want hidden at 940px or less, place within here -->
      			<div class="nav-collapse">
					<!-- Main nav -->
					<ul  class="nav">
						<li><a href="{!! URL::to('admin') !!}">Admin - Home</a></li>
						<li><a href="{!! URL::to('admin/new-quotes') !!}">Gérer les #Pires ({!! $nbQuotes !!} nouvelles)</a></li>
						<li><a href="{!! URL::to('admin/parametres') !!}">Paramètres</a></li>

					</ul>

					<!-- ENDS main nav -->
				
				
					<!-- social -->
					<ul class="nav pull-right ">
						<li >
							<a href="{!! URL::to('/') !!}">Retour au site</a>
						</li>
					</ul><!-- ENDS Social -->
				
				</div><!-- ENDS Collapse -->
				
			</div>
		</div>
	</div><!-- ENDS navbar -->

	</header>

	<!-- MAIN -->
	<div id="main" role="main">
		<noscript>
			<div class="alert alert-error">
				Vous devez activer javascript pour que le site fonctionne correctement.
				<br>
				<a href="http://www.enable-javascript.com/fr" target="_blank" title="activer javascript">Plus d'info ici</a>
			</div>
		</noscript>
		@if(Session::has('alert_success'))
			<div class="alert alert-success">
				{!! Session::get('alert_success') !!}
			</div>
		@endif
		@if(Session::has('alert_error'))
			<div class="alert alert-error">
				{!! Session::get('alert_error') !!}
			</div>
		@endif
		
		@yield('content')
	</div><!-- ENDS MAIN -->

	<footer>
		<hr/>
		<p>Get more freebies at <a href="http://www.luiszuno.com" >luiszuno.com</a></p>
	</footer>
  
</div>

  <!-- JavaScript at the bottom for fast page loading -->

  <!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

    <script>window.jQuery || document.write('<script src="js/jquery-1.7.1.min.js"><\/script>')</script>

  <!-- scripts concatenated and minified via build script -->
  {!! HTML::script('js/plugins.js') !!}
  {!! HTML::script('js/bootstrap-dropdown.js') !!}
  {!! HTML::script('js/bootstrap-scrollspy.js') !!}
  {!! HTML::script('js/bootstrap-tab.js') !!}
  {!! HTML::script('js/bootstrap-collapse.js') !!}
  {!! HTML::script('js/fancybox/jquery.fancybox-1.3.4.pack.js') !!}
  {!! HTML::script('js/form-validation.js') !!}
  {!! HTML::script('js/custom.js') !!}
  
  


  <!-- end scripts -->

</body>
</html>