<?php

namespace App\Http\Livewire;

use LaravelViews\Views\TableView;
use Illuminate\Database\Eloquent\Builder;
use App\Models\UserAdmin;
use LaravelViews\Facades\Header;
use LaravelViews\Facades\UI;
use App\Actions\ActivateUserAction;
use App\Actions\ActivateUsersAction;
use App\Actions\DeleteUserAction;
use App\Actions\DeleteUsersAction;
use LaravelViews\Views\Traits\WithAlerts;
use App\Filters\UsersActiveFilter;
use LaravelViews\Actions\RedirectAction;

class CabinetTableView extends TableView
{
    use WithAlerts;

    protected $num = 1;
    protected $model = UserAdmin::class;

    protected $paginate = 20;

    public $searchBy = ['name', 'phone'];

    public function headers(): array
    {
        return [
            '#',
            //Header::title('ID')->sortBy('id'),
            Header::title('ФИО')->sortBy('name'),
            Header::title('Телефон')->sortBy('phone'),
            Header::title('Дата окончания')->sortBy('cabinet.finish_at'),
        ];
    }

    public function row(UserAdmin $user)
    {
        return [
            ($this->page -  1) * $this->paginate + $this->num++,
            //$user->id,
            UI::link($user->name, route('cabinet-edit', $user)), //$user->name,
            //UI::editable($user, 'email'),
            //$user->email,
            //$user->phone,
            UI::editable($user, 'phone'),
            //$user->status ? UI::icon('check', 'success') : '',
            //$user->created_at,
            //$user->updated_at
            @$user->finish_at,
        ];
    }

    /**
     * Sets a initial query with the data to fill the table
     *
     * @return Builder Eloquent query
     */
    public function repository(): Builder
    {
        //return UserAdmin::query();
        return UserAdmin::query()
            ->join('cabinet', 'users.id', '=', 'cabinet.user_id')
            ->where('id_cms_privileges', 3)
            ->applyScopes();
    }

    /** For actions by item */
    protected function actionsByRow()
    {
        return [
            new ActivateUserAction('shield', 'Продлить', 'shield'),
            new DeleteUserAction,
            //new RedirectAction('cabinets', 'Просмотр', 'eye'),
        ];
    }

    /** For bulk actions */
    protected function bulkActions()
    {
        return [
            new ActivateUsersAction,
            new DeleteUsersAction,
        ];
    }

    /**
     * Method fired by the `editable` component, it
     * gets the model instance and a key-value array
     * with the modified dadta
     */
    public function update(UserAdmin $user, $data)
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
