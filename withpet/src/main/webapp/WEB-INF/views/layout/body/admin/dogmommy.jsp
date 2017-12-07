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
				<li class="nav-item"><a class="nav-link" href="normalmember.do">회원</a></li>
				<li class="nav-item"><a class="nav-link" href="yebimommy.do">예비 주인님</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">댕댕이 주인님</a></li>
				<li class="nav-item"><a class="nav-link" href="exceptmember.do">탈퇴 회원</a></li>
				<li class="nav-item"><a class="nav-link" href="manager.do">관리자</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
							<!-- 전체회원관리 -->
							<!-- 전체회원관리 -->
							<form action="${pageContext.request.contextPath}/managerdogmomdelete.do" method="post">
							<sec:csrfInput/>
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 4%">번호</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">이메일</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">닉네임</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">댕댕이이름</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">성별</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 9%">중성화여부</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">댕댕이생일</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">댕댕이등록일자</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">견주승인일자</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">강등</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<!-- for -->
							  	<c:forEach items="${dogmomlist.list}" var="dml">
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.id}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.nick}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.name}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.gender}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.neutralization}</td>
							     <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.bdate}</td>
							     <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.regDate}</td>
							     <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.permitdate}</td>
							     <td style="padding: .45rem; text-align: center; font-size: 12px">
							     	<button class="btn btn-default" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer; background-color: white" 
							      		name="id" value="${dml.dogDTO.id}">
										강등
									</button>
							     </td>
							    </tr>
							  	</c:forEach>
							    <!-- for 끝 -->
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