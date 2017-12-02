<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>		
		<div class="col-sm-10">
			<!-- 도화지 입니다. -->
			<sec:authorize access="!hasRole('ROLE_MEMBER')"> 
			<div style="background-color: white; margin-top: 10px; margin-bottom: 40px; border: 1px solid #d1d1d1; height: 650px">
				<div class="row page-header" style="margin-top: 150px;margin-bottom: 30px">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<h1 id="navbars" style="text-align: center">
							<img src="resources/img/login.png" style="width: 320px">
						</h1>
					</div>
					<div class="col-sm-3"></div>
				</div>
				
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<form id="loginForm" action="${pageContext.request.contextPath }/login.do" method="post" style="margin: 0px; padding: 0px">
							<sec:csrfInput/><%--csrf 토큰 --%>
							<input type="text" name="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="아이디" style="margin-bottom: 10px; font-size: 14px">
							<input type="password" name="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="비밀번호" style="font-size: 14px">
							<Button class="btn btn-outline-info" type="submit"
								style="height: 35px; width:144px; font-size: 12px; margin-top: 4px; margin-bottom: 8px; padding-top: 6px;cursor: pointer">
								로그인
							</Button>
							<a href="join.do" class="btn btn-outline-success"
								style="height: 35px; width:145px; font-size: 12px; margin-top: 4px; margin-bottom: 8px; padding-top: 8px;cursor: pointer">
								회원가입
							</a>
							<a href="f_idbyquestion.do" class="btn btn-outline-danger"
								style="height: 35px; width:144px; font-size: 12px; margin-top: 4px; margin-bottom: 8px; padding-top: 8px;cursor: pointer">
								비밀번호 찾기
							</a>
						</form>
					</div>
					<div class="col-sm-3"></div>
				</div>
				
			</div>
			</sec:authorize>
		</div>
		<div class="col-sm-1"></div>		
	</div> 
</div>