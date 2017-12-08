<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript">
	/* Demo purposes only */
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});

	$(document).ready(function() {
		$(".row").on("click", ".figure", function() {
			var bNo = $(this).find("#bNo").val();
			location = "meetingDetail.do?boardNo=" + bNo;
		});

		var pageNo = 1;
		$(window).scroll(function() {
			if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				var totalPage = $("#totalPage").val();
				//alert("총 페이지: "+totalPage);
				$.ajax({
					type : "GET",
					url : "ajaxHome.do",
					data : "pageNo="+ (++pageNo),
					dataType : "json",
					success : function(data) {
						var meetingList = "";
					for (var i = 0; i < data.length; i++) {
					meetingList += "<div class='col-sm-3' style='width: 100%; max-width: 100%; padding: 20px; margin: 15px; border: 1px solid #ddd; flex: 0 0 0'>";
					meetingList += "<div class='row' style='margin: 0px; padding: 0px;'>";
					meetingList += "<figure class='snip1445' style='margin: 0px; padding: 0px; width: 100%; min-width: 293px; height: 200px'>";
					meetingList += "<img src='"+data[i].imgPath+"' alt='' style='margin: 0px; padding: 0px; height: 200px; width: 100%;'/>";
					meetingList += "<figcaption class='figure' style='cursor: pointer'>";
					meetingList += "<div><input type='hidden' id='bNo' value='"+data[i].boardNo+"'>";
					meetingList += "<font size='3px'>♥ 12</font>";
					meetingList += "<h4>"+data[i].meetingState+"</h4></div></figcaption></figure></div>";
					meetingList += "<div class='row' style='margin: 20px 0 0 0; padding: 0px'>";
					meetingList += "<span class='badge badge-danger' style='margin: 0px; padding: 12px 10px 5px 10px;'>찜하기</span>";
					meetingList += "<span class='badge badge-dark' style='margin: 0px 0px 0px 10px; padding: 12px 10px 5px 10px'>";
					meetingList += data[i].title;
					meetingList += "</span><br><font style='font-size: 12px; margin: 20px 0 0 0; padding: 0px'>";
					meetingList += "모집기간 :"+data[i].gatheringStart+"~"+data[i].gatheringStart+"<br>";
					meetingList += "</font> <font style='font-size: 12px; margin: 5px 0 0 0; padding: 0px'>";
					meetingList += "모임시간 :"+data[i].meetingStart+"~"+data[i].meetingEnd+"<br></font></div>";
					meetingList += "<div class='row' style='margin: 5px 0 0 0; padding: 0px'>";
					meetingList += "<font style='font-size: 12px; margin: 0px; padding: 0px'>";
					meetingList += "참여현황 :"+ "0"+"/"+data[i].peopleCount+"</font></div></div>";
				}

				var container = $("#meetingData .row").html();

				container += meetingList;
				$("#meetingData .row").html(container);
					if (pageNo == totalPage) {
						$('#element').on('scroll touchmove mousewheel',
						function(event) {
							event.preventDefault();
							return false;
						});
					}
				}
			});//ajax
		}
	});
		
	$(".like").click(function() {
		var boardNo = $(this).parent().parent().find('.row .snip1445 #bNo').val();
		var id = $("#loginId").val();
		alert("로그인 된 아이디 : " + id);
		alert("공감선택 공감번호 : " + boardNo);
		
		var chageBtn = "";
		
		$.ajax({
			type:"post",
			url:"registerLike.do",				
			data:"id="+id+"&boardNo="+boardNo,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(
					"${_csrf.headerName}","${_csrf.token}");
			},
			error:function(request,status,error){
	              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	             
	        },
			success:function(data){
				alert("성공"+data);
				
				/*alert(register);
				if(register){
					changeBtn += "<span class='badge badge-info hate' style='margin: 0px; padding: 12px 10px 5px 10px; cursor: pointer'>찜하기</span>";
				}
				//$(this).parent().find("like").html(changeBtn);
				$(this).parent().html(changeBtn);
				//document.all("").innerHTML=chageBtn;
				location = register;*/
			}
		});
	});
});
</script>


