<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header"
		style="margin-top: 20px; padding-bottom: 20px; border-bottom: solid 1px #cecece">
		<div class="col-sm-1"></div>
		<div class="col-sm-6">
			<h1 id="navbars">
				<img src="resources/img/message.png" style="width: 120px">
			</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-2"
			style="border-right: solid 1px #adadad; height: 600px">
			<a href="messagewrite.do" class="btn btn-danger"
				style="height: 30px; width: 100%; font-size: 13px; margin-top: 8px; margin-bottom: 8px; padding-top: 6px; cursor: pointer">
				쪽지쓰기 </a>
			<div class="list-group" style="margin-top: 20px">
				<a href="receivemessage.do?pageNo=1"
					class="list-group-item list-group-item-action active"
					style="padding-left: 10px; padding-top: 5px; padding-bottom: 5px; font-size: 14px; text-align: center">받은쪽지함(${notReadMessageCount}/${memberAllCountMessage})</a>
				<a href="sendmessage.do?pageNo=1"
					class="list-group-item list-group-item-action"
					style="padding-left: 10px; padding-top: 5px; padding-bottom: 5px; font-size: 14px; text-align: center">보낸쪽지함</a>
			</div>
		</div>
		<div class="col-sm-10"
			style="border-right: height: 600px; padding-left: 0px; padding-right: 0px">
			<table class="table" style="font-size: 13px">
				<thead>
					<tr style="background-color: #f2f2f2">
						<th style="width: 7%">쪽지</th>
						<th style="width: 10%">보낸사람</th>
						<th style="width: 60%">내용</th>
						<th style="width: 20%">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="message" items="${messageReceivelist.list}" varStatus="status">
						<c:choose>
							<c:when test="${message.flag == 0}">
								<tr>
									<td style="width: 7%">${message.messageNo}</td>
									<td>${message.sender}</td>
									<td><a href="receiveread.do?messageNo=${message.messageNo}" style="color: black">${message.receivemsg}</a></td>
									<td>${message.regdate}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td style="width: 7%">${message.messageNo}</td>
									<td>${message.sender}</td>
									<td><a href="receiveread.do?messageNo=${message.messageNo}" style="color: black"> ${message.receivemsg}</a> <img src="resources/img/new_icon.png" width="13px" height="13px"></td>
									<td>${message.regdate}</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>


			<div class="row" style="margin-left: 0px">
				<div class="col-sm-4"></div>
				<div class="col-sm-6" align="center">
					<div>
						<c:set var="pb" value="${messageReceivelist.pagingBean}" />
						<ul class="pagination">
							<c:if test="${pb.previousPageGroup }">
								<li class="page-item"><a class="page-link" href="receivemessage.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
							</c:if>
							<c:forEach var="i" begin="${pb.startPageOfPageGroup }" end="${pb.endPageOfPageGroup }">
								<c:choose>
									<c:when test="${pb.nowPage!=i }">
										<li class="page-item"><a class="page-link" href="receivemessage.do?pageNo=${i}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="#">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pb.nextPageGroup}">
								<li class="page-item"><a class="page-link" href="receivemessage.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				<div class="col-sm-5"></div>
			</div>
		</div>
	</div>

</div>