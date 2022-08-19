<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {

    Route::get('/dashboard', function () {
        //dump(Auth::user());
        //return view('crudbooster::home');
        return view('home');
        //return redirect('/home');
    })->name('dashboard');

    Route::get('/', function () {
        return view('home');
    })->name('GetIndex');

    Route::get('/cabinets', function () {
        //dump(Auth::user());
        //return view('crudbooster::home');
        return view('liveware', [
            'title' => 'Личные кабинеты',
            'live' => 'cabinet-table-view',
            'route' => 'cabinet-new',
            'name' => 'Создать'
        ]);
        //return redirect('/home');
    })->name('cabinets');

    Route::get('/cabinets/edit/{cabinet}', function (\App\Models\Cabinet $cabinet) {
        //dd($cabinet);
        //dump(Auth::user());
        //return view('crudbooster::home');
        return view('liveware', [
            'title' => 'Кабинет: '.$cabinet->user->name,
            'live' => 'cabinet-edit',
            'route' => 'cabinets',
            'name' => 'Вернуться',
            'model' => $cabinet,
        ]);
        //return redirect('/home');
    })->scopeBindings()->name('cabinet-edit');

    Route::post('/cabinets/edit/{cabinet}', function (\App\Models\Cabinet $cabinet) {
        //dump(Auth::user());
        //return view('crudbooster::home');
        return view('liveware', [
            'title' => 'Кабинет: '.$cabinet->user->name,
            'live' => 'cabinet-edit',
            'route' => 'cabinets',
            'name' => 'Вернуться',
            'model' => $cabinet,
        ]);
        //return redirect('/home');
    })->scopeBindings()->name('cabinet-edit');

    Route::get('/cabinets/add', function () {
        return view('liveware', [
            'title' => 'Личные кабинеты',
            'model' => 'cabinet-table-view',
            'route' => 'cabinets',
            'name' => 'Вернуться'
        ]);
    })->name('cabinet-new');

    //dump(__('Search'));
    //dump(Auth::user());

    require_once __DIR__.'/../app/Constructor/routes.php';
});