<div class="row" style="text-align: center; border-bottom: solid 1px #adadad; height: 625px; background-color: #261817; margin-top: -20px; padding-right: 0px; margin-right: 0px">
	<div class="col-sm-12" style="padding-right: 0px; margin-right: 0px">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel" style="height: 100%">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>

			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<p
						style="text-align: left; position: absolute; left: 170px; top: 400px; color: white">
						<font
							style="font-family: 'NotoSans Light', '돋움'; font-size: 27px; font-weight: 200">
							<b>끊임없이 이동하는 우리 삶 속 함께하시개는 어떤 모습일까요?<br> 산책에 대한 댕댕이들의 모든
								이야기들을 담았습니다.
						</b>
						</font>
					</p>
					<a href="#" class="btn btn-secondary"
						style="opacity: 0.8; background-color: #ffffff; color: black; position: absolute; left: 170px; top: 360px; height: 30px; font-size: 13px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">
						자세히 보기 &nbsp;></a> <img class="d-block img-fluid w-100"
						src="resources/img/3.jpg" alt="" style="height: 625px">
				</div>

				<div class="carousel-item">
					<p
						style="text-align: left; position: absolute; left: 170px; top: 100px; color: white">
						<font
							style="font-family: 'NotoSans Light', '돋움'; font-size: 27px; font-weight: 200">
							<b>끊임없이 이동하는 우리 삶 속 함께하시개는 어떤 모습일까요?<br> 산책에 대한 댕댕이들의 모든
								이야기들을 담았습니다.
						</b>
						</font>
					</p>
					<a href="#" class="btn btn-secondary"
						style="opacity: 0.8; background-color: #ffffff; color: black; position: absolute; left: 170px; top: 180px; height: 30px; font-size: 13px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">
						자세히 보기 &nbsp;></a> <img class="d-block img-fluid w-100"
						src="resources/img/2.jpg" alt="" style="height: 625px">
				</div>

				<div class="carousel-item">
					<p
						style="text-align: left; position: absolute; left: 170px; top: 100px; color: white">
						<font style="font-family: 'NotoSans Light', '돋움'; font-size: 27px; font-weight: 200">
							<b>끊임없이 이동하는 우리 삶 속 함께하시개는 어떤 모습일까요?<br> 산책에 대한 댕댕이들의 모든
								이야기들을 담았습니다.
						</b>
						</font>
					</p>
					<a href="#" class="btn btn-secondary"
						style="opacity: 0.8; background-color: #ffffff; color: black; position: absolute; left: 170px; top: 180px; height: 30px; font-size: 13px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">
						자세히 보기 &nbsp;></a> <img class="d-block img-fluid w-100"
						src="resources/img/1.jpg" alt="" style="height: 625px">
				</div>
			</div>

			<!-- <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a> -->
		</div>
	</div>
</div>

<div class="container"
	style="margin-top: 10px; background-color: white; border: solid 1px #adadad" id="meetingData">
	<c:set var="pb" value="${meetingList.pagingBean}"></c:set>
	<input type="hidden" id="totalPage" value="${pb.totalPage}" />

	<div class="row" style="padding: 20px 20px;">
		<c:forEach items="${meetingList.list}" var="list" varStatus="cnt">
			<!-- 시작 -->
			<div class="col-sm-3" style="width: 100%; max-width: 100%; padding: 20px; margin: 15px; border: 1px solid #ddd; flex: 0 0 0">
				<div class="row" style="margin: 0px; padding: 0px;">
					<figure class="snip1445" style="margin: 0px; padding: 0px; width: 100%; min-width: 293px; height: 200px">
						<input type="hidden" id="bNo" value="${list.boardNo}">
						<img src="${pageContext.request.contextPath}/resources/upload/${list.imgPath}"
							alt="" style="margin: 0px; padding: 0px; height: 200px; width: 100%" />
						<figcaption class="figure" style="cursor: pointer;">
							<div>
								<font size="3px">♥ 12</font>
								<h4>${list.meetingState}</h4>
							</div>
						</figcaption>
					</figure>
				</div>
				<div class="row" style="margin: 20px 0 0 0; padding: 0px;">
				
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<sec:authentication property="principal.id" var="loginId"/>
						<input type="hidden" id="loginId" value="${loginId}"/>
						<span class="badge badge-danger like" style="margin: 0px; padding: 12px 10px 5px 10px; cursor: pointer">찜하기</span>
					</sec:authorize>
					<sec:authorize access="!hasRole('ROLE_MEMBER')">
						<span class="badge badge-danger notMemberLike" style="margin: 0px; padding: 12px 10px 5px 10px; cursor: pointer">찜하기</span>
					</sec:authorize>
					
					
					<span class="badge badge-dark" style="margin: 0px 0px 0px 10px; padding: 12px 10px 5px 10px;">${list.meetingType}</span><br>
					<font style="font-size: 15px; margin-left: 10px; margin-top: 10px;">
						 ${list.title}<br>
					</font>
					<font style="font-size: 12px; margin: 20px 0 0 0; padding: 0px;">
						모집기간 : ${list.date.gatheringStart} ~ ${list.date.gatheringEnd} <br>
					</font> <font style="font-size: 12px; margin: 5px 0 0 0; padding: 0px;">
						모임시간 : ${list.date.meetingStart} ~ ${list.date.meetingEnd} <br>
					</font>
				</div>
				<div class="row" style="margin: 5px 0 0 0; padding: 0px;">
					<font style="font-size: 12px; margin: 0px; padding: 0px;">
						참여현황 : ${list.attenderCount}/${list.peopleCount} 공감수 : ${list.sympathyCount} </font>
				</div>
			</div>
			<!-- 끝 -->


		</c:forEach>

		<div id="meetingData"></div>
	</div>
</div>



