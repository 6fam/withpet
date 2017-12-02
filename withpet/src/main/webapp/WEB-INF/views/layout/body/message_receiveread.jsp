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
			<a href="messagewrite.do" class="btn btn-danger"
				style="height: 30px; width: 100%; font-size: 13px; margin-top: 8px; margin-bottom: 8px; padding-top: 6px; cursor: pointer">
				쪽지쓰기 </a>
			<div class="list-group" style="margin-top: 20px">
				<a href="receivemessage.do?pageNo=1" class="list-group-item list-group-item-action active" style="padding-left:10px; padding-top:5px; padding-bottom: 5px; font-size: 14px; text-align: center">받은쪽지함(${notReadMessageCount}/${memberAllCountMessage})</a>
				<a href="sendmessage.do?pageNo=1" class="list-group-item list-group-item-action" style="padding-left:10px; padding-top:5px; padding-bottom: 5px; font-size: 14px; text-align: center">보낸쪽지함</a>
			</div>
		</div>
		<div class="col-sm-10" style="border-right:height: 500px; padding-left: 20px; padding-right: 20px; padding-top: 20px">
			<a href="deleteReceiveMessage.do?messageNo=${readReceiveMessage.messageNo}" class="btn btn-success"
				style="height: 25px; width: 10%; font-size: 13px; margin-top: 4px; margin-bottom: 8px; padding-top: 3px; cursor: pointer">
				삭제</a>
			<a href="messageanswer.do?sender=${readReceiveMessage.sender}" class="btn btn-success"
				style="height: 25px; width: 10%; font-size: 13px; margin-top: 4px; margin-bottom: 8px; padding-top: 3px; cursor: pointer">
				답장 </a><br>
			
			<font style="font-size: 14px"><b>보낸사람</b> : ${readReceiveMessage.sender}<br>
			<b>보낸시간</b> : ${readReceiveMessage.regdate}<br>
			</font>
			<hr>
			<font style="font-size: 14px">${readReceiveMessage.receivemsg }</font>
		</div>
	</div>
</div>