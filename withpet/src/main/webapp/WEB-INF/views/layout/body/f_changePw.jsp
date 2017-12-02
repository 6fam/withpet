<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>		
		<div class="col-sm-10">
			<!-- 도화지 입니다. -->
			<div style="background-color: white; margin-top: 10px; margin-bottom: 40px; border: 1px solid #d1d1d1; height: 650px">
				<div class="row page-header" style="margin-top: 150px;margin-bottom: 30px">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<h1 id="navbars" style="text-align: center">
							<img src="resources/img/findpw.png" style="width: 320px">
						</h1>
					</div>
					<div class="col-sm-3"></div>
				</div>
				
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<form action="${pageContext.request.contextPath }/changePw.do" method="post" onsubmit="return chkChangePWSubmit()">
							<sec:csrfInput/>
								<div class="form-group">
									<input type="hidden" name="id" id="id" value="${id }">
								</div>
								<div class="form-group">
			                    	<input type="password" name="password" class="form-control" id="pw" placeholder="비밀번호를 입력해주세요." onkeyup="chkPassword()">
								    <small id="checkPwMessage" class="form-text" style="color: #c1bfbf">비밀번호를 입력 해주세요.</small>
							    </div>
							    <div class="form-group">
			                    	<input type="password" name="passwordConfirm" class="form-control" id="confirm_pw" placeholder="비밀번호 확인을 입력해주세요." onkeyup="chkConfirmPw()">
									<small id="checkConfirmPwMessage" class="form-text" style="color: #c1bfbf">비밀번호를 한번 더 입력해주세요.</small>
								</div>						    	
								<Button class="btn btn-outline-info" type="submit"
									style="height: 40px; width:220px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px;cursor: pointer">
									확인
								</Button>
								<a href="${pageContext.request.contextPath }/home.do" class="btn btn-outline-danger"
									style="height: 40px; width:219px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 13px;cursor: pointer">
									취소
								</a>
					</form>
					</div>
					<div class="col-sm-3"></div>
				</div>
				
			</div>
		</div>
		<div class="col-sm-1"></div>		
	</div> 
</div>