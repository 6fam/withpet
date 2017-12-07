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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".tierupdate").click(function(){
		var tier=$(this).parent().parent().find('select option:selected').val();
		alert(tier);
		$("#categoryNo").val(tier);
		
	});
});//ready
</script>
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
				<li class="nav-item"><a class="nav-link active" href="#">전체 회원</a></li>
				<li class="nav-item"><a class="nav-link" href="normalmember.do">회원</a></li>
				<li class="nav-item"><a class="nav-link" href="yebimommy.do">예비 주인님</a></li>
				<li class="nav-item"><a class="nav-link" href="dogmommy.do">댕댕이 주인님</a></li>
				<li class="nav-item"><a class="nav-link" href="exceptmember.do">탈퇴 회원</a></li>
				<li class="nav-item"><a class="nav-link" href="manager.do">관리자</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
						
						
							<!-- 전체회원관리 -->
							<form action="${pageContext.request.contextPath}/managertierupdate.do" 
							method="post" enctype="application/www-form-urlencoded">
							<sec:csrfInput/>
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 8%">번호</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">이메일</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">닉네임</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 20%">연락처</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">포인트</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 12%">가입일자</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">회원등급</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">회원등급</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:forEach items="${allMember.list}" var="al">
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${al.id}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${al.nick}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${al.tel}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${al.money}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${al.regdate}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">
								     <select class="form-control tier-select" style="font-size: 12px; height: 24px; padding-top:2px; padding-bottom:2px">
	                                      <c:forEach items="${requestScope.tier}" var="tr">
															<c:choose>
																<c:when test="${tr.categoryNo==al.categoryNo}">
																	<option value="${tr.categoryNo}" selected="selected">${tr.categoryName}</option>
																</c:when>
																<c:otherwise>
																	<option value="${tr.categoryNo}">${tr.categoryName}</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
	                                 </select>
							      </td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">
							      	<button class="btn btn-default tierupdate"  type="submit" 
							      	 name="id" value="${al.id}"
							      	 style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer;  background-color: white">
										변경
									</button>
							      </td>
							    </tr>
							  </c:forEach>
							  </tbody>
							</table>
							<input type="hidden" name="categoryNo"  id="categoryNo" value="">
							</form>
							<!-- 전체회원관리 끝 -->
							<!-- 돌보미 페이징 시작 -->
							<div class="row" style="margin-left: 0px">
								<div class="col-sm-4"></div>
								<div class="col-sm-6">
									<div>
										<c:set value="${requestScope.allMember.pagingBean}" var="pp" />
										<ul class="pagination">
											<c:if test="${pp.previousPageGroup }">
												<li class="page-item"><a class="page-link"
													href="${pageContext.request.contextPath}/allmember.do?pageNo=${pp.startPageOfPageGroup-1}">&laquo;</a></li>
											</c:if>
											<c:forEach var="i" begin="${pp.startPageOfPageGroup}"
												end="${pp.endPageOfPageGroup }">
												<c:choose>
													<c:when test="${pp.nowPage!=i }">
														<li class="page-item"><a class="page-link"
															href="${pageContext.request.contextPath}/allmember.do?pageNo=${i}">${i}</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item disabled"><a class="page-link"
															href="#">${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if test="${pp.nextPageGroup}">
												<li class="page-item"><a class="page-link"
													href="${pageContext.request.contextPath}/allmember.do?pageNo=${pp.endPageOfPageGroup+1}">&raquo;</a></li>
											</c:if>
										</ul>
									</div>
								</div>
								<div class="col-sm-5"></div>
							</div>
							<!-- 돌보미 페이징 끝 -->
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