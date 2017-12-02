<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="resources/css/chan.css" />
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-1"></div>
		<div class="col-sm-6">
			<h1 id="navbars">
				<img src="resources/img/market_detail.png" style="width: 230px;">
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<!-- 돌보미 상세정보 탭 시작 -->
	<div class="row" style="margin-left: 0px;margin-top:30px; margin-right: 0px">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a onclick="fnMove('1')"
					class="nav-link active">상세내용</a></li>
				<li class="nav-item"><a onclick="fnMove('2')" class="nav-link">댓글보기</a></li>
				<li class="nav-item"><a onclick="fnMove('3')" class="nav-link">거래안내</a></li>
			</ul>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<!-- 돌보미 상세정보 탭 끝 -->
	<!-- 돌보미 탭 내용들 시작 -->
	<div class="row" style="margin: 0 auto;">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" style="margin: 30px">
			<div id="div1">
				<div class="row" style="margin-left: 0px;">
					<div class="col-sm-2">카테고리종류</div>
					<div class="col-sm-10">ㅇㅇㅇㅇㅇ</div>
				</div>
				<div class="row" style="margin-left: 0px;margin-top:30px">
					<div class="col-sm-2">제목</div>
					<div class="col-sm-10">ㅇㅇㅇㅇㅇ<br>ㅇㅇㅇㅇㅇ</div>
				</div>
				<div class="row" style="margin-left: 0px;margin-top:30px">
					<div class="col-sm-2">상세내용</div>
					<div class="col-sm-10">ㅇㅇㅇㅇㅇ ~ ㅇㅇㅇㅇㅇ</div>
				</div>
			</div>
			<div id="div2" style="margin-top:40px">
				댓글보기<br>댓글보기<br>댓글보기<br>댓글보기<br>댓글보기<br>댓글보기<br>댓글보기<br>댓글보기<br>댓글보기<br>댓글보기<br>댓글보기<br>
			</div>
			<div id="div3"
				style="border: 1px solid #ddd; margin-top: 40px; width: 95%; padding: 30px 20px 20px 20px; background: #ddd">
				<h6>
					<strong>거래안내</strong>
				</h6>
				<ul>
					<li><strong>돌보미 신청은 참여신청 기간 내에만 가능합니다.</strong></li>
					<li><strong>돌보미 신청은 댓글작성/연락 방법을 통하여 신청가능합니다. </strong></li>
					<li>돌보미 내용과 관련한 사항은 모임 개설자에게 문의 바랍니다.</li>
				</ul>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<!-- 돌보미 탭 내용들 끝 -->
	<!--로그인시 버튼 시작-->
	<div class="row" style="margin-top: 40px; margin-bottom: 40px">
		<div class="col-sm-4"></div>
		<div class="col-sm-2">
			<a href="care_update.do" class="btn btn-outline-danger"
				style="width: 100px; height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">수정</a>
		</div>
		<div class="col-sm-1"></div>
		<div class="col-sm-2">
			<button type="button" class="btn btn-outline-danger"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
				style="width: 100px; height: 30px; font-size: 11px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">취소</button>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>

<script>
	function fnMove(seq) {
		var offset = $("#div" + seq).offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	}
</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4492fe06798cb47618534aee3cc9d20&libraries=services"></script>
<script src="resources/script/chan.js"></script>

