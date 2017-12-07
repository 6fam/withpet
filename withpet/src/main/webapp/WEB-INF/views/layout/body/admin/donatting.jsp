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
				<li class="nav-item"><a class="nav-link" href="alldonation.do">전체 모금함</a></li>
				<li class="nav-item"><a class="nav-link" href="donationwait.do">모금 대기중</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">모금 진행중</a></li>
				<li class="nav-item"><a class="nav-link" href="donationfinish.do">모금 마감</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
						
						
							<!-- 전체회원관리 -->
							<form action="${pageContext.request.contextPath}/donationstatechange.do">
							<sec:csrfInput/>
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">글번호</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 13%">모금상태</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 16%">제목</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">작성자</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 13%">모금진행액</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 13%">모금목표액</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">모금참여자</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">등록일자</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">마감</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:forEach items="${dolist.list}" var="dl">
							    <tr>
    							  <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${dl.boardNo}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${dl.categoryName}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${dl.title}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${dl.id}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${dl.currentMoney}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${dl.dreamMoney}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">모금참여자</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${dl.wdate}</td>
						      	  <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">
							      <input type="hidden" name="categoryNo" value="30">
							      <button class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer; background-color: white"
							      	name="boardNo" value="${dl.boardNo}">
										마감
								  </button>
							      </td>
							    </tr>
							    </c:forEach>
							    </tbody>
							</table>
							</form>
							<!-- 전체회원관리 끝 -->
							
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