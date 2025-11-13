<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MahasiswaController;

Route::apiResource('mahasiswas', MahasiswaController::class);
