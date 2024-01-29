<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_users')->references('id')->on('users')->cascadeOnDelete();
            $table->string('name');
            $table->string('email');
            $table->string('no_telepon');
            $table->date('date_booking');
            $table->string('problem');
            $table->string('option');
            $table->string('consultation'); 
            $table->date('booking_date');
            $table->string('booking_start');
            $table->string('booking_end');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bookings');
    }
};
