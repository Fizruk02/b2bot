<?php

namespace App\Http\Livewire;

use App\Actions\DeleteCabinetAction;
use App\Actions\DeleteCabinetsAction;
use App\Models\Cabinet;
use LaravelViews\Actions\Action;
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
use LaravelViews\Views\View;

class CabinetTableView extends TableView
{
    use WithAlerts;

    protected $num = 1;
    protected $model = Cabinet::class;

    protected $paginate = 20;

    public $searchBy = ['users.name', 'users.phone'];

    public function headers(): array
    {
        return [
            '#',
            //Header::title('ID')->sortBy('id'),
            Header::title('ФИО')->sortBy('users.name'),
            Header::title('Телефон')->sortBy('users.phone'),
            Header::title('Дата окончания')->sortBy('finish_at'),
            Header::title('Продлить работу кабинета'),
        ];
    }

    public function row(Cabinet $cabinet)
    {
        return [
            ($this->page -  1) * $this->paginate + $this->num++,
            //$user->id,
            UI::link($cabinet->user->name, route('cabinet-edit', $cabinet->id)), //$user->name,
            //UI::editable($user, 'email'),
            //$user->email,
            //$cabinet->user->phone,
            UI::editable($cabinet, 'phone'),
            //$user->status ? UI::icon('check', 'success') : '',
            //$user->created_at,
            //$user->updated_at
            date('d.m.Y', strtotime($cabinet->finish_at)),

            '<a href="'.route('cabinet-plus', $cabinet->id).'?plus=1">'.UI::badge('месяц').'</a> '.
            '<a href="'.route('cabinet-plus', $cabinet->id).'?plus=3">'.UI::badge('3 месяца').'</a> '.
            '<a href="'.route('cabinet-plus', $cabinet->id).'?plus=6">'.UI::badge('6 месяцев').'</a> '.
            '<a href="'.route('cabinet-plus', $cabinet->id).'?plus=9">'.UI::badge('9 месяцев').'</a> '.
            '<a href="'.route('cabinet-plus', $cabinet->id).'?plus=12">'.UI::badge('год').'</a> '
        ];
    }

    /**
     * Sets a initial query with the data to fill the table
     *
     * @return Builder Eloquent query
     */
    public function repository(): Builder
    {
        //return Cabinet::query();
        /*return UserAdmin::query()
            ->join('cabinet', 'users.id', '=', 'cabinet.user_id')
            ->where('id_cms_privileges', 3)
            ->applyScopes();*/
        return Cabinet::query()->select(['cabinet.*', 'users.name', 'users.phone'])->join('users', 'users.id', '=', 'cabinet.user_id')->applyScopes();
    }

    /** For actions by item */
    protected function actionsByRow()
    {
        return [
            //new ActivateUserAction('shield', 'Продлить', 'shield'),
            //new DeleteUserAction(),
            new DeleteCabinetAction(),
            //new RedirectAction('cabinets', 'Просмотр', 'eye'),
        ];
    }

    /** For bulk actions */
    protected function bulkActions()
    {
        return [
            //new ActivateUsersAction,
            //new DeleteUsersAction(),
            new DeleteCabinetsAction(),
        ];
    }

    /**
     * Method fired by the `editable` component, it
     * gets the model instance and a key-value array
     * with the modified dadta
     */
    public function update(Cabinet $cabinet, $data)
    {
        if (isset($data['phone'])) {
            $cabinet->users->phone = $data['phone'];
            try {
                if ($cabinet->users->save()) $this->success('Телефон сохранен!');
                else $this->error('Не удались сохранить телефон!');
            } catch (\Exception $e) {
                $this->error($e->getMessage());
            }

        }
        //$user->update($data);
    }

    protected function filters()
    {
        return [
            //new UsersActiveFilter,
            //new CreatedFilter,
            //new UsersTypeFilter
        ];
    }
}
