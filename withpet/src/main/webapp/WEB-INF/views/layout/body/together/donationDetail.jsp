<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="container" style="z-index: 1; background-color: white; border: solid 1px #adadad; margin-top: 10px; padding-bottom: 30px">
	<div class="row page-header">
		<div class="col-sm-1"></div>
		<div class="col-sm-6">
			<h1 id="navbars">
				<img src="resources/img/care_detail.png" style="width: 230px;">
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>
	
	<!-- 이미지부분 -->
	<div class="row" style="margin-top: 0px;">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10">
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="height: 100%">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				
				<div class="carousel-inner" role="listbox">
					<c:forEach items="${donation.imgPathList}" var="img" varStatus="status">
						<c:choose>
							<c:when test="${status.index eq 0}">
								<div class="carousel-item active">
									<img class="d-block img-fluid w-100" src="${pageContext.request.contextPath}/resources/upload/${img.imgPath}" alt="" style="height:450px">
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item">
									<img class="d-block img-fluid w-100" src="${pageContext.request.contextPath}/resources/upload/${img.imgPath}" alt="" style="height:450px">
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="col-sm-1" ></div>
	</div>

	<!-- 설명부분 -->
	<div class="row" style="margin-left: 0px; margin-top: 20px; margin-bottom: 60px">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10"
			style="font-size: 16px">
			<p>
				<strong>${donation.title}</strong>
			</p>
			${donation.content}
		</div>
		<div class="col-sm-1" ></div>
	</div>

	<hr>

	<!-- 기부금액 -->
	<div class="row" style="margin-left: 0px; margin-top: 20px">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10" style="text-align: center; font-size: 16px">
			<p style="font-size: 35px; color: #ff0066;">${donation.currentMoneyStr}원</p>
			<p>목표금액 : ${donation.dreamMoneyStr}원</p>
		</div>
		<div class="col-sm-1" ></div>
	</div>
	
	<div style="background-image: url('http://t1.kakaocdn.net/together_image/common/bg_fund_graph.png'); padding-bottom:39px">
		<img src="http://t1.kakaocdn.net/together_image/bicycle_move_ing.gif" style="margin-left: 470px;height: 188px; width: 180px;margin-top:80px">
	</div>
	
	<div class="row" style="margin-left: 0px; margin-top: -40px">
		<div class="col-sm-12">
			<div class="progress">
				<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: ${donation.donationPercent}%"></div>
			</div>
		</div>
	</div>
</div>

<div class="container" style="z-index: 1; background-color: white; border: solid 1px #adadad; margin-top: 10px; padding-bottom: 30px">
	<!-- 설명부분 -->
	<div class="row" style="margin-left: 0px; margin-top: 40px">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10" style="font-size: 16px">
			<p>
				<strong>모금함 개설자 정보</strong>
			</p>
			<hr>
			<b>모금 협회</b> : <font style="font-size: 14px">${donation.donationOrg}</font><br>
			<b>모금 은행</b> : <font style="font-size: 14px">${donation.bankName}</font><br>
			<b>모금 계좌주</b> : <font style="font-size: 14px">${donation.accountHost}</font><br>
			<b>모금 계좌 번호</b> : <font style="font-size: 14px">${donation.accountNo}</font><br>
			<b>모금 개설자</b> :
			<div class="btn-group" style="margin-left:5px" role="group" aria-label="Button group with nested dropdown">
				<div class="btn-group" role="group">
					<a id="btnGroupDrop2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor: pointer; text-decoration: none">
					${donation.id}
					</a>
					<div class="dropdown-menu" aria-labelledby="btnGroupDrop2">
						<a class="dropdown-item" href="messageanswer.do?sender=${donation.id}">쪽지 보내기</a>
					</div>
				</div>
			</div>
			<br>
			<button type="submit" id="sidebox" class="btn btn-success btn-block" style="cursor: pointer; margin-top: 40px; margin-bottom: 40px">기부하기</button>
		</div>
		<div class="col-sm-1" ></div>
	</div>
</div>

