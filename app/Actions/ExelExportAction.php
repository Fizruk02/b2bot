<?php

namespace App\Actions;

use App\Models\UsersExport;
use LaravelViews\Actions\Action;
use LaravelViews\Views\View;
use App\Models\User;
use Maatwebsite\Excel\Facades\Excel;

class ExelExportAction extends Action
{
    /**
     * Any title you want to be displayed
     * @var String
     * */
    public $title = "Выгрузить в Exel";

    /**
     * This should be a valid Feather icon string
     * @var String
     */
    public $icon = "save";

    /**
     * Execute the action when the user clicked on the button
     *
     * @param Array $selectedModels Array with all the id of the selected models
     * @param $view Current view where the action was executed from
     */
    public function handle($selectedModels, View $view)
    {
        $data = new UsersExport();

        //$this->success('Список выгружен!');
        //$data = $view->getExportData();
        //dump($data);
        $file = Excel::download($data, 'users.xlsx');
        response()->s->file($file);
        return $file;
        dd($file);
        return redirect()->route('export');
        dump(Excel::download($data, 'users.xlsx'));
        return Excel::download($data, 'users.xlsx')->getContent();
        /*
        $data = $view->getExportData();
        dd($data);

        /* @var $items \Illuminate\Pagination\LengthAwarePaginator /
        $items = $data['items'];
        dd($items);
        //dd($view->all());
        dd($selectedModels); //Тут массив айдишников
        // Your code here
        User::whereKey($selectedModels)->update([
            'type' => 'admin'
        ]);*/
    }

}
