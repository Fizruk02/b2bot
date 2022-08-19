<x-lv-layout>
  <div class="flex items-center mb-4 px-4">

    <div class="flex justify-end">
      <x-lv-actions :actions="$this->actions" :model="$model" />
    </div>
  </div>

  @foreach ($components as $component)
    <div class="mb-4">
      {!! $component !!}
    </div>
  @endforeach

  @include('laravel-views::components.confirmation-message')
</x-lv-layout>
