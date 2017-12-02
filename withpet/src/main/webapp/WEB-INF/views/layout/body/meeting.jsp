<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

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
				alert("총 페이지: "+totalPage);
				$.ajax({
					type:"GET",
					url:"ajaxCategory.do",
					data:"pageNo="+(++pageNo),
					dataType:"json",
					success:function(data){
						alert("성공");
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
							meetingList +=	"모집기간 : "+ "2017-11-10" + "~" + "2017-11-20" + "<br>";
							meetingList +=	"모임시간 : "+ "2017-12-3" +"<br></font></div>";
							meetingList +=	"<div class='row' style='margin-left:0px'><font style='font-size: 12px; margin-left: 10px; margin-top: 0px'>";
							meetingList +=	"참여현황 : "+ "0"+"/"+"20</font></div></div>";
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
		<div style="margin-top:15px;" class="col-sm-3"><input class="form-control mr-sm-2" type="text" placeholder="Search">
     </div>
      <div style="margin-top:15px;" class="col-sm-1"> <button style="margin-left:-13px" class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button></div>
		<div class="col-sm-1"></div>
	</div>
	<c:set var="pb" value="${meetingList.pagingBean}"></c:set>
	<input type="hidden" id="totalPage" value="${pb.totalPage}"/>

	<div class="row" style="padding-top: 20px; padding-bottom: 20px;">
		
		<c:forEach items="${meetingList.list}" var="list" varStatus="cnt">
			<div class="col-sm-3" style="padding:0;margin-left:45px ;margin-right:40px; height: 300px; border: solid 1px #adadad; margin-bottom: 20px">
				<div class="row" style="margin-left:0px">
					<figure class="snip1445" style="margin-top: 7px; margin-left:7px;margin-right: 0px; padding-right: 0px; width: 268px;">
						<img src="${pageContext.request.contextPath}/resources/upload/${list.imgPath}" alt="Not Found Default Image!" style="margin-left:0px ;width:268px; height: 175px; margin-right: 0px"/>
						  <figcaption class="figure" style="cursor: pointer">
						    <div>
							    <input type="hidden" id="bNo" value="${list.boardNo}">
							    <font size="3px">♥ 12</font>
							    <h4>친목</h4>
						    </div>
						  </figcaption>
					</figure>
				</div>
				<div class="row" style="margin-left:0px">
					<span class="badge badge-danger" style="padding: 7px; margin-left: 10px">찜하기</span>
					<span class="badge badge-dark" style="padding: 7px; margin-left: 4px">${list.title}</span><br>
					<font style="font-size: 12px; margin-left: 10px; margin-top: 10px">
						모집기간 : 2017-11-10 ~ 2017-11-20 <br>
					</font>
					<font style="font-size: 12px; margin-left: 10px; margin-top: 0px">
						모임시간 : 2017-12-3 <br>
					</font>
				</div>
				<div class="row" style="margin-left:0px">
					<font style="font-size: 12px; margin-left: 10px; margin-top: 0px">
						참여현황 : 0/20
					</font>
				</div>
			</div>
		</c:forEach>
		<div id="meetingData"></div>
	</div>
</div>