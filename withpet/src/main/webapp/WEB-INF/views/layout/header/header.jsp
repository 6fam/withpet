<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
	a{text-decoration: none;color:#000;}
</style>
<div class="row" style="border-bottom: 1px solid #cecece; background-color: white; height: 60px; position: fixed ; top: 0px; z-index: 1000; width: 100%; margin-right: 0px; padding-right: 0px; margin-left: 0px ">
	<div class="col-sm-2">
		<a href="home.do?pageNo=1"><img src="resources/img/logo_text1.png" style="width: 160px; margin-top: 8px"></a>
	</div>
	<div class="col-sm-9 	">
		<div class="row">
			<div class="col-sm-8" style="text-align: left; padding-left: 0px;">
				<!-- 모임 버튼 -->
				<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
				  <div class="btn-group show" role="group">
				   	<a href="#"  id="btnGroupDrop2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
					style="text-decoration:none ;color:black ;display:inline-block; height: 30px; font-size: 18px; margin-top: 2px; margin-bottom: 8px; padding-top: 6px; cursor: pointer">
						모임
					</a>				
					<div class="dropdown-menu" aria-labelledby="btnGroupDrop2" style="padding-top: 0px; padding-bottom: 0px; width: 400px; border: 1px solid #757575">
						<div class="row" style="margin-left: 0px; margin-right: 0px">
							<div
								style="float: left; padding-left: 20px; padding-right: 20px; padding-top: 10px; border-right: 1px solid #cecece; width: 100px; height: 80px">
								<font style="font-size: 12px"><b>카테고리</b></font>
							</div>
							<div
								style="float: right; width: 248px; padding-left: 20px; padding-top: 10px">
								<div class="row" style="margin-left: 0px; margin-right: 0px">
									<div class="col-sm-5">
										<font style="font-size: 12px"> <a href="meeting.do?categoryNo=20">친목</a></font>
									</div>
									<div class="col-sm-6">
										<font style="font-size: 12px"><a href="meeting.do?categoryNo=21">산책</a></font>
									</div>
								</div>
								<div class="row" style="margin-left: 0px; margin-right: 0px">
									<div class="col-sm-5">
										<font style="font-size: 12px"><a href="meeting.do?categoryNo=22">훈련</a></font>
									</div>
									<div class="col-sm-6">
										<font style="font-size: 12px"><a href="meeting.do?categoryNo=23">교육</a></font>
									</div>
								</div>
								<div class="row" style="margin-left: 0px; margin-right: 0px">
									<div class="col-sm-5">
										<font style="font-size: 12px"><a href="meeting.do?categoryNo=24">세미나</a></font>
									</div>
									<div class="col-sm-6">
										<font style="font-size: 12px"><a href="meeting.do?categoryNo=25">#</a></font>
									</div>
								</div>
							</div>
						</div>
						<div class="row" style="margin-left: 0px; margin-right: 0px; border-top: 1px solid #cecece">
							<div style="float: left; padding-left: 20px; padding-right: 20px; padding-top: 10px; border-right: 1px solid #cecece; width: 100px; height: 100px">
								<font style="font-size: 12px"><b>일정/시간</b></font>
							</div>
							<div style="float: right; width: 248px; padding-left: 20px; padding-top: 10px">
								<div class="row" style="margin-left: 0px; margin-right: 0px">
									<div class="col-sm-5">
										<font style="font-size: 12px">오전</font>
									</div>
									<div class="col-sm-6">
										<font style="font-size: 12px">새벽</font>
									</div>
								</div>
								<div class="row" style="margin-left: 0px; margin-right: 0px">
									<div class="col-sm-5">
										<font style="font-size: 12px">오후</font>
									</div>
									<div class="col-sm-6">
										<font style="font-size: 12px">주말</font>
									</div>
								</div>
								<div class="row" style="margin-left: 0px; margin-right: 0px">
									<div class="col-sm-5">
										<font style="font-size: 12px">저녁</font>
									</div>
									<div class="col-sm-6">
										<font style="font-size: 12px">주중</font>
									</div>
								</div>
							</div>
						</div>
					</div>
				  </div>
				</div>
				
				<!-- 커뮤니티 게시판 -->
				<font style="color: #ddd">|</font> 
				<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
				  <div class="btn-group" role="group">
				  	<a href="#"
				  		data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
				  		style="text-decoration:none ;color:black ;display:inline-block;height: 30px; font-size: 18px; margin-top: 2px; margin-bottom: 8px; padding-top: 6px; cursor: pointer">
				  		커뮤니티
				  	</a>
				    <div class="dropdown-menu" aria-labelledby="btnGroupDrop2">
				    	<a class="dropdown-item" href="community.do" style="font-size: 13px">나눔마켓</a>
				    	<a class="dropdown-item" href="community.do" style="font-size: 13px">돌보미</a>
				    	<a class="dropdown-item" href="community.do" style="font-size: 13px">반려견정보</a>
				    	<a class="dropdown-item" href="community.do" style="font-size: 13px">모임후기</a>
				    </div>
				  </div>
				</div>
				
				<font style="color: #ddd">|</font>
				<!-- 반려견기부 게시판 -->
				<a href="togetherdog.do?pageNo=1"style="text-decoration:none ;color:black ;display:inline-block;height: 30px; font-size: 18px; margin-top: 12px; margin-bottom: 8px; padding-top: 6px; cursor: pointer">
				같이가치
				</a>
				
				<!-- 서비스 소개 -->
				<font style="color: #ddd">|</font> 
				<a href="#" style="text-decoration:none ;color:black ;display:inline-block;height: 30px; font-size: 18px; margin-top: 12px; margin-bottom: 8px; padding-top: 6px; cursor: pointer">
				서비스소개
				</a>
			</div>
			<sec:authorize access="!hasRole('ROLE_MEMBER')">
			<div class="col-sm-4" style="text-align: right; padding-right: 0px;">
				<!-- 돌보미게시판 -->
				<a href="loginForm.do" class="btn btn-default" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 30px; font-size: 13px; margin-top: 16px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">
				로그인
				</a>
				<a href="join.do" class="btn btn-default" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 30px; font-size: 13px; margin-top: 16px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">
				회원가입
				</a>
			</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_MEMBER')">
			<div class="col-sm-3" style="padding-right: 0px; text-align: right">
					<!-- 회원 -->
					<sec:authorize access="!hasRole('ROLE_MANAGER')">
					<div style="float: right; height: 30px; font-size: 13px; margin-top: 16px; margin-right: 15px; margin-bottom: 8px; padding-top: 7px; cursor: pointer; margin-left: 10px">
						<a href="#"
					  		data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
					  		style="cursor: pointer">
					  		<font style="margin-right: 5px">
					  			<img src="resources/img/tier_red.png" style="width: 15px; height: 15px; margin-right:5px"><sec:authentication property="principal.nick" /> 님
					  		</font>
					  	</a>
					    <div class="dropdown-menu" aria-labelledby="btnGroupDrop2" style="margin-top:15px;margin-left: -115px; width: 300px; height: 120px; cursor: default">
					    	<div class="row">
								<div class="col-sm-4">
									<img src="resources/img/dog_profile2.png" style="height:80px;width: 80px; border: solid 1px black; border-radius: 200px; margin-left: 20px; margin-top: 10px">
								</div>
								<div class="col-sm-7" style="margin-left: 10px">
									<div class="row" style="margin:0px; padding: 0px; margin-top: 15px">
										<sec:authentication property="principal.nick" />님 <font style="font-size: 12px; color: #3f3f3f; padding-top: 4px;margin-left: 8px"><a href="mypage.do">내정보</a><img src="resources/img/padlock-lock-icon.png" style="width: 15px; height: 15px"></font>
									</div>
									<div class="row" style="margin:0px; padding: 0px; margin-top: 7px">
										<font style="font-size: 13px">일반회원</font><br>
									</div>
									<div class="row" style="margin:0px; padding: 0px; margin-top: 2px">
										<a href="receivemessage.do?pageNo=1" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;font-size: 13px; margin-bottom: 8px;cursor: pointer">
											<img src="resources/img/messageico.png" style="height: 15px; width: 15px; margin-top: 5px">쪽지함 <font style="color: green"><b>0</b></font>
										</a>
									</div>
								</div>
					    	</div>
					    </div>
						<!-- <a href="mypage.do" style="color: black; margin-top: 7px">
							마이페이지
						</a> -->
					</div>
					</sec:authorize>
					
					<!-- 관리자 -->
					<sec:authorize access="hasRole('ROLE_MANAGER')">
					<div style="float: right; height: 30px; font-size: 13px; margin-top: 10px; margin-right: 15px; margin-bottom: 8px; padding-top: 0px; cursor: pointer; margin-left: 10px">
						<font style="margin-right: 5px">
							<a href="receivemessage.do?pageNo=1" style="color: black">
								<sec:authentication property="principal.nick" />
							</a>님
						</font>
						<div class="btn-group" role="group" style="margin-top: 7px" aria-label="Button group with nested dropdown">
							<div class="btn-group" role="group">
								<a id="btnGroupDrop3" class="btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
										style="margin-top: 5px; margin-bottom: 4px; padding-top: 0px; cursor: pointer; color: black">
									관리자페이지
								</a>
								<div class="dropdown-menu" aria-labelledby="btnGroupDrop3" x-placement="bottom-start"
										style="position: absolute; transform: translate3d(0px, 33px, 0px); top: 0px; left: 0px; will-change: transform; min-width: 140px; padding-top: 5px; padding-bottom: 5px">
									<div style="border-bottom: solid 1px #cecece">
										<a class="dropdown-item" href="manager_allmember.do?pageNo=1" style="padding-top: 0px; padding-bottom: 5px">
											<font style="font-size: 12px">회원 관리</font>
										</a>
									</div>
									<div style="border-bottom: solid 1px #cecece">
										<a class="dropdown-item" href="manager_allboard.do?pageNo=1" style="padding-top: 0px; padding-bottom: 5px">
											<font style="font-size: 12px">게시글 관리</font>
										</a>
									</div>
									<div>
										<a class="dropdown-item" href="manager_alldonation.do?pageNo=1" style="padding-top: 0px; padding-bottom: 5px">
											<font style="font-size: 12px">모금함 관리</font>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</sec:authorize>
			</div>
			<div class="col-sm-1" style="padding-left: 0px; text-align: left">
					<script type="text/javascript">
						$(document).ready(function() {
							$("#logoutAction").click(function() {
								$("#logoutForm").submit();
							});
						});
					</script>
					<a href="#" class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 30px; font-size: 13px; margin-top: 16px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">
						로그아웃
					</a>
					<form id="logoutForm" action="${pageContext.request.contextPath}/logout.do"
						method="post" style="display: none">
						<sec:csrfInput />
					</form>
			</div>
			</sec:authorize>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>