<div class="container" style="z-index: 1; background-color: white; border: solid 1px #adadad; margin-top: 10px; padding-bottom: 30px">
	<!-- 설명부분 -->
	<div class="row" style="margin-left: 0px; margin-top: 20px">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10" style="font-size: 16px">
			<p>
				<strong>덧글</strong>
			</p>
			<c:forEach items="${donation.replyList}" var="reply">
			<div class="row" style="margin-top: 15px; border-bottom: solid 1px #cecece; padding-bottom: 10px">
				<div class="col-sm-1">
					<c:choose>
						<c:when test="${reply.imgPath == 'dog_profile2.png'}">
							<img src="resources/img/dog_profile2.png" style="height:50px;width: 50px; border: solid 1px black; border-radius: 200px; margin-left:0px; margin-top:0px">
						</c:when>
						<c:when test="${reply.imgPath == null}">
							<img src="resources/img/dog_profile2.png" style="height:50px;width: 50px; border: solid 1px black; border-radius: 200px; margin-left:0px; margin-top:0px">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath }/resources/upload/${reply.imgPath}" style="height:50px;width: 50px; border: solid 1px black; border-radius: 200px; margin-left:0px; margin-top:0px">
						</c:otherwise>
					</c:choose>
				</div>	
				<div class="col-sm-11">
					<div class="row">
						<div class="col-sm-12" style="margin-top: -5px">
							<font style="font-size: 20px"><b>${reply.id}</b></font>
							<font style="font-size: 12px; margin-left: 5px; color: #919191">${reply.regDate}</font>
							<sec:authentication property="principal.id" var="sessionId"/>
							<c:if test="${reply.id == sessionId}">
								<img src="resources/img/trash.png" style="height: 10px; width: 10px; margin-top: 5px">
							</c:if>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12" style="font-size: 14px">${reply.content}</div>
					</div>
				</div>			
			</div>
			</c:forEach>
			<%-- <c:forEach items="${donation.replyList}" var="reply">
				글번호 : ${reply.replyNo} , 리플내용 : ${reply.content}, 리플작성자 : ${reply.id}<br>
			</c:forEach> --%>
		</div>
		<div class="col-sm-1" ></div>
	</div>
</div>

<!-- footer -->
<div class="container" style="z-index: 1; margin-top: 10px; padding-bottom: 0px; margin-bottom: -44px; background-image: url('http://t1.kakaocdn.net/together_image/common/bg_fund_graph.png')">
	<!-- 설명부분 -->
	<div class="row" style="margin-left: 0px; margin-top: 80px">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10" style="font-size: 16px; padding-bottom:80px; margin-top:105px">
			<img src="http://t1.kakaocdn.net/together_image/walk_move_end.gif" style="margin-bottom:-78px; width: 150px; height: 165px">
			<img src="http://t1.kakaocdn.net/together_image/bicycle_move_end.gif" style="margin-bottom:-78px; width: 150px; height: 165px">
			<img src="http://t1.kakaocdn.net/together_image/walk_move_ing.gif" style="margin-bottom:-78px; width: 150px; height: 165px; margin-left: 190px">
		</div>
		<div class="col-sm-1" ></div>
	</div>
</div>


<!-- 기부 창입니다. -->
<form action="pay.do" method="post" name="payform" id="payform">
<sec:csrfInput/>
<div class="setDiv">
	<div class="mask"></div>
	<div class="window" style="width: 315px; height: 350px; border-radius: 10px">
		<a href="#" class="close"><font style="font-size: 12px">X</font>&nbsp;</a>
		<div style="text-align: center; margin-top:10px; margin-bottom: 10px">
			<h2><strong>결제</strong></h2>
			<hr>
		</div>
		<div style="width: 315px;height: 150px">
			<button type="button" id="cheon" class="btn btn-secondary" style="margin-left: 15px; cursor: pointer; font-size: 13px">1천</button>
			<button type="button" id="ocheon" class="btn btn-secondary" style="cursor: pointer; font-size: 13px">5천</button>
			<button type="button" id="manwon" class="btn btn-secondary" style="cursor: pointer; font-size: 13px">1만원</button>
			<button type="button" id="omanwon" class="btn btn-secondary" style="cursor: pointer; font-size: 13px">5만원</button>
			<button type="button" id="sibmanwon" class="btn btn-secondary" style="cursor: pointer; font-size: 13px">10만원</button>
			
			<div class="row" style="margin-top: 20px; margin-left: 25px">
				기부 금액
			</div>
			
			<div class="row">
				<input type="text" name="pay" class="form-control" id="pay" style="margin-top:0px; margin-left: 35px; margin-right: 35px">
			</div>
			
			<div class="row" style="margin-top: 20px; margin-left: 25px">
				응원메세지를 입력해주세요!
			</div>
			
			<div class="row">
				<textarea name="content" class="form-control" id="replyContent" style="margin-top:0px; margin-left: 35px; margin-right: 35px"></textarea>
			</div>
			
			<div class="row">
				<button type="button" id="accountPay" class="btn btn-danger" style="margin-top: 20px; margin-left: 35px; margin-right: 35px;cursor: pointer; width: 100%">결제하기</button>
			</div>
		</div>
	</div>
	<input type="hidden" value="${donation.boardNo}" name="boardNo">
</div>


</form>