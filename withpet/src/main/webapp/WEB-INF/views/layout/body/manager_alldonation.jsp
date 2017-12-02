<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="!hasRole('ROLE_ADMIN')">
	<script type="text/javascript">
		alert("로그인 하세요!");
		location.href = "${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".boarddelete").click(function(){
		var bno=$(this).val();
		alert(bno)
	});
});//ready
</script>
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header"
		style="margin-top: 20px; margin-bottom: 20px">
		<div class="col-sm-11" style="margin-left: 20px">
			<h1 id="navbars">
				<img src="resources/img/adminpage.png"
					style="width: 198px; display: block;">
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<!-- 총회원게시판 시작 -->
	<div class="row"
		style="margin-left: 0px; margin-bottom: 60px; margin-right: 0px">
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					href="manager_allboard.do?pageNo=1">전체 모금함</a></li>
				<li class="nav-item"><a class="nav-link"
					href="manager_acceptDonationList.do?pageNo=1">신청 모금함</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember"
					style="padding: 20px 0px 20px 0px;">

					<!-- 총회원게시판 시작-->
					<p>
						<strong>총 모금함 리스트</strong>
					</p>
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-12" style="padding-left: 0px">
								<table class="table table-hover table-bordered">
									<thead class="thead-dark">
										<tr>
											<th>모금함번호</th>
											<th>모금상태</th>
											<th>모금제목</th>
											<th>내용</th>
											<th>작성자</th>
											<th>작성일자</th>
										</tr>
									</thead>
									<c:forEach items="${requestScope.dlist.list}" var="dl">
									<tbody>
										<tr>
											<td>${dl.boardNo}</td>
											<c:choose>
											 <c:when test="${dl.categoryNo==31}">
											 	<td>모금함 신청</td>
											 </c:when>
											 <c:when test="${dl.categoryNo==32}">
											 	<td>모금중</td>
											 </c:when>
											 <c:otherwise>
											 	<td>모금완료</td>
											 </c:otherwise>
											</c:choose>
											<td>${dl.title}</td>
											<td>${dl.content}</td>
											<td>${dl.donationOrg}</td>
											<td>${dl.wdate}</td>
										</tr>
									</tbody>
									</c:forEach>
								</table>
								
						</div>
						<div class="col-sm-3"></div>
					</div>
					<!-- 총회원게시판 끝 -->
					<!-- 돌보미 페이징 시작 -->
<%-- 					<div class="row" style="margin-left: 0px">
						<div class="col-sm-4"></div>
						<div class="col-sm-6">
							<div>
								<c:set value="${requestScope.ablist.pagingBean}" var="pp" />

								<ul class="pagination">
									<c:if test="${pp.previousPageGroup }">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/manager_allboard.do?pageNo=${pp.startPageOfPageGroup-1}">&laquo;</a></li>
									</c:if>
									<c:forEach var="i" begin="${pp.startPageOfPageGroup}"
										end="${pp.endPageOfPageGroup }">
										<c:choose>
											<c:when test="${pp.nowPage!=i }">
												<li class="page-item"><a class="page-link"
													href="${pageContext.request.contextPath}/manager_allboard.do?pageNo=${i}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="#">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pp.nextPageGroup}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/manager_allboard.do?pageNo=${pp.endPageOfPageGroup+1}">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="col-sm-5"></div>
					</div> --%>
					<!-- 돌보미 페이징 끝 -->
				</div>
			</div>
		</div>
	</div>
</div>
