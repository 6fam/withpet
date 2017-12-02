<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<script>
		alert("로그인 하세요!");
		location.href="${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_MEMBER')">
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header"
		style="margin-top: 20px; margin-bottom: 20px">
		<div class="col-sm-11" style="margin-left: 20px">
			<h1 id="navbars">
				<img src="resources/img/information_modification.png"
					style="width: 210px; display: block;">
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>
	
	<!-- 회원정보 수정 / 비밀번호 수정 탭 -->
	<div class="row"
		style="margin-left: 0px	; margin-bottom: 60px; margin-right: 0px">
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link"
					href="information_modification.do">회원정보수정</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="information_pw_modification.do">비밀번호수정</a></li>
				<li class="nav-item"><a class="nav-link"
					href="dropMemberForm.do">회원탈퇴</a></li>
			</ul>
		</div>
	</div>

	<!-- 변경 정보 등록 -->
	<form action="${pageContext.request.contextPath }/updateMemberPWInfo.do" method="post" onsubmit="return chkUpdatePWSubmit()">
		<sec:csrfInput/>
		<div class="row" style="margin-top: 10px;">
	      	<div class="col-sm-2"></div>
	      	<div class="col-sm-8"  style="margin-left:50px">
	         <table class="table table-bordered">
	             <tbody>   
	               	<tr>
	                    <td  style="text-align:center;font-weight:bold">아이디</td>
	                    <td>
	                    	<div class="form-group">
	                    	<input type="text" name="id" class="form-control" id="id" value="${member.id }" readonly="readonly">
						    </div>
	                    </td>
	              	</tr>
	               	<tr>
	                    <td  style="text-align:center;font-weight:bold">비밀번호</td>
	                    <td>
	                    	<div class="form-group">
	                    	<input type="password" name="password" class="form-control" id="pw" placeholder="비밀번호를 입력해주세요." onkeyup="chkPassword()">
						    <small id="checkPwMessage" class="form-text" style="color: #c1bfbf">비밀번호를 입력 해주세요.</small>
						    </div>
	                    </td>
	              	</tr>
	               	<tr>
	                    <td  style="text-align:center;font-weight:bold">비밀번호 확인</td>
	                    <td>
	                    	<div class="form-group">
	                    	<input type="password" name="passwordConfirm" class="form-control" id="confirm_pw" placeholder="비밀번호 확인을 입력해주세요." onkeyup="chkConfirmPw()">
							<small id="checkConfirmPwMessage" class="form-text" style="color: #c1bfbf">비밀번호를 한번 더 입력해주세요.</small>
							</div>
	                    </td>
	              	</tr>
	               	<tr>
	                    <td  style="text-align:center;font-weight:bold">비밀번호 찾기 질문</td>
	                    <td>
	                    	 <select class="form-control" id="exampleSelect1" name="categoryNo">
										<c:forEach items="${requestScope.pwQuestion }" var="list">
									    	<option value="${list.CATEGORY_NO}">${list.CATEGORY_NAME}</option>
										</c:forEach>
							</select>
						</td>
	              	</tr>
	              	<tr>
	                    <td  style="text-align:center;font-weight:bold">비밀번호 찾기 질문 답변</td>
	                    <td>
	                    	<div class="form-group">
	                    		<input type="text" name="pwAnswer" class="form-control" id="pw_answer" required="required">
	                    	</div>
	                    </td>
	              	</tr>
	             </tbody>
	           </table>
	         </div>
	    </div>
		<!--  변경 정보 입력 끝 -->
		
		<!-- 버튼 시작 -->
		<div class="row" style="margin-top: 30px;">
	      <div class="col-sm-5"></div>
	      <div class="col-sm-4">
		         <button type="submit" class="btn btn-outline-danger" id="dogSubmitBtn" 
		            style="width: 100px; height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">수정</button>
				<a href="${pageContext.request.contextPath }/mypage.do">
			         <button type="button" class="btn btn-outline-danger"
			            style="width: 100px; height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">취소</button>
		           </a>
		  </div> 
	      <div class="col-sm-4"></div>
	   </div>
	</form>
	   <!-- 버튼 종료 -->
	
</div>
</sec:authorize>