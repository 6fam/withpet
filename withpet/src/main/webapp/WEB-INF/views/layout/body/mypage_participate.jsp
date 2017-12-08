<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<li class="nav-item"><a class="nav-link"
					href="mypage.do">내정보</a></li>
				<sec:authorize access="hasRole('ROLE_DOGMOM')">
					<li class="nav-item"><a class="nav-link"
					href="mypage_opened.do?pageNo=1">모임개설내역</a></li>
				</sec:authorize>
				<li class="nav-item"><a class="nav-link active"
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

	<div class="row"
		style="margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 100px">
		<div class="col-sm-12">
			<!-- 반복구간 -->
				<!-- 1 -->
				<c:choose>
					<c:when test="${fn:length(requestScope.listdto.list)==0 }">
						<br><div align="center"><b>참여한 모임 내역이 없습니다. </b></div>
					</c:when>
					<c:otherwise>
						<c:forEach var="alist" items="${requestScope.listdto.list }">
							<div class="row"
								style="margin-left: 0px; border: 1px solid #ddd; width: 100%; margin: 0 auto; margin-bottom: 30px">
								<!-- 섬네일시작 -->
								<div class="col-sm-2" style="margin: 30px 0 30px 30px;">
									<img src="${pageContext.request.contextPath }/resources/upload/${alist.imgPath}" width="150px" height="150px">
								</div>
								<!-- 섬네일끝 -->
								<div class="col-sm-9" style="margin: 30px 0 0 30px">
									<table class="table table-bordered">
										<tbody>
											<tr>
												<td style="text-align: center; font-weight: bold">모임제목</td>
												<td>${alist.title }</td>
												<td style="text-align: center; font-weight: bold">모임상태</td>
												<td>${alist.meetingState }</td>
											</tr>
											<tr>
												<td style="text-align: center; font-weight: bold">모임기간</td>
												<td>${alist.date.meetingStart } ~ ${alist.date.meetingEnd }</td>
												<td style="text-align: center; font-weight: bold">모임종류</td>
												<td>${alist.meetingType}</td>
											</tr>
											<tr>
												<td style="text-align: center; font-weight: bold">모임장소</td>
												<td colspan="3">${alist.place }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div> 
						</c:forEach> 
					</c:otherwise>
				</c:choose>
				<!-- 반복종료 -->

			<!-- 총회원게시판 끝 -->
			<!-- 돌보미 페이징 시작 -->
			<div class="row" style="margin-left: 0px">
				<div class="col-sm-3"></div>
				<div class="col-sm-6" align="center">
						<c:set var="pb" value="${requestScope.listdto.pagingBean }"/>
						<ul class="pagination">
								<c:if test="${pb.previousPageGroup }">
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/mypage_participate.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
								</c:if>
								<c:forEach var="i" begin="${pb.startPageOfPageGroup }" end="${pb.endPageOfPageGroup }">
									<c:choose>
										<c:when test="${pb.nowPage!=i }">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/mypage_participate.do?pageNo=${i}">${i}</a></li>	
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link" href="#">${i}</a></li>									
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pb.nextPageGroup}">
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/mypage_participate.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
								</c:if>
						</ul>
					</div>
				<div class="col-sm-3"></div>
			</div>

		</div>

	</div>

</div>
<!-- 정보끝 -->
