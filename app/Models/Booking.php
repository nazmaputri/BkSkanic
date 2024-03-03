<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $fillable = [
        'id_users', 'booking_start', 'booking_end','name','email','no_telepon','problem','option','booking_date','consultation','status'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'id_users');
    }
}
        