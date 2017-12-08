<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<script>
		alert("로그인 하세요!");
		location.href="${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>

<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header"
		style="margin-top: 20px; margin-bottom: 20px">
		<div class="col-sm-11" style="margin-left: 20px">
			<h1 id="navbars">
				<img src="resources/img/mypage.png"
					style="width: 160px; display: block;">
			</h1>
		</div> 
		<div class="col-sm-1"></div>
	</div>
	
	<div class="row"
		style="margin-left: 0px; margin-bottom: 60px; margin-right: 0px">
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					href="mypage.do">내정보</a></li>
					<sec:authorize access="hasRole('ROLE_DOGMOM')">
				<li class="nav-item"><a class="nav-link"
					href="mypage_opened.do?pageNo=1">모임개설내역</a></li>
					</sec:authorize>
				<li class="nav-item"><a class="nav-link"
					href="mypage_participate.do?pageNo=1">모임참여내역</a></li>
				<li class="nav-item"><a class="nav-link"
					href="mypage_liked.do?pageNo=1">모임공감내역</a></li>
					<sec:authorize access="hasRole('ROLE_DOGMOM')">
				<li class="nav-item"><a class="nav-link"
					href="mypage_dSetup.do?pageNo=1">모금함개설내역</a></li>
					</sec:authorize>
				<li class="nav-item"><a class="nav-link"
					href="mypage_dHistory.do?pageNo=1">나의기부내역</a></li>
			</ul>
		</div>
	</div>

	<div class="row" style="margin-left: 0px; margin-right: 0px; margin-bottom: 100px">
		<!-- 섬네일시작 -->
		<sec:authorize access="hasAnyRole('ROLE_DOGMOM', 'ROLE_STANDBY')">
			<div class="col-sm-2" style="margin-left: 0px; margin-right: 50px">
					<img src="${pageContext.request.contextPath }/resources/upload/${ddto.imgPath }" width="180px" height="200px">
			</div>
			<!-- 섬네일끝 -->
			<!-- 정보 시작 -->
			<div class="col-sm-4"
				style="margin-left: 0px; padding-right: 0px; margin-right: 40px">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td style="text-align: center; font-weight: bold; width: 45%">댕댕이 이름</td>
							<td colspan="3">${ddto.name}</td>
						</tr>
						<tr>
							<td style="text-align: center; font-weight: bold; width: 45%">나이</td>
							<td>${ddto.age }</td>
						</tr>
						<tr>
							<td style="text-align: center; font-weight: bold; width: 45%">성별</td>
							<td>${ddto.gender }</td>
						</tr>
						<tr>
							<td style="text-align: center; font-weight: bold; width: 45%">생일</td>
							<td>${ddto.bdate }</td>
						</tr>
						<tr>
							<td style="text-align: center; font-weight: bold; width: 45%">중성화여부</td>
							<td>${ddto.neutralization }</td>
						</tr>
						<tr>
							<td style="text-align: center; font-weight: bold; width: 45%">댕댕이 등록일자</td>
							<td>${ddto.regDate }</td>
						</tr>
						<tr>
							<td style="text-align: center; font-weight: bold; width: 45%">댕댕이 성격</td>
							<td colspan="3">${ddto.intro}</td>
						</tr>
					</tbody>
				</table>
				<a href="${pageContext.request.contextPath }/dog_update.do" class="btn btn-outline-danger" 
						style="width:100%;height: 30px; font-size: 13px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">댕댕이 수정하기</a>
				
			</div>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_STANDBY') and !hasRole('ROLE_DOGMOM')">
			<div class="col-sm-6">
				<a href="${pageContext.request.contextPath }/dog_check.do" class="btn btn-outline-danger" 
						style="width:100%;height: 30px; font-size: 13px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">댕댕이 등록하기</a>
			</div>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_MEMBER')">
		<div class="col-sm-5">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td style="text-align: center; font-weight: bold">아이디</td>
						<td>${member.id }</td>
					</tr>
					<tr>
						<td style="text-align: center; font-weight: bold">닉네임</td>
						<td>${member.nick }</td>
					</tr>
					<tr>
						<td style="text-align: center; font-weight: bold">포인트</td>
						<td>0
							<span style="float:right">
								<button type="button" id="accountPay" class="btn btn-danger" style="height: 18px; width:35px; padding-top: 1px; cursor: pointer; font-size: 11px; padding: 0px; text-align: center;">충전
								</button>
							</span>
						</td>
					</tr>
					<tr>
						<td style="text-align: center; font-weight: bold">연락처</td>
						<td>${member.tel }</td>
					</tr>
					<tr>
						<td style="text-align: center; font-weight: bold">회원등급</td>
						<td>
							<sec:authorize access="hasRole('ROLE_MANAGER')">
					  			<img src="resources/img/tier_blue.png" style="width: 15px; height: 15px; margin-right:5px">
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_DOGMOM') and !hasRole('ROLE_MANAGER')">
					  			<img src="resources/img/tier_green.png" style="width: 15px; height: 15px; margin-right:5px">
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_STANDBY')">
					  			<img src="resources/img/tier_yellow.png" style="width: 15px; height: 15px; margin-right:5px">
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_STANDBY') and !hasRole('ROLE_DOGMOM') and !hasRole('ROLE_MANAGER')">
					  			<img src="resources/img/tier_red.png" style="width: 15px; height: 15px; margin-right:5px">
							</sec:authorize>
							${member.role }
						</td>
					</tr>
					<tr>
						<td style="text-align: center; font-weight: bold">가입날짜</td>
						<td>${member.regdate }</td>
					</tr>
				</tbody>
			</table>
			<a href="information_modification.do" class="btn btn-outline-success"
				style="width: 100%; height: 30px; font-size: 11px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">정보수정</a>
		</div>
		</sec:authorize>
	</div>
	<!-- 정보끝 -->
</div>