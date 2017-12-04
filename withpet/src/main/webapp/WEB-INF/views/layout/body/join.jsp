<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
	.form-group input{color:#ddd;font-weight:bold;font-family: 'Noto Sans KR', sans-serif;font-size: 14px;}
	.form-group select.form-control,.form-group select.form-control option{color:#969696;font-weight:bold;font-family: 'Noto Sans KR', sans-serif;font-size: 14px;}
</style>
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>		
		<div class="col-sm-10">
			<!-- 도화지 입니다. -->
			<div style="background-color: white; margin-top: 10px; margin-bottom: 40px; border: 1px solid #d1d1d1; height: 1000px">
				<div class="row page-header" style="margin-top: 20px;margin-bottom: 30px">
					<div class="col-sm-1"></div>
					<div class="col-sm-10"><h1 id="navbars"><img src="resources/img/join.png" style="width: 160px"></h1></div>
					<div class="col-sm-1"></div>
				</div>
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-10" style="padding-bottom: 100px">
						<form method="post" action="memberJoin.do">
							<sec:csrfInput/>
						    <div class="form-group">
						      <label for="exampleInputEmail1"><font style="font-size: 14px"><b>이메일</b></font></label>
						      <input type="text" name="id" class="form-control" id="id" aria-describedby="emailHelp" placeholder="아이디를 입력해주세요." onkeyup="dupleId()">
						      <small id="dupleMessage" class="form-text" style="color: #c1bfbf">아이디를 입력 해주세요.</small>
						    </div>
						    <div class="form-group">
						      <label for="exampleInputEmail1"><font style="font-size: 14px"><b>닉네임</b></font></label>
						      <input type="text" name="nick" class="form-control" id="nick" aria-describedby="emailHelp" placeholder="닉네임을 입력해주세요." onkeyup="">
						      <small id="dupleNickMessage" class="form-text" style="color: #c1bfbf">닉네임을 입력 해주세요.</small>
						    </div>
						    <div class="form-group">
						      <label for="exampleInputPassword1"><font style="font-size: 14px"><b>비밀번호</b></font></label>
						      <input type="password" name="password" class="form-control" placeholder="비밀번호를 입력해주세요." onkeyup="chkPassword()">
						      <small id="checkPwMessage" class="form-text" style="color: #c1bfbf">비밀번호를 입력 해주세요.</small>
						    </div>
						    <div class="form-group">
						      <label for="exampleInputPassword1"><font style="font-size: 14px"><b>비밀번호 확인</b></font></label>
						      <input type="password" name="passwordConfirm" class="form-control" id="confirm_pw" placeholder="비밀번호 확인을 입력해주세요." onkeyup="chkConfirmPw()">
							  <small id="checkConfirmPwMessage" class="form-text" style="color: #c1bfbf">비밀번호를 한번 더 입력해주세요.</small>
						    </div>
						    
						    <div class="form-group" style="clear: both">
						      <label for="exampleSelect1"><font style="font-size: 14px"><b>비밀번호 찾기 질문</b></font></label>
						      <select name="pwQuestion" class="form-control" id="exampleSelect1">
						        <option>당신의 고향은?</option>
						      </select>
						    </div>
						    <div class="form-group">
						      <label for="exampleInputEmail1"><font style="font-size: 14px"><b>비밀번호 찾기 질문 답변</b></font></label>
						      <input type="text" name="pwAnswer" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="비밀번호 찾기 답변을 입력해주세요.">
						    </div>
						    
						    <label for="exampleInputEmail1"><font style="font-size: 14px"><b>전화번호</b></font></label>
						    <div class="form-group" style="margin-bottom: 40px">
						      <select class="form-control" id="exampleSelect1" style="width:150px; float: left">
						        <option>통신사선택</option>
						        <option>SKT</option>
						        <option>KT</option>
						        <option>LG</option>
						      </select><input type="text" name="tel" style="width:600px; float: right" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="전화번호를 입력해주세요.">
						   	  <small id="emailHelp" class="form-text text-muted" style="clear: both">'-'없이 입력해주세요.</small>
						    </div>
						    
						    <div style="text-align: center; margin-top: 50px">
							    <button type="submit" class="btn btn-primary" style="cursor: pointer">가입</button>
							    <button type="button" class="btn btn-danger" style="cursor: pointer">취소</button>
						    </div>
						</form>
					</div>
					<div class="col-sm-1"></div>
				</div>
				
			</div>
		</div>		
		<div class="col-sm-1"></div>		
	</div> 
</div>