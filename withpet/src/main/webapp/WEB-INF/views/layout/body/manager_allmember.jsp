<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="!hasRole('ROLE_MANAGER')">
	<script type="text/javascript">
		alert("로그인 하세요!");
		location.href = "${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".tierupdate").click(function(){
		 var ccategoryNo = $(this).parent().parent().find('.tdtier').find('select option:selected').val();
		// alert(ccategoryNo);
		 $("#categoryNo").val(ccategoryNo);
		 //alert( $("#categoryNo").val());
		// var id = $(this).parent().find('#iid').val();
		/*   */
		var id = $(this).parent().find('#iid').val();
		$("#id").val(id);
	});
});//ready
</script>
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header"
		style="margin-top: 20px; margin-bottom: 20px">
		<div class="col-sm-11" style="margin-left: 20px">
			<h1 id="navbars">
				<img src="resources/img/adminpage.png" style="width: 198px; display: block;">
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<!-- 총회원게시판 시작 -->
	<div class="row"
		style="margin-left: 0px; margin-bottom: 60px; margin-right: 0px">
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active" href="manager_allmember.do?pageNo=1">전체 회원</a></li>
				<li class="nav-item"><a class="nav-link" href="manager_member.do?pageNo=1">일반회원</a></li>
				<li class="nav-item"><a class="nav-link" href="manager_petowner.do?pageNo=1">견주</a></li>
				<li class="nav-item"><a class="nav-link" href="manager_ownerwaiting.do?pageNo=1">견주대기자</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember"
					style="padding: 20px 0px 20px 0px;">
					
					<!-- 총회원게시판 시작-->
					<p>
						<strong>총회원</strong>
					</p>
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-12" style="padding-left: 0px">
					<%-- 	 --%>
							<form action="${pageContext.request.contextPath}/managertierupdate.do" 
							method="post" enctype="application/www-form-urlencoded">
							<sec:csrfInput/>
								<table class="table table-hover table-bordered">
									<thead class="thead-dark">
										<tr>
											<th>아이디</th>
											<th>닉네임</th>
											<th>연락처</th>
											<th>가입일자</th>
											<th>회원권한</th>
											<th>권한수정</th>
										</tr>
									</thead>
									<tbody>
									
									<c:forEach items="${amemberList.list}" var="aml"> 
										<tr>
											<td>${aml.id}</td>
											<td>${aml.nick}</td>
											<td>${aml.tel}</td>
											<td>${aml.regdate}</td>
											<td class="tdtier"><select class="form-control tier-select" id="membertierselect" name="ccategoryNo">
														<c:forEach items="${requestScope.tier}" var="tr">
														<c:if test="${tr.categoryNo<14}">
															<c:choose>
																<c:when test="${tr.categoryNo==aml.categoryNo}">
																	<option value="${tr.categoryNo}" selected="selected">${tr.categoryName}</option>
																</c:when>
																<c:otherwise>
																	<option value="${tr.categoryNo}">${tr.categoryName}</option>
																</c:otherwise>
															</c:choose>
														</c:if>
														</c:forEach>
											</select></td>
											<td>
												<input type="hidden" name="iid"  id="iid" value="${aml.id}">
												<c:if test="${aml.categoryNo<13}">
												<input type="submit" class="btn btn-outline-danger tierupdate" value="수정"
												 style="height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px;">
												</c:if>
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								<input type="hidden" name="categoryNo"  id="categoryNo" value="">
								<input type="hidden" name="id"  id="id" value="">
							</form>
						</div>
						<div class="col-sm-3"></div>
					</div>
					<!-- 총회원게시판 끝 -->
					
					<sec:authentication property="authorities" var="ooo"/>
					<!-- 돌보미 페이징 시작 -->
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-4"></div>
						<div class="col-sm-6">
							<div>
								<c:set value="${requestScope.amemberList.pagingBean}" var="pp" />

								<ul class="pagination">
									<c:if test="${pp.previousPageGroup }">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/manager_allmember.do?pageNo=${pp.startPageOfPageGroup-1}">&laquo;</a></li>
									</c:if>
									<c:forEach var="i" begin="${pp.startPageOfPageGroup}"
										end="${pp.endPageOfPageGroup }">
										<c:choose>
											<c:when test="${pp.nowPage!=i }">
												<li class="page-item"><a class="page-link"
													href="${pageContext.request.contextPath}/manager_allmember.do?pageNo=${i}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="#">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pp.nextPageGroup}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/manager_allmember.do?pageNo=${pp.endPageOfPageGroup+1}">&raquo;</a></li>
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
