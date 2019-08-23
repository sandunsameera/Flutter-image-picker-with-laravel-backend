<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class photo extends Model
{
    protected $table = 'photos';
    protected $fillable = ['date'];
    protected $nullable = ['description'];

}
