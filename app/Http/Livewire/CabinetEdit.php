<?php

namespace App\Http\Livewire;

use App\Constructor\helpers\BTRouter;
use App\Http\controllers\AdminCmsUsersController;
use Illuminate\Support\Facades\Request;
use LaravelViews\Views\DetailView;
use App\Models\User;
use App\Actions\ActivateUserAction;
use App\Actions\ListAction;
use LaravelViews\Actions\RedirectAction;
use LaravelViews\Facades\UI;
use Illuminate\Support\Facades\Route;

class CabinetEdit extends EditView
{
    protected $modelClass = \App\Models\Cabinet::class;

    public function heading(\App\Models\Cabinet $model)
    {
        return [
            //'', ''
            "Кабинет {$model->user->name}",
            "Профиль администратора",
        ];
    }

    /**
     * @param $model Model instance
     * @return Array Array with all the edit data or the components
     */
    public function edit($model)
    {
        /*return [
            'Имя' => $model->name,
            'Email' => $model->email,
            'Статус' => $model->status ? UI::icon('check', 'success') : UI::icon('slash', 'danger'),
            'Создан' => $model->created_at ? $model->created_at->diffForHumans() : '-',
            'Обновлен' => $model->updated_at ? $model->updated_at->diffForHumans() : '-',
        ];*/

        $cUser = new AdminCmsUsersController();
        $cUser->cbInit();
        //dd($cUser->getProfile());
        /*Route::get('/', function (\Illuminate\Http\Request $request) {
            return '';
        })->name('GetIndex');*/
        //$r = Route::getRoutes()->getByName('GetIndex');
        //dd(Route::getRoutes());
        //dd($model);

        //$path = Request::path();
        //if (config("crudbooster.ADMIN_PATH")) $path = config("crudbooster.ADMIN_PATH").'/'.$path;

        //dump(Request::path());
        //dd(config("crudbooster.ADMIN_PATH"));
        //config(['crudbooster.ADMIN_PATH' => '']);
        //BTRouter::route();
        //dd(config("crudbooster.ADMIN_PATH"));
        config(['crudbooster.ADMIN_PATH' => '']);

        if(Request::method() == 'POST') return $cUser->postEditSave($model->user_id);
        return $cUser->getEdit($model->user_id)->render();

        /*$id = $model->user_id;
        $row = $model;
        $page_menu = '';
        $page_title = '';
        $command = '';
        $forms = $cUser->form;
        $button_save = 'Сохранить';
        $button_cancel = 'Отмена';

        $html = view('crudbooster::include.form',
            compact('id', 'row', 'page_menu', 'page_title', 'command',
                'forms', 'button_save')
        );
        //dump($html);
        //dd($html->render());
        return $html;*/
    }

    public function actions()
    {
        return [
            //new ActivateUserAction,
        ];
    }
}
