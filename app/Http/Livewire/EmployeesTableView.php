<?php

namespace App\Http\Livewire;

use LaravelViews\Views\TableView;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Users;
use LaravelViews\Facades\Header;
use LaravelViews\Facades\UI;
use App\Actions\ActivateUserAction;
use App\Actions\ActivateUsersAction;
use App\Actions\DeleteUserAction;
use App\Actions\DeleteUsersAction;
use LaravelViews\Views\Traits\WithAlerts;
use App\Filters\UsersActiveFilter;
use LaravelViews\Actions\RedirectAction;

class EmployeesTableView extends TableView
{
    use WithAlerts;

    protected $num = 1;
    protected $model = Users::class;

    protected $paginate = 20;

    //public $searchBy = ['users.name', 'users.phone', 'users_profiles.comment', 'users_profiles.city', 'cabinet.users.name'];
    public $searchBy = ['users.name', 'users.phone', 'users_profiles.comment', 'users_profiles.city'];

    public function headers(): array
    {
        return [
            '#',
            //Header::title('ID')->sortBy('id'),
            Header::title('ФИО')->sortBy('name'),
            Header::title('Телефон')->sortBy('phone'),
            Header::title('Администратор')->sortBy('admin_name'),
            Header::title('Город')->sortBy('city'),
            Header::title('Комментарий')->sortBy('comment'),
            Header::title('Статус')->sortBy('status'),
            Header::title('Дата')->sortBy('black_at'),
        ];
    }

    /**
     * Sets a initial query with the data to fill the table
     *
     * @return Builder Eloquent query
     */
    public function repository(): Builder
    {
        return Users::query()
            ->select(['users.*', 'users_profiles.*', 'cabinet.*', 'admin.name as admin_name'])
            //->select(['users.*', 'users_profiles.*', 'cabinet.*'])
            ->where('users.id_cms_privileges', 2)
            ->join('users_profiles', 'users.id', '=', 'users_profiles.users_id')
            ->join('cabinet', 'users.cabinet_id', '=', 'cabinet.id')
            ->join('users as admin', 'cabinet.user_id', '=', 'admin.id')
            ->applyScopes();
    }

    public function row(Users $users)
    {
        //dd($users->cabinet);
        $status = match ($users->status) {
            0 => 'check',
            -1 => 'check',
            -20 => 'alert-octagon',
            default => 'alert-circle'
        };
        $class = match ($users->status) {
            0 => 'success',
            -1 => 'warning',
            -20 => 'danger',
            default => 'default'
        };
        $date = '';
        if ($users->status < -1) $date = date(' d.m.Y', $users->black_at);

        return [
            ($this->page -  1) * $this->paginate + $this->num++,
            //$user->id,
            UI::link($users->name, route('cabinets', $users)),
            $users->phone,
            $users->cabinet->users->name,
            $users->city,
            //UI::editable($user, 'phone'),
            $users->comment,
            UI::icon($status, $class),
            $date,
            //$model->created_at,
            //$model->updated_at
        ];
    }

    /** For actions by item */
    protected function actionsByRow()
    {
        return [
            //new ActivateUserAction,
            //new DeleteUserAction,
            //new RedirectAction('cabinets', 'Просмотр', 'eye'),
        ];
    }

    /** For bulk actions */
    protected function bulkActions()
    {
        return [
            //new ActivateUsersAction,
            //new DeleteUsersAction,
        ];
    }

    /**
     * Method fired by the `editable` component, it
     * gets the model instance and a key-value array
     * with the modified dadta
     */
    public function update(Users $user, $data)
    {
        $user->update($data);
        $this->success();
    }

    protected function filters()
    {
        return [
            new UsersActiveFilter,
            //new CreatedFilter,
            //new UsersTypeFilter
        ];
    }
}
