<?php

namespace App\Modules\categories\controllers;

use App\Http\Controllers\Controller;
//use Illuminate\View\View;
use App\Modules\categories\models\CategoryAdmin;
use Illuminate\Support\Facades\View;

//use system\core\View;
//use system\core\Modules;

class CategoriesController extends Controller {

    public static $html_actions = [
        'default',
    ];

    public function __construct($route = null) {
        parent::__construct($route);
    }

    public function defaultAction() {
        $model = new CategoryAdmin();
        $vars = [
            'id' => 'categories',
            'data' => $this->route['section']->data ? json_decode($this->route['section']->data, true) : null,
            'cats' => $model->getItems() ?? [],
        ];
        $finder = new \Illuminate\View\FileViewFinder(app()['files'], [__DIR__.'/../templates']);
        View::setFinder($finder);
        return View::make('categories', $vars)->render();
    }

    public function getEditView()
    {
        //return parent::getEditView(); // TODO: Change the autogenerated stub
        ob_start();
        require __DIR__.'/../templates/edit_categories.php';
        $content = ob_get_clean();
        return $content;
    }
}
