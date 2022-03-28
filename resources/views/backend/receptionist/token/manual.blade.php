@extends('layouts.backend')
@section('title', trans('app.manual_token') )

@section('content')
<div class="panel panel-primary"> 
    <div class="panel-heading">
        <ul class="row list-inline m-0">
            <li class="col-xs-10 xs-view p-0 text-left" id="screen-title">
                <h3>{{ trans('REGISTER') }}</h3>
            </li>         
            <li class="col-xs-2 p-0 text-right">
                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#infoModal">
                  <i class="fa fa-info-circle"></i>
                </button>
            </li> 
        </ul>
    </div> 

    <div class="panel-body">

        <div id="output" class="hide alert alert-danger alert-dismissible fade in shadowed mb-1"></div>

        {{ Form::open(['url' => 'receptionist/token/create', 'class'=>'manualFrm mt-1 col-md-7 col-sm-8']) }}

            <div class="form-group @error('register_type') has-error @enderror">
                <label for="register_type">SELECT OPTION<i class="text-danger">*</i></label><br/>
                {{ Form::select('register_type', $register_type, null, ['placeholder' => 'Select Option', 'class'=>'select2 form-control register-type']) }}<br/>
                <span class="text-danger">{{ $errors->first('register_type') }}</span>
            </div> 

            <div class="form-non-student for-student" style="display: none">
                <div class="form-group @error('firstname') has-error @enderror">
                    <label for="firstname">Firstname<i class="text-danger">*</i></label>
                    <input type="text" name="firstname" class="form-control" placeholder="Firstname" />  
                    <span class="text-danger">{{ $errors->first('firstname') }}</span>
                </div>   

                <div class="form-group @error('lastname') has-error @enderror">
                    <label for="lastname">Lastname<i class="text-danger">*</i></label>
                    <input type="text" name="lastname" class="form-control" placeholder="Lastname" />  
                    <span class="text-danger">{{ $errors->first('lastname') }}</span>
                </div>  
            </div>
             

            <div class="for-student" style="display: none">
                @if($display->sms_alert)
                <div class="form-group @error('client_mobile') has-error @enderror">
                    <label for="client_mobile">{{ trans('STUDENT ID') }} <i class="text-danger">*</i></label>
                    <input type="text" name="client_mobile" class="form-control" placeholder="{{ trans('student id') }}"/>  
                    <span class="text-danger">{{ $errors->first('client_mobile') }}</span>
                </div>   
                @endif

                <div class="form-group @error('department_id') has-error @enderror">
                    <label for="department_id">{{ trans('app.department') }} <i class="text-danger">*</i></label><br/>
                    {{ Form::select('department_id', $departments, null, ['placeholder' => 'Select Option', 'class'=>'select2 form-control department']) }}<br/>
                    <span class="text-danger">{{ $errors->first('department_id') }}</span>
                </div> 

                <div class="form-group @error('course') has-error @enderror">
                    <label for="course">COURSE<i class="text-danger">*</i></label><br/>
                    {{ Form::select('course', $course, null, ['placeholder' => 'Select Option', 'class'=>'select2 form-control']) }}<br/>
                    <span class="text-danger">{{ $errors->first('course') }}</span>
                </div> 
            </div>

            
            <div class="form-non-student" style="display: none">
                <div class="form-group @error('counter_id') has-error @enderror">
                    <label for="user">{{ trans('SELECT TRANSACTION') }} <i class="text-danger">*</i></label><br/>
                    {{ Form::select('counter_id', $counters, null, ['placeholder' => 'Select Option', 'class'=>'select2 form-control']) }}<br/>
                    <span class="text-danger">{{ $errors->first('counter_id') }}</span>
                </div>

               <div class="form-group @error('user_id') has-error @enderror">
                    <label for="user">{{ trans('WINDOW') }} <i class="text-danger">*</i></label><br/>
                    {{-- {{ Form::select('user_id', $officers, null, ['placeholder' => 'Select Option', 'class'=>'select2 form-control']) }} --}}
                    <select class="select2 form-control user-id" name="user_id">
                        
                    </select><br/>
                    <span class="text-danger">{{ $errors->first('user_id') }}</span>
                </div>  

                @if($display->show_note)
                <div class="form-group @error('note') has-error @enderror">
                    <label for="note">{{ trans('app.note') }} <i class="text-danger">*</i></label> 
                    <textarea name="note" id="note" class="form-control"  placeholder="{{ trans('app.note') }}">{{ old('note') }}</textarea>
                    <span class="text-danger">{{ $errors->first('note') }}</span> 
                </div>
                @endif
            </div>
           

         <!--   <div class="checkbox">
                <label>
                    <input type="checkbox" name="is_vip" value="1"> {{ trans('app.is_vip') }}
                </label>
            </div> -->

            <div class="form-group">
                <button class="button btn btn-info btn-reset" type="reset"><span>Reset</span></button>
                <button class="button btn btn-success" type="submit"><span>Submit</span></button>
            </div>
        {{ Form::close() }}
    </div> 
</div>  


