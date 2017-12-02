<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="container" style="background-color: white;  border: solid 1px #adadad; margin-top: 10px">  
	<div class="row page-header" style="margin-top: 20px; padding-bottom:20px;border-bottom:  solid 1px #cecece">
		<div class="col-sm-1"></div>
		<div class="col-sm-6">
			<h1 id="navbars">
				<img src="resources/img/message.png" style="width: 120px">
			</h1>
		</div>
    </div>
	
	<div class="row">
		<div class="col-sm-2" style="border-right: solid 1px #adadad; height: 500px">
			<div class="list-group" style="margin-top: 20px">
			  <a href="receivemessage.do?pageNo=1" class="list-group-item list-group-item-action" style="padding-left:10px; padding-top:5px; padding-bottom: 5px; font-size: 14px; text-align: center">받은쪽지함(${notReadMessageCount}/${memberAllCountMessage})</a>
			  <a href="sendmessage.do?pageNo=1" class="list-group-item list-group-item-action" style="padding-left:10px; padding-top:5px; padding-bottom: 5px; font-size: 14px; text-align: center">보낸쪽지함</a>
			</div>
		</div>
		<div class="col-sm-10" style="border-right:height: 500px; padding-left: 0px; padding-right: 0px; padding-top: 20px">
			<form action="writemessage.do" method="post">
				<sec:csrfInput/>
				<div class="row">
					<div class="col-sm-1" style="padding-left: 25px; padding-right: 0px"><font style="font-size: 12px; margin-top: 20px"><b>받는사람</b></font></div>
					<div class="col-sm-4">
						<input type="text" name="receiver" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="받는사람을 입력해주세요." required="required" style="font-size: 12px">
					</div>
				</div>
				<div class="row">
					<textarea name="receivemsg" rows="15" cols="58" style="resize:none; margin-left: 20px; margin-top: 20px; font-size: 12px" required="required"></textarea>
				</div>
				<div class="row">
					<button type="submit" class="btn btn-outline-danger" style="height: 30px; font-size: 13px; margin-top: 8px; margin-bottom: 8px; padding-top: 6px; cursor: pointer; margin-left: 25px">
					보내기 </button>
				</div>
			</form>
		</div>
	</div>
	
</div>