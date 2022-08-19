<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cabinet extends Model
{
    protected $table = 'cabinet';

    use HasFactory;

    /**
     * Get the user that owns the cabinet.
     */
    public function user()
    {
        return $this->belongsTo(UserAdmin::class);
    }
}
