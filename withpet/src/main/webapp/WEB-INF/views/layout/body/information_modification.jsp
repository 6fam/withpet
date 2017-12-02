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
		style="margin-left: 0px; margin-bottom: 60px; margin-right: 0px">
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					href="information_modification.do">회원정보수정</a></li>
				<li class="nav-item"><a class="nav-link"
					href="information_pw_modification.do">비밀번호수정</a></li>
				<li class="nav-item"><a class="nav-link"
					href="dropMemberForm.do">회원탈퇴</a></li>
			</ul>
		</div>
	</div>
	
	<!-- 변경 정보 등록 -->
	<form action="${pageContext.request.contextPath }/updateMemberInfo.do" method="post" onsubmit="return checkForm('회원 정보를 수정하시겠습니까?')">
	<sec:csrfInput/>
	<div class="row" style="margin-top: 10px;">
      	<div class="col-sm-2"></div>
      	<div class="col-sm-8"  style="margin-left:50px">
         <table class="table table-bordered">
             <tbody>   
               	<tr>
                    <td  style="text-align:center;font-weight:bold">아이디</td>
                    <td>${member.id }</td>
              	</tr>
               	<tr>
                    <td  style="text-align:center;font-weight:bold">회원등급</td>
                    <td>${member.role }</td>
              	</tr>
               	<tr>
                    <td  style="text-align:center;font-weight:bold">닉네임</td>
                    <td><input type="text" name="nick" value="${member.nick}" class="form-control" id="exampleInputText" required="required"></td>
              	</tr>
               	<tr>
                    <td  style="text-align:center;font-weight:bold">전화번호</td>
                    <td>
                    	<select class="form-control" id="exampleSelect1" style="width:130px; float: left">
						        <option>통신사선택</option>
						        <option>SKT</option>
						        <option>KT</option>
						        <option>LG</option>
						</select><input type="text" name="tel" required="required" style="width:480px; float: right" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="전화번호를 입력해주세요.">
						<small id="emailHelp" class="form-text text-muted" style="clear: both">'-'없이 입력해주세요.</small>
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