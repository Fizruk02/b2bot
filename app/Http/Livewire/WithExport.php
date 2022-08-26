<?php

namespace App\Http\Livewire;

use Illuminate\Database\Eloquent\Model;
use LaravelViews\Views\View;

trait WithExport
{
    public function rowExport(Model $model)
    {
        return $this->row($model);
    }
    public function headersExport(): array
    {
        return $this->headers();
    }

    public function getExportData() {
        return [
            'headers' => $this->headers(),
            'items' => $this->query->get(),
        ];
    }

    /** For export actions */
    protected function exportActions()
    {
        return [
        ];
    }

    public function getExportActionsProperty()
    {
        if (method_exists($this, 'exportActions')) {
            return $this->exportActions();
        }

        return [];
    }

    public function getHasExportActionsProperty()
    {
        return method_exists($this, 'exportActions') && count($this->exportActions());
    }

    public function hydrate()
    {
        $this->bulkActions = collect($this->bulkActions)->merge($this->exportActions);
        //dd($this->bulkActions);
        //dd(debug_backtrace());
        //$this->filtersViews = $this->filters();
    }
}
