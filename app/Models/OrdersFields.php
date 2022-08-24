<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrdersFields extends Model
{
    protected $table = 'orders_fields';

    public $timestamps = false;

    use HasFactory;
}
