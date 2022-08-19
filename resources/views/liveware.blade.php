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
            {{ $title }} <a href="{{ route($route) }}" class="inline-flex items-center px-1 pt-1 border-b-2 border-transparent text-sm font-medium leading-5 text-gray-500 hover:text-gray-700 hover:border-gray-300 focus:outline-none focus:text-gray-700 focus:border-gray-300 transition">{{ $name }}</a>
        </h2>

    </x-slot>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden overflow-hidden shadow-xl sm:rounded-lg">
                {!! $html !!}
            </div>
        </div>
    </div>
</x-app-layout>
