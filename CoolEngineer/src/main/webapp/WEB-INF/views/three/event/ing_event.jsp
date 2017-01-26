<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../etc/header.jsp"%>

<style type="text/css">
	.layer {
    display: none;
    position: fixed;
    _position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 100;
	}
	.layer .bg {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background: #000;
	    opacity: 0.5;
	    filter:alpha(opacity=50);
	}
	.layer .pop-layer {
	    display: block;
	}
	
	.pop-layer {
	    display: none;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 1000px;
	    height: auto;
	    background-color: #fff;
	    border: 0px;
	    z-index: 10;
	}
	.pop-layer .pop-container {
	    padding: 20px 25px;
	}
	.pop-layer p.ctxt {
	    color: #666;
	    line-height: 25px;
	}
	.pop-layer .btn-r {
	    width: 100%;
	    margin: 10px 0 20px;
	    padding-top: 10px;
	    border-top: 1px solid #DDD;
	    text-align: right;
	}
	
	a.cbtn { /* 닫기 버튼 */
	    display: inline-block;
	    height: 25px;
	    padding: 0 14px;
	    border: 1px solid #304a8a;
	    background-color: #3f5a9d;
	    font-size: 13px;
	    color: #fff;
	    line-height: 25px;
	}
	a.cbtn:hover {
	    border: 1px solid #091940;
	    background-color: #1f326a;
	    color: #fff;
	}
	
	.btn-example {
		
	}
</style>

<script type="text/javascript">
	function layer_open(el){

		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		}else{
			temp.fadeIn();
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}				
</script>

<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="#">Home</a></li>
	<li class="active">이벤트</li>
</ul>
<!-- END BREADCRUMB -->


<!-- PAGE CONTENT TABBED -->
<div class="page-tabs">
	<a href="#first-tab" class="active">진행중인 이벤트</a> 
	<a href="#second-tab">당첨자 발표</a>
</div>

<div class="page-content-wrap page-tabs-item active" id="first-tab">

	

</div>




<div class="page-content-wrap page-tabs-item" id="second-tab">
	<div class="row">
		<div class="col-md-6-3">
			<div class="panel panel-default">
				<div class="panel-body">	                   
                  <div class="table-responsive">
                  <table class="table table-striped">
                  	  <thead>
                  	  	  <tr>
               	  	  	      <th width="75%">제목</th>
               	  	  	      <th width="15%">발표일</th>
               	  	  	      <th width="10%">조회수</th>
                  	  	  </tr>
                  	  </thead>	
	                  <tbody>			
						  <tr>						  	  
							  <td>
								  <a href="#" class="btn-example" onclick="layer_open('layer2');return false;">당첨자</a>					
								  <div class="layer">
									  <div class="bg"></div>
									  <div id="layer2" class="pop-layer">
										  <div class="pop-container">
											  <div class="pop-conts">
													<!--content //-->
													<p class="ctxt mb20">Thank you.<br>
														Your registration was submitted successfully.<br>
														Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
														Hope to see you soon!
													</p>
									
													<div class="btn-r">
														<a href="#" class="cbtn">Close</a>
													</div>
													<!--// content-->
											  </div>
										   </div>
									   </div>
								   </div>
							   </td>
							   <td>2017.01.25</td>
							   <td>55</td>
						   </tr>
					   </tbody>					
				   </table>
				   </div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="page-content-wrap page-tabs-item" id="third-tab">

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">Third tab content</div>
			</div>
		</div>
	</div>

</div>

<!-- END PAGE CONTENT TABBED -->


<%@ include file="../../etc/footer.jsp"%>