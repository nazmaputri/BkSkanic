<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Submission extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama',
        'email',
        'nama_siswa',
        'masalah', 
        'kelas', 
        'deskripsi', 
        'sebagai'
    ];
}
