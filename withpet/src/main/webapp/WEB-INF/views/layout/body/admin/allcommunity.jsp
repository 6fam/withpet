<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="!hasRole('ROLE_MANAGER')">
	<script type="text/javascript">
		alert("로그인 하세요!");
		location.href = "${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>   
<style>
.communityBoxul li {height:30px; display:inline-block; cursor:pointer; line-height:30px; padding:0 15px; text-align:center; box-sizing:border-box;}
.communityBox ul li:hover {background:#ff5500}
</style>    
<div class="container" style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-12">
			<h1 id="navbars">
				<font style="font-size: 35px">아이콘이 들어올공간입니다.</font>
			</h1>
		</div>
	</div>
	
	<!-- 총회원게시판 시작 -->
	<div class="row"
		style="margin-left: 0px; margin-bottom: 60px; margin-right: 0px">
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active community" href="#">전체 커뮤니티 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="communitycategory.do">커뮤니티 카테고리 관리</a></li>
			</ul>
			<div class="communityBox" style="position: absolute; top:45px; z-index: 1000; background: #aaa;
    				color: #fff; height: 30px; display: none">
				<ul style="margin: 0px; padding: 0px; font-size: 12px; margin-top: 0px">
					<!-- for로 돌리시면됩니다. -->
					<c:forEach items="${categoryType}" var="ct">
					<li style="height: 30px; display: inline-block; cursor: pointer; line-height: 30px; padding: 0 15px;
						    text-align: center; box-sizing: border-box;">
						<a href="activecommunity.do?categoryNo=${ct.categoryNo}&categoryName=${ct.categoryName}">${ct.categoryName}</a>
					</li>
					</c:forEach>
    				<!-- for 끝 -->
				</ul>
			</div>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
							<h2>총 게시물</h2>
						
							<!-- 전체 커뮤니티 관리 -->
							<form action="${pageContext.request.contextPath}/removecommunity.do" method="post">
							<sec:csrfInput/>
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">글번호</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 13%">카테고리명</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 33%">제목</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 20%">작성자</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">조회수</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 19%">등록일자</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">삭제</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:forEach items="${comlist.list}" var="cl">
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.boardNo}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.categoryName}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.title}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.id}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.hits}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.wdate}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">
							      	<button class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer; background-color: white"
							      	name="boardNo" value="${cl.boardNo}">
										삭제
									</button>
							      </td>
							    </tr>
							  </c:forEach>
							    </tbody>
							</table>
							</form>
							
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