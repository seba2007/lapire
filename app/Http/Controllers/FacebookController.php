<?php namespace App\Http\Controllers;
use App\Profile;
use App\User;
use Facebook;
use Config;
use Illuminate\Http\Request;
use Auth;

class FacebookController extends Controller {

	public function loginFb()
	{
		$facebook = new Facebook(Config::get('facebook'));
    	$params = array(
        'redirect_uri' => url('auth/login/fb/callback'),
        'scope' => 'email',
    	);
    	return redirect($facebook->getLoginUrl($params));
	}

	public function loginFbCallback(Request $request)
	{
		$code = $request->input('code');
	    if (strlen($code) == 0) return redirect('/')->with('message', 'There was an error communicating with Facebook');

	    $facebook = new Facebook(Config::get('facebook'));
	    $uid = $facebook->getUser();

	    if ($uid == 0) return redirect('/')->with('message', 'There was an error');

	    $me = $facebook->api('/me');

	    $profile = Profile::whereUid($uid)->first();
	    if (empty($profile)) {

	        $user = new User;
	        $user->pseudo = $me['first_name'].' '.$me['last_name'];
	        $user->email = $me['email'];
	        $user->facebook = 1;

	        $user->save();



	        $profile = new Profile();
	        $profile->uid = $uid;
	        $profile->username = $me['name'];
	        $profile->user_id=$user->id;
	        $profile = $user->profiles()->save($profile);
	    }

	    $profile->access_token = $facebook->getAccessToken();
	    $profile->save();

	    $user = $profile->user;

	    Auth::login($user);

	    return redirect('/')->with('alert_success',"Vous êtes maintenant connecté avec votre compte Facebook.");
	}
}