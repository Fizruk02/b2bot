<?php
/**
 * @var $title string
 * @var $live string
 * @var $route string
 * @var $name string
 * @var $model Object
 */
if (empty($model)) $html = \Livewire\Livewire::mount($live, [])->html();
else $html = \Livewire\Livewire::mount($live, ['model' => $model->id])->html();
//$html = \Livewire\Livewire::mount('user-detail-view', ['model' => 1])->html();
//$liveware = '<livewire:cabinet-table-view />';
?>
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ $title }}
        </h2>
        <a href="{{ route($route) }}" class="btn btn-danger">{{ $name }}</a>
    </x-slot>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden overflow-hidden shadow-xl sm:rounded-lg">
                {!! $html !!}
            </div>
        </div>
    </div>
</x-app-layout>
