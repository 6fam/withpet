<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript">
/* Demo purposes only */
	$(".hover").mouseleave(
	  function () {
	    $(this).removeClass("hover");
	  }
	);
	
	$(document).ready(function() {
		 $(".row").on("click",".figure",function(){
			 var bNo=$(this).find("#bNo").val();
			 location="meetingDetail.do?boardNo="+bNo;
		});
		
		var pageNo = 1;
	   $(window).scroll(function() {
			if($(window).scrollTop() == $(document).height() - $(window).height()){
				var totalPage = $("#totalPage").val();
				//alert("총 페이지: "+totalPage);
				$.ajax({
					type:"GET",
					url:"ajaxCategory.do",
					data:"pageNo="+(++pageNo),
					dataType:"json",
					success:function(data){
						//alert("성공");
						var meetingList = "";
						for(var i=0; i<data.length; i++){
						    meetingList +=	"<div class='col-sm-3' style='padding:0;margin-left:45px ;margin-right:40px; height: 300px; border: solid 1px #adadad; margin-bottom: 20px'>";
							meetingList +=	"<div class='row' style='margin-left:0px'>";
							meetingList +=	"<figure class='snip1445' style='margin-top: 7px; margin-right: 7px; padding-right: 0px; width: 268px'>";
							meetingList +=	"<img src='"+data[i].imgPath+"' alt='Not Found Default Image!' style='margin-left:0px ;width:268px; height: 175px; margin-right: 0px'/>";
							meetingList +=	"<figcaption class='figure' style='cursor: pointer'>";
							meetingList +=	"<div><input type='hidden' id='bNo' value='"+data[i].boardNo+"'>";
							meetingList +=	"<font size='3px'>♥"+"12"+"</font>";
							meetingList +=	"<h4>친목</h4>";
							meetingList +=	"</figcaption></figure></div>";
							meetingList +=	"<div class='row' style='margin-left:0px'>";
							meetingList +=	"<span class='badge badge-danger' style='padding: 7px; margin-left: 10px'>"+"찜하기"+"</span>";
							meetingList +=	"<span class='badge badge-dark' style='padding: 7px; margin-left: 4px'>"+data[i].title+"</span><br>";
							meetingList +=	"<font style='font-size: 12px; margin-left: 10px; margin-top: 10px'>";
							meetingList +=	"모집기간 : "+ data[i].date.gatheringStart + "~" + data[i].date.gatheringEnd + "<br>";
							meetingList +=	"모임시간 : "+ data[i].date.meetingStart +"~" + data[i].date.meetingEnd + "<br></font></div>";
							meetingList +=	"<div class='row' style='margin-left:0px'><font style='font-size: 12px; margin-left: 10px; margin-top: 0px'>";
							meetingList +=	"참여현황 : "+ data[i].attenderCount+"/"+data[i].peopleCount+"</font></div></div>";
						}
						
						var container = $("#meetingData .row").html();
						
						container += meetingList;
						$("#meetingData .row").html(container);
						
						if(pageNo == totalPage){
							$('#element').on('scroll touchmove mousewheel', function(event) {
								event.preventDefault();
								return false;
							});
						}
					} 
				});//ajax
			}
	   }); 
	});
</script>

<div class="tagline-upper text-center text-heading text-shadow d-none d-lg-block"
	style="color:white ; background-image:url('resources/img/checkpettern.jpg');padding-top: 0px; border-bottom: solid 1px #cecece; height: 75px; margin-top:-20px; padding-top: 25px">
	<div class="row">
		<div style="margin-top:5px;" class="col-sm-1"></div>
		<div class="col-sm-11" style="text-align:left">
		 	<a href="meeting.do?categoryNo=20" style="color: white;font-size: 14px ">친목</a>
			<font style="font-size: 12px">|</font>
			<a href="meeting.do?categoryNo=21" style="color: white;font-size: 14px">산책</a>
			<font style="font-size: 12px">|</font>
			<a href="meeting.do?categoryNo=22" style="color: white;font-size: 14px">훈련</a>
			<font style="font-size: 12px">|</font>
			<a href="meeting.do?categoryNo=23" style="color: white;font-size: 14px">세미나</a>
		</div>
	</div>
</div>

<div class="container" style="background-color: white;  border: solid 1px #adadad; margin-top: 10px">  
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-1"></div>
		<div class="col-sm-6">
			<h1 id="navbars">
				<img src="resources/img/meeting.png" style="width: 120px">
				<a href="meetingwrite.do" class="btn btn-outline-danger"
					style="width: 100px; height: 30px; font-size: 12px; margin-left: 10px; 
					margin-top: 14px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">
					글쓰기
				</a>
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>
	
	<hr>
	
	<c:set var="pb" value="${meetingList.pagingBean}"></c:set>
	<input type="hidden" id="totalPage" value="${pb.totalPage}"/>

	<div class="row" style="padding-top: 20px; padding-bottom: 20px;">
	<c:choose>
		<c:when test="${fn:length(meetingList.list)==0}">
			<br><div class="col-sm-12" style="text-align: center"><b>해당 카테고리에 개설된 모임이 없습니다.</b></div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${meetingList.list}" var="list" varStatus="cnt">
				<div class="col-sm-3" style="padding:0;margin-left:45px ;margin-right:40px; height: 300px; border: solid 1px #adadad; margin-bottom: 20px">
					<div class="row" style="margin-left:0px">
						<figure class="snip1445" style="margin-top: 7px; margin-left:7px;margin-right: 0px; padding-right: 0px; width: 268px;">
							<img src="${pageContext.request.contextPath}/resources/upload/${list.imgPath}" 
								alt="" style="margin-left:0px ;width:268px; height: 175px; margin-right: 0px"/>
							  <figcaption class="figure" style="cursor: pointer">
							    <div>
								    <input type="hidden" id="bNo" value="${list.boardNo}">
								    <font size="3px">♥ 12</font>
								    <h4>${list.meetingState}</h4>
							    </div>
							  </figcaption>
						</figure>
					</div>
					<div class="row" style="margin-left:0px">
						<span class="badge badge-danger" style="padding: 7px; margin-left: 10px">찜하기</span>
						<span class="badge badge-dark" style="padding: 7px; margin-left: 4px">${list.meetingType}</span>
						<font style="font-size: 15px; margin-left: 10px; margin-top: 10px;">
							 ${list.title}<br>
						</font>
						<font style="font-size: 12px; margin-left: 10px; margin-top: 10px">
							모집기간 : ${list.date.gatheringStart} ~ ${list.date.gatheringEnd} <br>
						</font>
						<font style="font-size: 12px; margin-left: 10px; margin-top: 0px">
							모임시간 : ${list.date.meetingStart} ~ ${list.date.meetingEnd} <br>
						</font>
					</div>
					<div class="row" style="margin-left:0px">
						<font style="font-size: 12px; margin-left: 10px; margin-top: 0px">
							참여현황 : ${list.attenderCount}/${list.peopleCount}  공감수 : ${list.sympathyCount}
						</font>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
		<div id="meetingData"></div>
	</div>
</div>