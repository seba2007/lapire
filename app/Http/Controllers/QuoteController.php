<?php namespace App\Http\Controllers;

use App\Quote;
use App\Comment;
use App\VotesComment;
use App\Parametre;
use Auth;
use Illuminate\Http\Request;
use DateTime;


class QuoteController extends Controller {

	public function getQuote($id)
	{
		$number_1 = rand(1, 9);
        $number_2 = rand(1, 9);
        $answer = substr(md5($number_1+$number_2),5,10);

		$quote=Quote::find($id);
		return view('quotes.quote')->with(array(
			'quote'=>$quote,
			'number_1'=>$number_1,
			'number_2'=>$number_2,
			'answer'=>$answer
			));
	}

	public function getVote($type, $id)
	{	
		$notConnected='nc';
		$alreadyVoted='av';
		$success='success';

		if(!Auth::check())
			return $notConnected;

		$comment=Comment::find($id);

		if(isset($comment))
		{
			$user=Auth::user();
			$vote=VotesComment::where('user_id',$user->id)->where('comment_id', $comment->id)->first();
			if(isset($vote))
				return $alreadyVoted;

			$vote = new VotesComment;
			$vote->user_id=$user->id;
			$vote->comment_id=$comment->id;

			if($type=='like')
				$comment->like++;
			else
				$comment->dislike++;

			$vote->save();
			$comment->save();

			return $success;
		}
	}

	public function postComment(Request $request,$answer)
	{
		$this->validate($request, [
        'comment' => 'required|min:3|max:400',
        'calcul'  => "required"
    	]);

		$idQuote=e($request->input('idQuote'));
		$contenu=e($request->input('comment'));
		$result=e($request->input('calcul'));
		$result = substr(md5($result),5,10);
		

		if($answer != $result)
			return redirect("quote/$idQuote")->withInput($request->except('calcul'))->with('error_calcul',"Le calcul est incorrect.");


		$quote=Quote::find($idQuote);
		if(!isset($quote))
			return redirect("/")->with('alert_error',"Une erreur est survenue.");

		$comment= new Comment;
		$comment->user_id=Auth::user()->id;
		$comment->quote_id=$idQuote;
		$comment->contenu=$contenu;
		$comment->like=0;
		$comment->dislike=0;
		$comment->save();

		return redirect("quote/$idQuote")->with('alert_success','Votre commentaire a été posté.');
	}

	public function getSubmitQuote()
	{
		return view('quotes.submit');
	}

	public function postSubmitQuote(Request $request)
	{
		$param=Parametre::find(1);
		$ip=$_SERVER['REMOTE_ADDR'];
		$timeRepost= $param->timeRepost;

		$quote=Quote::where('ip',$ip)->orderBy('id', 'DESC')->first();

		if(isset($quote))
		{
			$today=strtotime("now");
			$last=strtotime($quote->created_at);
			$tps=($today-$last)/60;
			if($tps<$timeRepost)
			{
				$tps=$timeRepost-$tps;
				$tps=round($tps);
				return redirect('submit-quote')->withInput()->with('error_tps',"Vous devez attendre au moins $timeRepost minutes avant de poster à nouveau.<br>
					Encore $tps minute(s).<br>
					Merci de votre comprehension.");
			}
		}
		

		$this->validate($request, [
		        'quote' => 'required|max:751',
	    	]);

		$quote = New Quote;
		$quote->contenu="Hier, ".e($request->quote);
		$quote->like=0;
		$quote->dislike=0;
		$quote->ip=$ip;

		if(!Auth::check() || $request->input('anonyme')==true)
			$quote->auteur="Anonyme";
		else
			$quote->auteur=Auth::user()->pseudo;

		$quote->save();

		return redirect('submit-quote')->with('alert_success',"Merci pour ta #Pire. Elle sera analysée par un administrateur avant d'être publiée.");

	}

}