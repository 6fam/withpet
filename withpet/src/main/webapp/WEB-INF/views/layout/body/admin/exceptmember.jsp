<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="!hasRole('ROLE_MANAGER')">
	<script type="text/javascript">
		alert("로그인 하세요!");
		location.href = "${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
<div class="container" style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-12">
			<h1 id="navbars">
				<font style="font-size: 35px">관리자페이지</font>
			</h1>
		</div>
	</div>
	
	<!-- 총회원게시판 시작 -->
	<div class="row"
		style="margin-left: 0px; margin-bottom: 60px; margin-right: 0px">
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link" href="allmember.do">전체 회원</a></li>
				<li class="nav-item"><a class="nav-link" href="normalmember.do">일반 회원</a></li>
				<li class="nav-item"><a class="nav-link" href="yebimommy.do">견주 대기자</a></li>
				<li class="nav-item"><a class="nav-link" href="dogmommy.do">견주</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">탈퇴 회원</a></li>
				<li class="nav-item"><a class="nav-link" href="manager.do">관리자</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
						
						
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 8%">회원번호</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">이메일</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">닉네임</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 20%">연락처</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">포인트</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 27%">가입일자</th>
							    </tr>
							  </thead>
							  <tbody>
							  
							  	<!-- for -->
							  	<c:forEach items="${excepterlist.list}" var="el">
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${el.id}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${el.nick}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${el.tel}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${el.money}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${el.regdate}</td>
							    </tr>
							  	</c:forEach>
							    </tbody>
							</table>
							
						</div>
					</div>
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-4"></div>
						<div class="col-sm-6"></div>
						<div class="col-sm-5"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>