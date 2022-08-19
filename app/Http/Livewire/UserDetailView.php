<?php

namespace App\Http\Livewire;

use LaravelViews\Views\DetailView;
use App\Models\User;
use App\Actions\EditUserAction;
use LaravelViews\Actions\RedirectAction;
use LaravelViews\Facades\UI;

class UserDetailView extends DetailView
{
    //public $title = "Title";
    //public $subtitle = "Subtitle or description";

    protected $modelClass = \App\Models\User::class;

    public function heading(User $model)
    {
        //dd($model);
        return [
            "Администратор {$model->name}",
            "Профиль пользователя",
        ];
    }

    /**
     * @param $model Model instance
     * @return Array Array with all the detail data or the components
     */
    public function detail($model)
    {
        return [
            'Имя' => $model->name,
            'Email' => $model->email,
            'Статус' => $model->status ? UI::icon('check', 'success') : UI::icon('slash', 'danger'),
            'Создан' => $model->created_at ? $model->created_at->diffForHumans() : '-',
            'Обновлен' => $model->updated_at ? $model->updated_at->diffForHumans() : '-',
        ];
    }

    public function actions()
    {
        return [
            //new EditUserAction,
            new RedirectAction('admin-user-edit', 'Редактировать', 'edit'),
            new RedirectAction('admin-users', 'Список пользователей', 'list'),
        ];
    }
}
