<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#sidebox {
	background-color: #F0F0F0;
	margin-left:50px;
	position : absolute;
	width: 84%;
	top: 565px;
	right: 108px;  
}
</style>
<div id="sidebox" style="z-index: 1000;cursor:pointer " onclick="">
	<button type="button" class="btn btn-primary btn-lg btn-block" style="background:#ff0066;border:none">기부하기</button>
</div>
<div class="container"
	style="z-index: 1; background-color: white; border: solid 1px #adadad; margin-top: 10px; padding-bottom: 30px">
	<div class="row page-header">
		<div class="col-sm-1"></div>
		<div class="col-sm-6">
			<h1 id="navbars">
				<img src="resources/img/care_detail.png" style="width: 230px;">
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<!-- 설명부분 -->
	<div class="row" style="margin-left: 0px; margin-top: 20px">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10"
			style="font-size: 16px">
			<p>
				<strong>'독도는 우리 땅'</strong>
			</p>
			우리 땅 지킴이 프로젝트 디딤돌 그룹홈은 아동의 학대, 방임, 부모의 이혼 및 재혼으로 인해 친부모와 살 수 없는 아이들이
			함께 모여 생활하는 생활시설입니다. 아동들 마다 각각의 사연을 가지고 함께 생활하게 된지 10년이 되어갑니다. 우리 아이들과
			함께 방송매체나 학교 숙제를 할 때마나 독도는 어떤 곳인지? 우리가 갈 수 있는지? 물어보는 질문이 많았습니다. 이러한
			아이들의 궁금증과 체험을 하고 싶다는 소망을 이루어 주고자 합니다. '백문이 불여일견' 말처럼 백번 듣는 것보다 한번 보는
			것이 낫다는 말이 있듯이 글로만 알고 지나가는 것이 아니라 직접 몸소 체험을 통해 우리나라 영토인 독도에 대해서 직접적으로
			체험을 통해 우리나라에 대한 자부심을 키워 주고자 합니다. 그저 방송매체로만 독도를 보았던 우리 아이들에게 독도를 직접 체험
			할 수 있는 좋은 기회를 선물하고자 합니다. 환상의 섬 독도에 들어 가기 위한 첫 걸음 환상의 섬 독도에 들어 가기 위한 첫
			걸음

		</div>
		<div class="col-sm-1" ></div>
	</div>

	<!-- 이미지부분 -->
	<div class="row" style="margin-top: 30px;">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10">
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="height: 100%">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid w-100" src="resources/img/test1.jpg" alt="" style="height:650px">
					</div>
				
					<div class="carousel-item">
						<img class="d-block img-fluid w-100" src="resources/img/test2.jpg" alt="" style="height:650px">
					</div>
					
					<div class="carousel-item">
						<img class="d-block img-fluid w-100" src="resources/img/test3.jpg" alt="" style="height:650px">
					</div>
				</div>
				
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="col-sm-1" ></div>
	</div>

	<!-- 설명부분 -->
	<div class="row" style="margin-left: 0px; margin-top: 30px">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10"
			style="font-size: 16px">
			<p>
				<strong>'독도는 우리 땅'</strong>
			</p>
			우리 땅 지킴이 프로젝트 디딤돌 그룹홈은 아동의 학대, 방임, 부모의 이혼 및 재혼으로 인해 친부모와 살 수 없는 아이들이
			함께 모여 생활하는 생활시설입니다. 아동들 마다 각각의 사연을 가지고 함께 생활하게 된지 10년이 되어갑니다. 우리 아이들과
			함께 방송매체나 학교 숙제를 할 때마나 독도는 어떤 곳인지? 우리가 갈 수 있는지? 물어보는 질문이 많았습니다. 이러한
			아이들의 궁금증과 체험을 하고 싶다는 소망을 이루어 주고자 합니다. '백문이 불여일견' 말처럼 백번 듣는 것보다 한번 보는
			것이 낫다는 말이 있듯이 글로만 알고 지나가는 것이 아니라 직접 몸소 체험을 통해 우리나라 영토인 독도에 대해서 직접적으로
			체험을 통해 우리나라에 대한 자부심을 키워 주고자 합니다. 그저 방송매체로만 독도를 보았던 우리 아이들에게 독도를 직접 체험
			할 수 있는 좋은 기회를 선물하고자 합니다. 환상의 섬 독도에 들어 가기 위한 첫 걸음 환상의 섬 독도에 들어 가기 위한 첫
			걸음
		</div>
		<div class="col-sm-1" ></div>
	</div>

	<!-- 기부금액 -->
	<div class="row" style="margin-left: 0px; margin-top: 30px">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10" style="text-align: center; font-size: 16px">
			<p style="font-size: 35px; color: #ff0066;">75,000,000원</p>
			<p style="margin-top: 10px">직접기부(0명) : 21000원</p>
			<p>목표금액 : 0000원</p>
		</div>
		<div class="col-sm-1" ></div>
	</div>
</div>

<div class="container" style="z-index: 1; background-color: white; border: solid 1px #adadad; margin-top: 10px; padding-bottom: 30px">
	<div class="row page-header">
		<div class="col-sm-1"></div>
		<div class="col-sm-8">
			<h1 id="navbars">
				함께모은 기부 덧글
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<!-- 설명부분 -->
	<div class="row" style="margin-left: 0px; margin-top: 20px">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10"
			style="font-size: 16px">
			<p>
				<strong>덧글</strong>
			</p>
			응원합니다!
		</div>
		<div class="col-sm-1" ></div>
	</div>

</div>

<!-- 기부 창입니다. -->
<div class="setDiv">
	<div class="mask"></div>
	<div class="window" style="width: 350px; height: 350px; border-radius: 10px">
		<a href="#" class="close">X&nbsp;</a>
		<div style="text-align: center; margin-top:10px; margin-bottom: 10px">
			<h2><strong>결제</strong></h2>
			<hr>
		</div>
		<div style="width: 350px;height: 150px">
			<button type="button" class="btn btn-secondary" style="margin-left: 15px; cursor: pointer">1천</button>
			<button type="button" class="btn btn-secondary" style="cursor: pointer">5천</button>
			<button type="button" class="btn btn-secondary" style="cursor: pointer">1만원</button>
			<button type="button" class="btn btn-secondary" style="cursor: pointer">5만원</button>
			<button type="button" class="btn btn-secondary" style="cursor: pointer">10만원</button>
			<div class="row">
				<input type="text" name="id" class="form-control" id="id" style="margin-top: 20px; margin-left: 35px; margin-right: 35px">
			</div>
			
			<div class="row">
				<textarea name="id" class="form-control" id="id" style="margin-top: 20px; margin-left: 35px; margin-right: 35px"></textarea>
			</div>
			
			<div class="row">
				<button type="button" id="accountPay" class="btn btn-danger" style="margin-top: 20px; margin-left: 35px; margin-right: 35px;cursor: pointer; width: 100%">결제하기</button>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	var currentPosition = parseInt($("#sidebox").css("top"));
	$(window).scroll(function() {
		var position = $(window).scrollTop();
		$("#sidebox").stop().animate({
			"top" : position + currentPosition + "px"
		}, 500);
	});
</script>