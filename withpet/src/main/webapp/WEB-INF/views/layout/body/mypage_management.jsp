<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<li class="nav-item"><a class="nav-link"
					href="mypage_participate.do?pageNo=1">모임참여내역</a></li>
				<li class="nav-item"><a class="nav-link"
					href="mypage_liked.do?pageNo=1">모임공감내역</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="mypage_myattenders.do?pageNo=1">내 모임 참여내역</a></li>
			</ul>
		</div>
	</div>

	<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember"
					style="padding: 20px 0px 20px 0px;">
					
					<!-- 총회원게시판 시작-->
					<p>
						<strong>총회원</strong>
					</p>
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-12" style="padding-left: 0px">
					<table class="table table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>아이디</th>
								<th>닉네임</th>
								<th>연락처</th>
								<th>비밀번호 답</th>
								<th>가입일자</th>
								<th>회원권한</th>
								<th>권한수정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>가입일자</td>
								<td class="tdtier"><select class="form-control tier-select"
									id="membertierselect" name="ccategoryNo">
								</select></td>
								<td><input type="submit"
									class="btn btn-outline-danger tierupdate" value="수정"
									style="height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px;">
								</td>
							</tr>
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
				</div>
				<div class="col-sm-5"></div>
			</div>

		</div>

	</div>

</div>
<!-- 정보끝 -->