<!-- Modal -->
<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="infoModalLabel"><?= trans('app.note') ?></h4>
      </div>
      <div class="modal-body">
       <p><strong class="label label-warning"> Note 1 </strong> &nbsp;
            <strong>SMS Alert {!! (!empty($display->sms_alert)?("<span class='label label-success'>Active</span>"):("<span class='label label-warning'>Deactive</span>")) !!} </strong>
                        To active or deactive SMS Alert, please change the status of SMS Alert in Setting->Display Settings page
        </p>
        <p><strong class="label label-warning"> Note 2 </strong> &nbsp;
            <strong>Show Note {!! (!empty($display->show_note)?("<span class='label label-success'>Active</span>"):("<span class='label label-warning'>Deactive</span>")) !!} </strong>
            To display note, please change the status of Show Note in Setting->Display Settings page
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
@endsection

@push('scripts')
<script type="text/javascript">
$(document).ready(function(){
    var officers = JSON.parse('<?php echo $officers ?>');
    
    $(".register-type").on("change", function(e){
        $(".for-student").hide();
        $(".form-non-student").hide();
        $(".user-id").empty()

        if($(this).val() != ""){
            if($(this).val() == "Student"){
                $(".for-student").show();
                $(".form-non-student").show();
                //filter_window();
            }
            else{
                $(".form-non-student").show();
                $.each(officers, function(row, data){
                    if(data.toLowerCase().includes("non-student") || data.toLowerCase().includes("non student") || data.toLowerCase().includes("nonstudent")){
                        $(".user-id").append("<option selected value="+row+">"+data+"</option>")
                        console.log(data)
                    }
                    
                })
            }
        }
    })

    $(".department").on("change", function(){
        filter_window();
    })

    function filter_window(){
        $(".user-id").empty()
        $(".user-id").append("<option selected value=' ' disabled>Please select</option>")
        $.each(officers, function(row, data){
            if($('.department').val() == 1 && data.toLowerCase().includes("dci")){
                $(".user-id").append("<option selected value="+row+">"+data+"</option>")
            }
            else if($('.department').val() == 2 && data.toLowerCase().includes("dba")){
                $(".user-id").append("<option selected value="+row+">"+data+"</option>")
            }
            else if($('.department').val() == 8 && data.toLowerCase().includes("dte")){
                $(".user-id").append("<option selected value="+row+">"+data+"</option>")
            }
        })
    }

    $(".btn-reset").on("click", function(){
        $("input select").val("")
        // $("select").prop('selectedIndex',0).end();
        $("select").val(null).trigger("change");
        //$(".register-type").change()
    })

    $('input[name=client_mobile]').on('keyup change', function(e){
        var valid = true;
        var errorMessage;
        var mobile = $(this).val();

        if (mobile == '')
        {
            errorMessage = "The student No. field is required!";
            valid = false;
        } 
        else if(!$.isNumeric(mobile)) 
        {
            errorMessage = "The student No. is incorrect!";
            valid = false;
        }
        else if (mobile.length >= 15 || mobile.length < 7)
        {
            errorMessage = "The student No. must be between 7-15 digits";
            valid = false;
        }

        if(!valid && errorMessage.length > 0)
        {
            $(this).next().next().next().html(errorMessage);
            $('.modal button[type=submit]').addClass('hidden');
        } 
        else
        {
            $(this).next().next().next().html(" ");
            $('.modal button[type=submit]').removeClass('hidden');
        } 
    }); 
      
    var frm = $(".manualFrm");
    frm.on('submit', function(e){
      e.preventDefault();
      $.ajax({
        url: $(this).attr('action'),
        type: $(this).attr('method'),
        dataType: 'json', 
        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        contentType: false,  
        cache: false,  
        processData: false,
        data:  new FormData($(this)[0]),
        success: function(data)
        {
            if (data.status)
            { 
                var content = "<style type=\"text/css\">@media print {"+
                    "html, body {display:block;margin:0!important; padding:0 !important;overflow:hidden;display:table;}"+
                    ".receipt-token {width:100vw;height:100vw;text-align:center}"+
                    ".receipt-token h4{margin:0;padding:0;font-size:7vw;line-height:7vw;text-align:center}"+
                    ".receipt-token h1{margin:0;padding:0;font-size:15vw;line-height:20vw;text-align:center}"+
                    ".receipt-token ul{margin:0;padding:0;font-size:7vw;line-height:8vw;text-align:center;list-style:none;}"+
                    "}</style>";
                    
                content += "<div class=\"receipt-token\">";
                //content += "<h4>{{ \Session::get('app.title') }}</h4>";
                content += "<h1 style='font-size: 200px'>"+data.token.token_no+"</h1>";
                // content +="<ul class=\"list-unstyled\">";
                // content += "<li><strong>{{ trans('app.department') }} </strong>"+data.token.department+"</li>";
                // content += "<li><strong>{{ trans('app.counter') }} </strong>"+data.token.counter+"</li>";
                // content += "<li><strong>{{ trans('app.officer') }} </strong>"+data.token.firstname+' '+data.token.lastname+"</li>";
                // if (data.token.note)
                // {
                //     content += "<li><strong>{{ trans('app.note') }} </strong>"+data.token.note+"</li>";
                // }
                // content += "<li><strong>{{ trans('app.date') }} </strong>"+data.token.created_at+"</li>";
                // content += "</ul>";  
                content += "</div>";    
 
                // print 
                printThis(content);

            } else { 
                $("#output").html(data.exception).removeClass('hide');
            }
        },
        error: function(xhr)
        {
            alert('failed...');
        }
      });
    });
})
</script>
@endpush
 
 