<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cabinet extends Model
{
    protected $table = 'cabinet';

    public $timestamps = false;

    use HasFactory;

    /**
     * Get the user that owns the cabinet.
     */
    public function users()
    {
        return $this->belongsTo(Users::class, 'users_id', 'id');
        //return $this->hasOne(Users::class);
    }
}
