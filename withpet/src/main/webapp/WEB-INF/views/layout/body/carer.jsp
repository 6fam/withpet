<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<img src="resources/img/care.png"
					style="width: 120px; display: block;">
			</h1>
		</div>
		<div class="col-sm-9">
			<a href="care_write.do" class="btn btn-outline-danger"
				style="width: 100px; height: 30px; font-size: 12px; margin-left: -40px; margin-top: 4px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">글쓰기</a>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<!-- 돌보미 게시판 시작 -->
	<div class="row" style="margin-left: 0px; margin-right: 0px">
		<div class="col-sm-12">
			<table class="table table-hover" style="font-size: 13px">
				<thead style="border-color:red;background:#e9ecef;color:#000;">
					<tr>
						<th width="7%">글번호</th>
						<th width="5%">카테고리</th>
						<th width="45%">제목</th>
						<th width="10%">작성자</th>
						<th width="23%">기간</th>
						<th width="10%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.careLDTO.list}" var="careList">
						<tr style="text-align: left">
							<td>${careList.boardNo}</td>
							<td><span class="badge badge-info" style="padding: 7px;">${careList.categoryName}</span></td>
							<td><a href="care_detail.do?boardNo=${careList.boardNo}">${careList.title}</a></td>
							<td>${careList.id}</td>
							<td>${careList.wdate}</td>
							<td>${careList.hits}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 돌보미 게시판 끝 -->

	<!-- 돌보미 페이징 시작 -->
	<div class="row" style="margin-left: 0px">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<div>
				<c:set var="pb" value="${requestScope.careLDTO.pagingBean }" />
				<ul class="pagination">
					<c:if test="${pb.previousPageGroup }">
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/carer.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPageOfPageGroup }"
						end="${pb.endPageOfPageGroup }">
						<c:choose>
							<c:when test="${pb.nowPage!=i }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/carer.do?pageNo=${i}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link"
									href="#">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/carer.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="col-sm-5"></div>
	</div>
	<!-- 돌보미 페이징 끝 -->

</div>
