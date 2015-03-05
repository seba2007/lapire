<?php namespace App\Http\Controllers;

use App\Quote;
use Auth;

class WelcomeController extends Controller {

	/*
	|--------------------------------------------------------------------------
	| Welcome Controller
	|--------------------------------------------------------------------------
	|
	| This controller renders the "marketing page" for the application and
	| is configured to only allow guests. Like most of the other sample
	| controllers, you are free to modify or remove it as you desire.
	|
	*/

	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		//$this->middleware('guest');
	}

	/**
	 * Show the application welcome screen to the user.
	 *
	 * @return Response
	 */
	public function index()
	{

		$nb=env('NB_QUOTES');
		$newQuotes=Quote::whereNotNull('numero')->orderBy('numero', 'DESC')->paginate($nb);
		$topQuotes=Quote::whereNotNull('numero')->orderBy('like', 'DESC')->paginate($nb);
		$flopQuotes=Quote::whereNotNull('numero')->orderBy('dislike', 'DESC')->paginate($nb);
		$randQuotes=Quote::whereNotNull('numero')->orderByRaw("RAND()")->paginate($nb);

		return view('index')->with(array(
			'newQuotes' => $newQuotes,
			'topQuotes' => $topQuotes,
			'flopQuotes'=> $flopQuotes,
			'randQuotes'=> $randQuotes
			));
	}

	public function btnLike($id)
	{	
		$quote=Quote::find($id);
		if(isset($quote))
		{
			$quote->like++;
			$quote->save();
		}	
	}

	public function btnDisLike($id)
	{
		$quote=Quote::find($id);
		if(isset($quote))
		{
			$quote->dislike++;
			$quote->save();
		}			
	}

}
