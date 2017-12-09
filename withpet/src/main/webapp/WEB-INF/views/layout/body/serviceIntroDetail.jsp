<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<!-- 총회원게시판 시작 -->
	<div class="row"
		style="margin-left: 0px; margin-bottom: 40px; margin-right: 0px">
		<div class="col-sm-12">
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember"
					style="padding: 0px 0px 20px 0px;">
					
					<!-- 제목 -->
					<div class="row" style="padding-top: 0px; padding-bottom: 0px; font-size:20px;
						padding-left: 0px; margin-left: 0px; padding-right: 0px; margin-right: 0px">
						<div class="col-sm-12" style="padding-left: 0px; margin-left: -30px; padding-right: 0px; margin-right: 0px">
							<img src="resources/img/2.png" style="width:1138px; height:350px">
							<font style="font-size: 30px; position: absolute; top:100px; left:200px; color: #fff">
							${sdto.content}
							</font>
						</div>
					</div>
					
					<!-- 제목 -->
					<!-- <div class="row" style="padding-top: 30px; padding-bottom: 0px; font-size:20px">
						<div class="col-sm-12">
							♬ 서비스 내용
						</div>
					</div> -->
					
					<!-- content -->
					<%-- <div class="row" style="padding-top: 100px; padding-bottom: 120px">
						<div class="col-sm-12" style="text-align: center">
							<font style="font-size: 30px">${sdto.content}</font><br>
						</div>
					</div> --%>
					
					<!-- 제목 -->
					<div class="row" style="padding-top: 60px; padding-bottom: 0px; font-size:20px">
						<div class="col-sm-12" style="text-align: center">
							<font style="font-size: 40px">회원의 등급</font>
						</div>
					</div>
					
					<!-- 전체 등급 이미지 -->
					<div class="row" style="padding-top: 100px; padding-bottom: 20px">
						<div class="col-sm-12" style="text-align:center;">
							<img alt="등급" src="resources/img/grade.png" style="width: 700px">
						</div>
					</div>
					
					<!-- 전체 등급 절차 설명 -->
					<div class="row" style="padding-top: 0px; padding-bottom: 120px">
						<div class="col-sm-2"></div>
						<div class="col-sm-8">
							- 일반회원(red) : 회원가입 → 일반회원<br>
							- 예비주인(yellow) : 댕댕이 정보 등록  <br>
							- 댕댕이주인님(green) : 관리자 , 운영자 댕댕이 주인님 승인 → 댕댕이 주인님<br>
							- 관리자 , 운영자(blue) : 운영자가 관리자로 회원 승인 → 관리자
						</div>
						<div class="col-sm-2"></div>
					</div>
					
					
					<!-- 제목 -->
					<div class="row" style="padding-top: 60px; padding-bottom: 0px; font-size:20px">
						<div class="col-sm-12" style="text-align: center">
							<font style="font-size: 40px"> 댕댕이 주인님 확인 절차</font>
						</div>
					</div>
					<div class="row" style="padding-top: 100px; padding-bottom: 0px">
						<div class="col-sm-12" style="text-align:center;">
							<img alt="등급" src="resources/img/grade2.png" style="width: 700px">
						</div>
					</div>
					
					<!-- 견주 인증 절차 설명 -->
					<div class="row" style="padding-top: 20px; padding-bottom: 120px">
						<div class="col-sm-2"></div>
						<div class="col-sm-8">
							① 회원가입 (일반회원) <br>
							② 로그인 후 마이페이지 댕댕이 신청 (예비주인)<br>
							③ 운영자가 관리자 페이지에서 댕댕이 주인님 등급 승인 (댕댕이 주인님)
						</div>
						<div class="col-sm-2"></div>
					</div>
					
					<!-- 제목 -->
					<div class="row" style="padding-top: 60px; padding-bottom: 0px; font-size:20px">
						<div class="col-sm-12" style="text-align: center">
							<font style="font-size: 40px">서비스 소개</font>
						</div>
					</div>
					
					<!-- 서비스 종류 소개 이미지 부분 -->
					<div class="row" style="padding-top: 60px; padding-bottom: 120px">
						<div class="col-sm-4" style="border-right:1px dotted #ddd;text-align:center;margin:0 auto">
							<img alt="모임아이콘" src="resources/img/icon1.png" style="width: 75px;padding-bottom:30px">
							<br>모임 서비스<br><br>
							<p>댕댕이들 과의 모임을 통해<br>댕댕이들의 사회성을 길러 주는 서비스 입니다.</p>
						</div>
						<div class="col-sm-4" style="border-right:1px dotted #ddd;text-align:center;margin:0 auto">
							<img alt="같이가치아이콘" src="resources/img/icon2.png" style="width: 75px;padding-bottom:30px">
							<br>같이의 가치 서비스<br><br>
							<p>기부를 통해 댕댕이들에게 <br>도움을 주는 서비스입니다.</p>
						</div>
						<div class="col-sm-4" style="text-align:center;margin:0 auto">
							<img alt="커뮤니티아이콘" src="resources/img/icon3.png" style="width: 75px;padding-bottom:30px">
							<br>커뮤니티 서비스<br><br>
							<p>나눔마켓, 모임정보, 반려정보, 돌보미 등의 <br> 정보공유를 등의 할 수 있는 서비스입니다.</p>
						</div>
					</div>
					
					
					<div class="row" style="padding-top: 0px; padding-bottom: 0px; font-size:20px; margin-bottom:-60px; margin-top:100px;
						padding-left: 0px; margin-left: -30px; padding-right: 0px; margin-right: -30px; background-color: #5B6882; height: 250px">
						<div class="col-sm-4" style="padding-left: 30px; padding-top: 30px; margin-left: 0px; padding-right: 0px; margin-right: 0px">
							<font style="font-size: 14px">About Company</font>						
						</div>
						<div class="col-sm-4" style="padding-left: 30px; padding-top: 30px; margin-left: 0px; padding-right: 0px; margin-right: 0px">
							<font style="font-size: 14px">Recent Posts</font>						
						</div>
						<div class="col-sm-4" style="padding-left: 30px; padding-top: 30px; margin-left: 0px; padding-right: 0px; margin-right: 0px">
							<font style="font-size: 14px">Contact us</font>						
						</div>
					</div>
					
					
					
				</div>
			</div>
		</div>
	</div>
	
</div>