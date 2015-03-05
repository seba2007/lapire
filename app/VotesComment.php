<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class VotesComment extends Model {

	 protected $table = 'votescomments';

	public function comment()
    {
        return $this->hasOne('App\Comment');
    }

    public function user()
    {
        return $this->hasOne('App\User');
    }

}