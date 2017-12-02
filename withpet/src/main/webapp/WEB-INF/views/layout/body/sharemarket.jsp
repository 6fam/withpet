<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
td, th {
	text-align: center;
}
</style>
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header"
		style="margin-top: 20px; margin-bottom: 20px">
		<div class="col-sm-2" style="margin-left: 20px;">
			<h1 id="navbars">
				<img src="resources/img/market.png"
					style="width: 145px; display: block;">
			</h1>
		</div>

	<!-- 나눔마켓 글쓰기  -->
		<div class="col-sm-9">
			<a href="sharemarket_write.do" class="btn btn-outline-danger"
				style="width: 100px; height: 30px; font-size: 12px; margin-left: -10px; 
				margin-top: 4px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">글쓰기</a>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<!-- 나눔마켓 게시판 시작 -->
	<div class="row" style="margin-left: 0px; margin-right: 0px">
		<div class="col-sm-12">
			<table class="table table-hover table-bordered" style="font-size: 13px">
				<thead class="thead-dark">
					<tr>
						<th>글번호</th>
						<th>진행상태</th>
						<th>제목</th>
						<th>작성자</th>
						<th>기간</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
	 		 		<c:forEach var="sm" items="${list}">
						<tr>
							<td>${sm.boardNo}</td>
							<td>${sm.categoryName}</td> 
							<td><a href="sharemarket_detail.do?boardNo=${sm.boardNo}">${sm.title}</a></td>
							<td>${sm.id}</td>
				 			<td>${sm.wdate}</td>
							<td>${sm.hits}</td>
						</tr>
					</c:forEach>   
				</tbody>
			</table>
		</div>
	</div>
	<!-- 나눔마켓 게시판 끝 -->

	<!-- 나눔마켓 페이징 시작 -->
	<div class="row" style="margin-left: 0px">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<div>
				<ul class="pagination">
					<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">&raquo;</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="col-sm-5"></div>
	</div>
	<!-- 나눔마켓 페이징 끝 -->
</div>
