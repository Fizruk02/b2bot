<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;

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
            'route' => 'cabinet-add',
            'name' => 'Создать'
        ]);
        //return redirect('/home');
    })->name('cabinets');

    Route::get('/cabinets/edit/{cabinet}', function (\App\Models\Cabinet $cabinet) {
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

    Route::get('/cabinets/plus/{cabinet}', function (\App\Models\Cabinet $cabinet) {
        $dateAt = strtotime('+'.request()->get('plus').' MONTH', strtotime($cabinet->finish_at));
        $cabinet->finish_at = date('Y-m-d H:i:s', $dateAt);
        $cabinet->save();
        session()->flash('success', 'Кабинет '.$cabinet->name.' продлен.');
        return redirect()->back();
    })->name('cabinet-plus');

    Route::get('/cabinets/add', function () {
        $cabinet = new \App\Models\Cabinet();
        $cabinet->user = new \App\Models\UserAdmin();
        return view('liveware', [
            'title' => 'Новый кабинет',
            'live' => 'cabinet-edit',
            'route' => 'cabinets',
            'name' => 'Вернуться',
            'model' => $cabinet,
        ]);
    })->name('cabinet-add');

    Route::post('/cabinets/add', function () {
        $cabinet = new \App\Models\Cabinet();
        $cabinet->user = new \App\Models\UserAdmin();
        return view('liveware', [
            'title' => 'Новый кабинет',
            'live' => 'cabinet-edit',
            'route' => 'cabinets',
            'name' => 'Вернуться',
            'model' => $cabinet,
        ]);
    })->name('cabinet-add');

    Route::get('/statictics', function () {
        return view('liveware', [
            'title' => 'Статистика',
            'live' => 'page',
            'route' => 'dashboard',
            'name' => 'Главная',
            'model' => new \App\Models\WebPages(),
        ]);
    })->name('statictics');

    Route::get('/users', function () {
        $page = new \App\Models\WebPages();
        $page->params = [
            'cur' => 0,
            'buttons' => [
                ['name' => 'Все пользователи', 'link' => '/users'],
                ['name' => 'Забанненые пользователи', 'link' => '/users-ban'],
                ['name' => 'Черный список', 'link' => '/users-black']
            ],
        ];
        return view('liveware', [
            'title' => 'Пользователи',
            'live' => 'page',
            'route' => 'dashboard',
            'name' => 'Главная',
            'model' => $page,
        ]);
    })->name('users');

    Route::get('/users-ban', function () {
        $page = new \App\Models\WebPages();
        $page->params = [
            'cur' => 1,
            'buttons' => [
                ['name' => 'Все пользователи', 'link' => '/users'],
                ['name' => 'Забанненые пользователи', 'link' => '/users-ban'],
                ['name' => 'Черный список', 'link' => '/users-black']
            ],
        ];
        return view('liveware', [
            'title' => 'Забанненые пользователи',
            'live' => 'page',
            'route' => 'dashboard',
            'name' => 'Главная',
            'model' => $page,
        ]);
    })->name('users-ban');

    Route::get('/users-black', function () {
        $page = new \App\Models\WebPages();
        $page->params = [
            'cur' => 2,
            'buttons' => [
                ['name' => 'Все пользователи', 'link' => '/users'],
                ['name' => 'Забанненые пользователи', 'link' => '/users-ban'],
                ['name' => 'Черный список', 'link' => '/users-black']
            ],
        ];
        return view('liveware', [
            'title' => 'Черный список',
            'live' => 'page',
            'route' => 'dashboard',
            'name' => 'Главная',
            'model' => $page,
        ]);
    })->name('users-black');











    Route::get('/request', function () {
        $page = new \App\Models\WebPages();
        return view('liveware', [
            'title' => 'Заявки',
            'live' => 'page',
            'route' => 'dashboard',
            'name' => 'Главная',
            'model' => $page,
        ]);
    })->name('request');

    Route::get('/orders', function () {
        $page = new \App\Models\WebPages();
        return view('liveware', [
            'title' => 'Заказы',
            'live' => 'page',
            'route' => 'dashboard',
            'name' => 'Главная',
            'model' => $page,
        ]);
    })->name('orders');

    Route::get('/employees', function () {
        $page = new \App\Models\WebPages();
        return view('liveware', [
            'title' => 'Сотрудники',
            'live' => 'page',
            'route' => 'dashboard',
            'name' => 'Главная',
            'model' => $page,
        ]);
    })->name('employees');

    Route::get('/clients', function () {
        $page = new \App\Models\WebPages();
        return view('liveware', [
            'title' => 'Клиенты',
            'live' => 'page',
            'route' => 'dashboard',
            'name' => 'Главная',
            'model' => $page,
        ]);
    })->name('clients');

    Route::get('/news', function () {
        $page = new \App\Models\WebPages();
        return view('liveware', [
            'title' => 'Новости',
            'live' => 'page',
            'route' => 'dashboard',
            'name' => 'Главная',
            'model' => $page,
        ]);
    })->name('news');


    Route::get('/accounting', function () {
        $page = new \App\Models\WebPages();
        return view('liveware', [
            'title' => 'Бухгалтерия',
            'live' => 'page',
            'route' => 'dashboard',
            'name' => 'Главная',
            'model' => $page,
        ]);
    })->name('accounting');

    Route::get('/settings', function () {
        $page = new \App\Models\WebPages();
        return view('liveware', [
            'title' => 'Настройки',
            'live' => 'page',
            'route' => 'dashboard',
            'name' => 'Главная',
            'model' => $page,
        ]);
    })->name('settings');

    //dump(__('Search'));
    //dump(Auth::user());

    require_once __DIR__.'/../app/Constructor/routes.php';
});

