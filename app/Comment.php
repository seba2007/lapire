<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model {

	 protected $table = 'comments';

	public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function quote()
    {
        return $this->belongsTo('App\Quote');
    }

    public function votesComment()
    {
        return $this->hasMany('App\VotesComment');
    }

}
