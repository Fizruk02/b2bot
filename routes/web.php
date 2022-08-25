<?php

use App\Models\Users;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Tests\TestCase;
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
    Route::get('/employees_generate', function () {
        $fs = [
            'Зайцев', 'Зайцева', 'Лисицын', 'Волков', 'Медведев', 'Куницын', 'Сапожников', 'Лосев', 'Жирафов', 'Зебрин',
            'Обезьянов', 'Волчков', 'Белкин', 'Ослов', 'Лошадкин', 'Коровин', 'Собакин', 'Кошкин', 'Крысин'
        ];
        $ns = [
            'Андрей', 'Алексей', 'Иван', 'Василий', 'Федор', 'Роман', 'Сергей', 'Марат', 'Ринат', 'Дмитрий', 'Ив',
            'Ростислав', 'Ярослав', 'Евгений', 'Михаил', 'Альберт', 'Кузьма', 'Илья', 'Данил', 'Ришат', 'Джон',
            'Арнольд', 'Джорж', 'Юрий', 'Нурым'
        ];
        $os = [
            'Андреевич', 'Алексеевич', 'Иванович', 'Васильевич', 'Федорович', 'Романович', 'Сергеич', 'Маратович',
            'Ринатович', 'Дмитриевич', 'Ивич', 'Ростиславович', 'Ярославович', 'Евгеньевич', 'Михайлович', 'Альбертович',
            'Кузьмич', 'Ильич', 'Данилович', 'Ришатович', 'Джонсович',
            'Арнольдович', 'Джоржович', 'Юриьевич', 'Нурымович'
        ];
        for ($u = 0; $u < 100; $u++) {
            $f = $fs[rand(0, count($fs)-1)];
            $i = $ns[rand(0, count($ns)-1)];
            $o = $os[rand(0, count($os)-1)];
            $fio = $f.' '.$i.' '.$o;
            $status = [-1,0,0,0,-10, -20];
            $cabinet = [1,3,6,9];

            $gen = new \Faker\Generator();
            $user = \App\Models\User::factory(1)->create([
                'status' => $status[rand(0, count($status) - 1)],
                'name' => $fio,
                'id_cms_privileges' => 2,
                'cabinet_id' => $cabinet[rand(0, count($cabinet) - 1)],
                'is_deleted' => rand(0, 10) == 9 ? 1 : 0,
                'phone' => $gen->numberBetween(70000000000, 79999999999),
            ]);
            $profile = new \App\Models\UsersProfiles();
            $is_worker = rand(0, 5) == 4 ? 1 : 0;
            $special = [
                '',
                'Дворник',
                'Верстальщик',
                'Носильщик',
                'Программист',
                'Тестировщик',
                'Директор',
                'Начальника',
                'Грузчик',
                'Экономист',
                'Водитель',
            ];
            $children = [
                '',
                '',
                '',
                '',
                '',
                '',
                '-',
                'нет',
                'двое',
                'сын',
                'дочь',
                'сын и дочь',
                'трое',
            ];
            $experience = [
                '',
                '-',
                'нет',
                'год',
                '5 лет',
                'с рождения',
                'всю жизнь',
            ];
            $district = [
                '',
                'Южный',
                'Северный',
                'Западный',
                'Восточный',
                'Центральный'
            ];
            $comment = [
                '',
                'Прогуливает',
                'Плохой работник',
                'Хилый',
                'Редко ходит',
                'Бухает',
                'Часто болеет',
                'Хороший работник',
                'Молодец',
            ];
            $city = ['Москва', 'Питер'];

            $id = DB::table('users_profiles')->insertGetId([
                //'id' => null,
                'users_id' => $user[0]->id,
                'f' => $f,
                'i' => $i,
                'o' => $o,
                'birthday_at' => rand(335883944, 1661259945),
                'special' => $special[rand(0, count($special) - 1)],
                'is_rf' => rand(0, 10) == 9 ? 1 : 0,
                'is_worker' => $is_worker,
                'work' => $is_worker ? rand(8,12).' '.rand(15,20) : '',
                'family' => rand(0,1),
                'children' => $children[rand(0, count($children) - 1)],
                'times' => rand(8,12).' '.rand(15,20),
                'experience' => $experience[rand(0, count($experience) - 1)],
                'is_criminal' => rand(0, 10) == 9 ? 1 : 0,
                'is_car' => rand(0, 2) == 1 ? 1 : 0,
                'city' => $city[rand(0, count($city) - 1)],
                'district' => $district[rand(0, count($district) - 1)],
                'passport' => $gen->numberBetween(10, 99).' '.$gen->numberBetween(10, 99).' '.$gen->numberBetween(100000, 999999),
                'snils' => $gen->numberBetween(100, 999).' '.$gen->numberBetween(100, 999).' '.$gen->numberBetween(100, 999).' '.$gen->numberBetween(10, 99),
                'comment' => $comment[rand(0, count($comment) - 1)],
            ]);
        }
    })->name('employees_generate');

    Route::get('/cabinet_generate', function () {
        $fields = \App\Models\OrdersFields::query()->whereRaw('cabinet_id IS NULL')->orderBy('sort')->get();
        //dd($fields);
        $cabinets = \App\Models\Cabinet::all();
        foreach ($cabinets as $cab) {
            dump($cab->toArray());
            foreach ($fields as $f) {
                //dd($f);
                $data = $f->toArray();
                $data['id'] = null;
                $data['cabinet_id'] = $cab->id;
                \App\Models\OrdersFields::insertGetId($data);
                //$id = DB::table($f->table)->insertGetId($data);
                dump($f->toArray());
            }
        }
    })->name('cabinet_generate');

    Route::get('/test', function () {
        $u = Users::with(['cabinet', 'users_profiles'])->where('id', 156)->first();
        dump($u);
    });

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
            'name' => 'Создать',
            'icon' => 'plus',
            'ico_class' => 'text-green-600'
        ]);
        //return redirect('/home');
    })->name('cabinets');

    Route::get('/cabinets/edit/{cabinet}', function (\App\Models\Cabinet $cabinet) {
        //dump(Auth::user());
        //return view('crudbooster::home');
        return view('liveware', [
            'title' => 'Кабинет: '.$cabinet->users->name,
            'live' => 'cabinet-edit',
            'route' => 'cabinets',
            'name' => 'Список кабинетов',
            'model' => $cabinet,
            'icon' => 'list',
            'ico_class' => 'text-gray-600'
        ]);
        //return redirect('/home');
    })->scopeBindings()->name('cabinet-edit');

    Route::post('/cabinets/edit/{cabinet}', function (\App\Models\Cabinet $cabinet) {
        //dd($cabinet);
        //dump(Auth::user());
        //return view('crudbooster::home');
        return view('liveware', [
            'title' => 'Кабинет: '.$cabinet->users->name,
            'live' => 'cabinet-edit',
            'route' => 'cabinets',
            'name' => 'Список кабинетов',
            'model' => $cabinet,
            'icon' => 'list',
            'ico_class' => 'text-gray-600'
        ]);
        //return redirect('/home');
    })->scopeBindings()->name('cabinet-edit');

    Route::get('/cabinets/plus/{cabinet}', function (\App\Models\Cabinet $cabinet) {
        $dateAt = strtotime('+'.request()->get('plus').' MONTH', strtotime($cabinet->finish_at));
        $cabinet->finish_at = date('Y-m-d H:i:s', $dateAt);
        $cabinet->save();
        session()->flash('success', 'Кабинет '.$cabinet->users->name.' продлен.');
        return redirect()->back();
    })->name('cabinet-plus');

    Route::get('/cabinets/add', function () {
        $cabinet = new \App\Models\Cabinet();
        $cabinet->users = new \App\Models\UserAdmin();
        return view('liveware', [
            'title' => 'Новый кабинет',
            'live' => 'cabinet-edit',
            'route' => 'cabinets',
            'name' => 'Список кабинетов',
            'model' => $cabinet,
            'icon' => 'list',
            'ico_class' => 'text-gray-600'
        ]);
    })->name('cabinet-add');

    Route::post('/cabinets/add', function () {
        $cabinet = new \App\Models\Cabinet();
        $cabinet->users = new \App\Models\UserAdmin();
        return view('liveware', [
            'title' => 'Новый кабинет',
            'live' => 'cabinet-edit',
            'route' => 'cabinets',
            'name' => 'Список кабинетов',
            'model' => $cabinet,
            'icon' => 'list',
            'ico_class' => 'text-gray-600'
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
            'live' => 'employees-table-view',
            'route' => 'dashboard',
            'name' => '',
            'model' => $page,
        ]);
    })->name('users');

    Route::get('/users/view/{users}', function (\App\Models\Users $users) {
        //dump(Auth::user());
        //return view('crudbooster::home');
        return view('liveware', [
            'title' => 'Сотрудник',//.$users->name,
            'live' => 'users-detail-view',
            'route' => 'users',
            'name' => 'Список пользователей',
            'model' => $users,
        ]);
        //return redirect('/home');
    })->scopeBindings()->name('users-view');

    /*Route::get('/users-ban', function () {
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
    })->name('users-black');*/











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

