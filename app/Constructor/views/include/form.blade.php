<style>
.help-block {
    color: #737373;
    font-size: 14px;
}
.btn-success {
    color:#212529;
}
</style>
<div>


<?php
//$action = (@$row) ? BTBooster::mainpath("edit-save/$row->id") : BTBooster::mainpath("add-save");
$action = '';
$return_url = !empty($return_url) ? $return_url : g('return_url');
?>
<form class='form-horizontal' method='post' id="form" enctype="multipart/form-data" action='{{$action}}'>
    <input type="hidden" name="_token" value="{{ csrf_token() }}">
    <input type='hidden' name='return_url' value='{{ @$return_url }}'/>
    {{--
    <input type='hidden' name='ref_mainpath' value='{{ BTBooster::mainpath() }}'/>
    --}}
    <input type='hidden' name='ref_parameter' value='{{urldecode(http_build_query(@$_GET))}}'/>
    @if(@$hide_form)
        <input type="hidden" name="hide_form" value='{!! serialize($hide_form) !!}'>
    @endif
    <div class="box-body" id="parent-form-area">
        <div class="mb-4">
            <ul>
                @if(@$command == 'detail')
                    @include("crudbooster::include.form_detail")
                @else
                    @include("crudbooster::include.form_body")
                @endif
            </ul>
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">

        <div class="form-group">
            <label class="control-label col-sm-2"></label>
            <div class="col-sm-10">
                @if(@$button_cancel && BTBooster::getCurrentMethod() != 'getDetail')
                    @if(g('return_url'))
                        <a href='{{g("return_url")}}' class='btn btn-default'><i
                                    class='fa fa-chevron-circle-left'></i> {{cbLang("button_back")}}</a>
                    @else
                        <a href='{{BTBooster::mainpath("?".http_build_query(@$_GET)) }}' class='btn btn-default'><i
                                    class='fa fa-chevron-circle-left'></i> {{cbLang("button_back")}}</a>
                    @endif
                @endif
                @if(BTBooster::isCreate() || BTBooster::isUpdate())

                    @if(BTBooster::isCreate() && @$button_addmore==TRUE && $command == 'add')
                        <input type="submit" name="submit" value='{{cbLang("button_save_more")}}' class='btn btn-success'>
                    @endif

                    @if(@$button_save && @$command != 'detail')
                        <input type="submit" name="submit" value='{{cbLang("button_save")}}' class='btn btn-success'>
                    @endif

                @endif
            </div>
        </div>


    </div><!-- /.box-footer-->

</form>
