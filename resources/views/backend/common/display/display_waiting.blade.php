@extends('layouts.display')
@section('title', trans('app.display_1'))


@section('content')

<div class="panel panel-primary">

   

    <div class="panel-body" id="fullscreen" style="color:{{ (!empty($setting->color)?$setting->color:'#ffffff') }}">
		<div class="media" style="height:60px;background:#3498db;margin-top:-20px;margin-bottom:10px">
			<div class="media-left hidden-xs">
				<img class="media-object" style="height:59px;" src="{{ asset('public/assets/img/icons/logo.jpg') }}" alt="Logo">
			</div>
			<div class="media-body" style="color:#ffffff">
				<h4 class="media-heading" style="font-size:50px;line-height:60px"><marquee direction="{{ (!empty($setting->direction)?$setting->direction:null) }}">{{ (!empty($setting->message)?$setting->message:null) }}</marquee></h4> 
			</div>
		</div>
		<?php
			$background_color = !empty($setting->background_color)? $setting->background_color: '#cdcdcd';
			$border_color = !empty($setting->border_color)? $setting->border_color: '#fff';
		?>
        <div id="clock" class="well text-center" style="background-color:{{$background_color}};border-color:{{$border_color}};padding:25px 0;font-size:28px;margin-bottom:0">{{$date}}</div>
        <div class="panel-heading">
	        <div class="row">
	            <div class="col-sm-12">
	                <h3>DISPLAY 1 - WAITING<button class="pull-right btn btn-sm btn-primary" onclick="goFullscreen('fullscreen'); return false"><i class="fa fa-arrows-alt" aria-hidden="true"></i></button></h3> 
	                <span class="text-danger">(enable full-screen mode and wait 10 seconds to adjust the screen)</span>
	            </div> 
	        </div>
	    </div><hr>
		<div id="display1" style="min-height: 90%; height: auto">
			{{-- <div class="row">
				@foreach ($windows as $window)
					<div class="col-sm-6">
						<span>{{$window}}</span>
					</div>
				@endforeach
			</div> --}}
		</div>
		<div class="panel-footer col-xs-12"> 
			@include('backend.common.info')
			<span class="col-xs-10 text-left">@yield('info.powered-by')</span>
			<span class="col-xs-2 text-right">@yield('info.version')</span>
		</div>
    </div> 
</div>  

@endsection

@push('scripts')
<script type="text/javascript"> 
	$(document).ready(function(){
		//get previous token
		var view_token = [];
		var interval = 1000; 

		var display = function(){
			var width  = $(window).width();
			var height = $(window).height();
			var isFullScreen = document.fullScreen ||
			document.mozFullScreen ||
			document.webkitIsFullScreen || (document.msFullscreenElement != null);
			if (isFullScreen){
				var width  = $(window).width();
				var height = $(window).height();
			}

			$.ajax({
				type:'post',
				url:'{{ URL::to("common/display_waiting") }}',
				data:{
					_token: '<?php echo csrf_token() ?>',
					view_token: view_token,
					width: width,
					height: height
				},
				success:function(response)
				{
					var append = "";
					append += "<div class='row'>"
						$.each(response.waiting_list, function(key, data){
							append += '<div class="col-sm-6" >'
								append += '<div style="min-height:100px;background:{{$background_color}};padding: 10px 10px; margin-bottom:10px;min-height: 270px;">'
									append += '<p style="font-size: 32px; font-weight:600">'+data.window+'</p>'
									append += '<div class="items" style="column-count: 2; width: 300px;">'
										$.each(data.queues, function(key, data1){
											append += '<p style="font-size: 28px">#'+data1+'</p>'
										})
									append += '</div>'
								append += '</div>'
							append += '</div>'
						})
					append += "</div>"

					$("#display1").html(append);

					setTimeout(display, response.interval);
				}
			});
		};
		setTimeout(display, interval);
	})
</script>
@endpush