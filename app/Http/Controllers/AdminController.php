<?php namespace App\Http\Controllers;

use App\Quote;
use App\Comment;
use Illuminate\Http\Request;


class AdminController extends Controller {

	public function __construct()
	{
		$this->middleware('admin');
	}
	

	public function getAdmin()
	{	
		return view('admin.indexAdmin');
	}

	public function getNewQuotes()
	{
		$new_quotes=Quote::whereNull('numero')->get();
		return view('admin.newQuotes')->with(array(
			'newQuotes'=> $new_quotes));
	}

	public function validerNewQuote($id)
	{
		$quote=Quote::find($id);

		if(!isset($quote))
			return redirect('admin/new-quotes')->with('alert_error',"Une erreur est survenue.");

		if(isset($quote->numero))
			return redirect('admin/new-quotes')->with('alert_error',"Une erreur est survenue.");

		$max=Quote::max('numero');

		$quote->numero=($max+1);
		$quote->save();

		return redirect('admin/new-quotes')->with('alert_success',"#Pire validée.");
	}

	public function supprimerQuote($id)
	{
		$quote=Quote::find($id);

		if(!isset($quote))
			return redirect('admin')->with('alert_error',"Une erreur est survenue.");

		$quote->comments()->delete();
		$quote->delete();

		return redirect('admin/new-quotes')->with('alert_success',"#Pire supprimée.");
	}

	public function modifierQuote($id)
	{
		$quote=Quote::find($id);

		if(!isset($quote))
			return redirect('admin')->with('alert_error',"Une erreur est survenue.");

		return view('admin.modifierQuote')->with(array(
			'quote'=> $quote));
	}

	public function postModifierQuote(Request $request)
	{
		$this->validate($request, [
		        'quote' => 'required|max:751',
	    	]);

		$id=e($request->input('id'));
		$quote=Quote::find($id);

		$quote->contenu='Hier, '.e($request->input('quote'));

		$quote->save();

		return redirect('admin/new-quotes')->with('alert_success',"#Pire modifiée.");

	}

	public function getParametres()
	{
		return view('admin.parametres');
	}

	public function postResearchQuote(Request $request)
	{
		$numero=e($request->input('quote'));

		if(empty($numero))
			return redirect('admin/new-quotes')->with('error_quote','Le champs ci-dessous est vide.');
		
		$quote=Quote::where('numero', $numero)->first();

		if(!isset($quote))
			return redirect('admin/new-quotes')->with('error_quote','Aucune quote avec ce numéro n\'est enregistrée');

		return view('admin.modifierQuote')->with(array(
			'quote'=> $quote));


	}

	public function deleteComment($id)
	{
		$comment=Comment::find($id);

		if(!isset($comment))
			return redirect('/')->with('alert_error', "Une erreur est survenue");

		$comment->modere=1;
		$comment->save();
		return redirect()->back();
	}

	public function validerComment($id)
	{
		$comment=Comment::find($id);

		if(!isset($comment))
			return redirect('/')->with('alert_error', "Une erreur est survenue");

		$comment->modere=0;
		$comment->save();
		return redirect()->back();
	}

}