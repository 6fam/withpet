<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<li class="nav-item"><a class="nav-link"
					href="manager_allboard.do?pageNo=1">전체 게시글</a></li>
				<li class="nav-item"><a class="nav-link"
					href="manager_boardtype.do?pageNo=1&categoryNo=1">모임 게시글</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="manager_boardtype.do?pageNo=1&categoryNo=2">돌보미 게시글</a></li>
				<li class="nav-item"><a class="nav-link"
					href="manager_boardtype.do?pageNo=1&categoryNo=3">나눔마켓 게시글</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember"
					style="padding: 20px 0px 20px 0px;">

					<!-- 총회원게시판 시작-->
					<p>
						<strong>돌보미 게시글</strong>
					</p>
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-12" style="padding-left: 0px">
							<table class="table table-hover table-bordered">
								<thead class="thead-dark">
									<tr>
										<th>글번호</th>
										<th>글타입</th>
										<th>제목</th>
										<th>내용</th>
										<th>작성자</th>
										<th>조회수</th>
										<th>작성일자</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.ablist.list}" var="abl">
										<tr>
											<td>${abl.boardNo}</td>
											<td>${abl.categoryName}</td>
											<td>${abl.title}</td>
											<td>${abl.content}</td>
											<td>${abl.id}</td>
											<td>${abl.hits}</td>
											<td>${abl.wdate}</td>
											<td><button type="button" class="btn btn-outline-danger"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false"
													style="height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-sm-3"></div>
					</div>
					<!-- 총회원게시판 끝 -->
					<!-- 돌보미 페이징 시작 -->
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-4"></div>
						<div class="col-sm-6">
							<div>
								<c:set value="${requestScope.ablist.pagingBean}" var="pp" />

								<ul class="pagination">
									<c:if test="${pp.previousPageGroup }">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/manager_boardtype.do?categoryNo=2&pageNo=${pp.startPageOfPageGroup-1}">&laquo;</a></li>
									</c:if>
									<c:forEach var="i" begin="${pp.startPageOfPageGroup}"
										end="${pp.endPageOfPageGroup }">
										<c:choose>
											<c:when test="${pp.nowPage!=i }">
												<li class="page-item"><a class="page-link"
													href="${pageContext.request.contextPath}/manager_boardtype.do?categoryNo=2&pageNo=${i}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="#">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pp.nextPageGroup}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/manager_boardtype.do?categoryNo=2&pageNo=${pp.endPageOfPageGroup+1}">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="col-sm-5"></div>
					</div>
					<!-- 돌보미 페이징 끝 -->
				</div>
			</div>
		</div>
	</div>
</div>
