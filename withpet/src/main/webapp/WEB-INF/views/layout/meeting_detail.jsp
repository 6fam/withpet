<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<script>
		alert("로그인 하세요!");
		location.href = "${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
<script type="text/javascript">
	$(document).ready(function() {
		listReply();
		$("#submitReply").click(function() {
			var replytext = $("#replytext").val();
			var replyForm = $(".replyForm").serialize();
			alert(replytext);
			$.ajax({
				type : "post",
				url : "insertReply.do",
				data : replyForm,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(
						"${_csrf.headerName}","${_csrf.token}");
				},
				success : function(data) {
					/* alert("댓글이 등록되었습니다.");*/
					listReply();
				}
			});
		});
		
		/* 댓글 삭제 버튼 클릭 시 이벤트 */
		function deleteReply() {
			alert("들어오나");
		}


		/* 댓글 리스트 보여주는 함수 */
		function listReply() {
			var replyForm = $(".replyForm").serialize();
			$.ajax({
				type : "get",
				//contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
				url : "listJson.do",
				data : replyForm,
				success : function(result) {
				console.log(result);
				var output = "<table>";
				for ( var i in result) {
					output += "<tr>";
					output += "<td >id: " + result[i].id + "<br>";
					output += result[i].content + "</td>";
					output += "<td><button type='button' onclick='deleteReply()'>삭제</button></td>"
					output += "<tr>";
				}
				output += "</table>";
				$("#listReply").html(output);
				}
			});
		}
		
		$(function(){
			$("#btn_sky .contentLocate").click(function(){
				var posY = $("#contentLocate").position();
				$("html,body").stop().animate({'scrollTop':posY.top -90},700);
			});
			$("#btn_sky .mapLocate").click(function(){
				var posY = $("#mapLocate").position();
				$("html,body").stop().animate({'scrollTop':posY.top -90},700);
			});
			$("#btn_sky .replyLocate").click(function(){
				var posY = $("#replyLocate").position();
				$("html,body").stop().animate({'scrollTop':posY.top -90},700);
			});
			$("#btn_sky .guideLocate").click(function(){
				var posY = $("#guideLocate").position();
				$("html,body").stop().animate({'scrollTop':posY.top -90},700);
			});
		});

	});
</script>
<style>
	#btn_sky span{font-size: 12px;display:block; cursor:pointer; font-weight:bold; padding:7px; margin:5px 0; background:#666; color:#fff; text-decoration:none;}
	#btn_sky span:hover {background:#ff5555;}
</style>
<div id="btn_sky" style="position:fixed; right:0; top:20%">	 
	<span class="contentLocate">내용</span> 
	<span class="mapLocate">지도</span>
	<span class="replyLocate">덧글</span>
	<span class="guideLocate">안내사항</span>
</div>


<div class="container"
	style="background-color: white; border: solid 1px #adadad; padding-bottom: 60px; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px;">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<h1 id="navbars">
				<img src="resources/img/meeting.png" style="width: 190px">
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<div class="row" style="margin-top: 30px">
		<div class="col-sm-1"></div>
		<div class="col-sm-11"></div>
	</div>

	<div class="row" style="margin-left: 0px">
		<div class="col-sm-1"></div>
		<!-- 섬네일시작 -->
		<div class="col-sm-3">
			<!-- 이미지 미리보기 -->
			<div class="row" style="border: solid 1px #cecece; width: 270px; height: 300px; margin: 0px; padding: 0px">
				<img id="blah" src="${pageContext.request.contextPath}/resources/upload/${meetingDetailDTO.imgPath}" alt="모임 사진 등록" style="width: 100%; height: 100%;" />
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-sm-12" style="padding-right: 0px">
					<b>개설자 정보</b>
					<hr>
					<b>ID</b> k@naver.com <br>
					<b>전화번호</b> 010-9966-****<br>
					<b>---개설자 정보 실제 데이터 받아오기---</b>
				</div>
			</div>
		</div>
		<!-- 섬네일끝 -->
		<!-- 모임개설정보(상단) 시작 -->
		<div class="col-sm-7" style="margin-left: 20px">
			<div class="row">
				<div class="col-sm-12">
					<font style="font-size: 24px"><b>${meetingDetailDTO.title}</b></font>
				</div>
			</div>
			<div class="row" style="margin-top: 20px">
				<div class="col-sm-12">
					<font style="font-size: 13px">
						<b>모임기간</b>&nbsp;&nbsp;&nbsp;${meetingDetailDTO.date.meetingStart} ~ ${meetingDetailDTO.date.meetingEnd}
					</font>
				</div>
			</div>
			<div class="row" style="margin-top: 20px">
				<div class="col-sm-12">
					<font style="font-size: 13px">
						<b>모임장소 </b>&nbsp;&nbsp;&nbsp;${meetingDetailDTO.place}
					</font>
				</div>
			</div>
			<div class="row" style="margin-top: 20px">
				<div class="col-sm-12" style="border-bottom:  solid 1px #cecece;margin-bottom: 20px; padding-bottom: 20px">
					<font style="font-size: 13px">
						<b>신청인원</b>&nbsp;&nbsp;&nbsp;총 80명  | ${meetingDetailDTO.peopleCount}명 신청가능
					</font>
				
					
					<script type="text/javascript">
						function openPopup(bNo){
							var boardNo=bNo;
							open("${pageContext.request.contextPath}/meetingAttenderList.do?boardNo="+boardNo,"mypopup","width=400,height=500,top=150,left=200");
						}
					</script>
					<sec:authentication property="principal.id" var="ooo"/>
					<c:if test="${ooo==meetingDetailDTO.id}">
					
					<button type="button" class="btn btn-outline-danger"
						style="height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px;"
						value="" onclick="openPopup(${meetingDetailDTO.boardNo})" >신청자 명단보기</button>
					</c:if>
					</div>
			</div>
			<div class="row" style="margin-top: 10px">
				<div class="col-sm-12">
					<font style="font-size: 14px">
						${meetingDetailDTO.content}
					</font>
				</div>
			</div>
			<div class="row" style="margin-top: 55px; border: solid 1px #cecece; height: 150px">
				<div class="col-sm-12" style="margin-top: 15px; margin-left: 5px">
					<b>신청기간</b> <font style="font-size: 12px">&nbsp;&nbsp;${meetingDetailDTO.date.gatheringStart}~${meetingDetailDTO.date.gatheringEnd}</font>
					<hr style="margin-bottom:0px">
				</div>
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-8">
							<font style="font-size: 20px"><b>${meetingDetailDTO.title}</b></font><br>
							선착순 | 총 80명 | ${meetingDetailDTO.peopleCount}명 신청가능
						</div>
						<div class="col-sm-4">
							<form action="${pageContext.request.contextPath}/meetingAttend.do">
							<input type="hidden" name="boardNo" value="${meetingDetailDTO.boardNo}">
							<input class="btn btn-danger" type="submit" value="모임 참여" style="width: 100%; margin-top: 15px; cursor: pointer">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<hr>
	<br>

	<script type="text/javascript">
		function checked() {
			document.getElementById('exampleInputText').readOnly = true;
		}
	</script>

	<!-- 모임상세보기-내용 -->
	<div class="row" style="margin-top: 40px;">
		<div class="col-sm-1"></div>
		<div class="col-sm-2" style="margin-top: 5px;margin-left: 40px" id="contentLocate">
			<b>내용</b></div>
		<div class="col-sm-9" style="margin-top: 5px"></div>
	</div>
	<div class="row" style="margin-top:0px;">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" style="margin-top: 5px;margin-left: 40px">
			${meetingDetailDTO.content}
		</div>
		<div class="col-sm-1" style="margin-top: 5px"></div>
	</div>
	
	<!-- 모임상세보기-지도 -->
	<div class="row" style="margin-top: 80px">
		<div class="col-sm-1"></div>
		<div class="col-sm-2" style="margin-top: 5px;margin-left: 40px" id="mapLocate">
			<b>지도보기</b></div>
		<div class="col-sm-9" style="margin-top: 5px"></div>
	</div>
	<div class="row" style="margin-top: 0px;">
		<div class="col-sm-12" style="margin: 0px; padding-left: 150px; padding-right: 130px">
			<div class="map_wrap" style="border: 1px solid #ddd;">
				<div id="map" style="width: 100%; height: 100%;"></div>
			</div>
		</div>
	</div>
	<div class="row" style="margin-top: 0px; margin-bottom: 100px">
		<div class="col-sm-1"></div>
		<div class="col-sm-2" style="text-align: center; margin-top: 5px;">
			상세주소</div>
		<div class="col-sm-7" style="margin-top: 5px" id="address">
			${meetingDetailDTO.place}
		</div>
	</div>
	
	
	
	<!-- 모임상세보기-덧글 -->
	<div class="row" style="margin-top: 40px;  border-top: solid 1px #cecece; padding-top: 40px">
		<div class="col-sm-1"></div>
		<div class="col-sm-2" style="margin-top: 5px;margin-left:40px" id="replyLocate">
			<b>함께하시개 덧글 (0건)</b>
		</div>
		<div class="col-sm-9" style="margin-top: 5px"></div>
	</div>
	
	<form name="replyForm" class="replyForm" method="post">
		<div class="row" style="margin-top:0px;">
			<div class="col-sm-12" style="margin: 0px; padding-left: 150px; padding-right: 130px">
				<div class="row">
					<div class="col-sm-10">
						<input type="hidden" name="boardNo" value="${meetingDetailDTO.boardNo}">
						<input type="text" name="content" class="form-control" id="replytext" aria-describedby="emailHelp" placeholder="덧글을 입력해주세요.">
					</div>
					<div class="col-sm-2">
						<button type="button" id="submitReply">댓글 작성</button>
					</div>
				</div>
			</div>
		</div>
	</form>	
	
	<div class="row" style="margin-top:20px;">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" style="margin-top: 5px;margin-left: 40px">
			<table id="listReply">
			</table>
		</div>
		<div class="col-sm-1" style="margin-top: 5px"></div>
	</div>
	
	
	
	<div class="row" style="margin-top:100px;">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" style="margin-top: 5px;margin-left: 40px" id="guideLocate">
			<font style="font-size: 14px">
			<b>참여신청/취소 안내</b><br>
			* 모임의 신청/취소/변경/환불은 참여신청 기간 내에만 가능합니다.<br>
			* 결제한 유료모임은 환불 시 결제 수단과 환불 시점에 따라 수수료가 부과될 수 있습니다. 자세한 사항은 취소/환불약관을 확인해주세요.<br>
			* 결제, 환불, 참여신청 수정/취소, 참여상태 확인, 참여내역 확인은 마이페이지에서 할 수 있습니다.<br>
			* 모임 또는 그룹의 설정, 모집정원 초과 여부에 따라 대기자로 선정될 수 있습니다. 자세한 사항은 FAQ를 확인해주세요.<br>
			* 온오프믹스 결제서비스를 이용하는 모임은 개설자의 사업자 여부에 따라 결제증빙 발행이 가능합니다. 자세한 사항은 FAQ를 확인해 주세요.<br>
			* 개설자 선정방식 또는 개설자 통장입금 방식의 모임 참여/결제 확인은 개설자에게 문의 바랍니다.<br>
			* 온오프믹스는 참여신청 및 참가비 결제 기능을 제공하는 회사로 모임개설자(주최측)가 아닙니다. 모임 내용과 관련한 사항은 모임 개설자에게 문의 바랍니다.<br>
			</font>
		</div>
		<div class="col-sm-1" style="margin-top: 5px"></div>
	</div>
	
	
	
	<div class="row" style="margin-top:100px;">
		<div class="col-sm-12">
			<sec:authentication property="principal.id" var="ooo"/>
			<c:if test="${ooo==meetingDetailDTO.id}">
				<div class="row" style="margin-top: 40px; margin-bottom: 40px">
					<div class="col-sm-4"></div>
					<div class="col-sm-2">
						<a href="${pageContext.request.contextPath}/meeting_update.do" class="btn btn-outline-danger"
							style="width: 100px; height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">수정</a>
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-outline-danger" id="deleteBtn"
			            style="width: 100px; height: 30px; font-size: 11px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">삭제</button>
					</div>
					<div class="col-sm-2"></div>
				</div>
			</c:if>
		</div>
	</div>
	
	
</div>




<!-- 나중에 따로 빼기 -->

<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4492fe06798cb47618534aee3cc9d20&libraries=services"></script>
<script>
	$(document).ready(function() {
		//alert("뜨나?");
		var address = $("#address").html();
		//alert(address);
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder
			// ex) 서울특별시 강남구 역삼동 601-2
			.addressSearch(address, function(result, status) {

				// 정상적으로 검색이 완료됐으면 
				if (status === daum.maps.services.Status.OK) {

					var coords = new daum.maps.LatLng(result[0].y, result[0].x);

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new daum.maps.Marker({
						map : map,
						position : coords
					});

					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new daum.maps.InfoWindow({
						content : address
					});
					infowindow.open(map, marker);

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
			}); 
	
	
	
			$("#deleteBtn").click(function(){
				if(confirm("게시글을 삭제하시겠습니까?"))
					location.href="${pageContext.request.contextPath}/meeting_delete.do?boardNo=${meetingDetailDTO.boardNo}";		
			})
	});

	
</script>

<!--  -->




<%-- 

	<form action="meetingAttend.do" method="get">
		<input type="hidden" name="boardNo" value="${meetingDetailDTO.boardNo}">
		<input type="submit" class="btn btn-outline-danger"
			value="참여하기"
			style="height: 50px; font-size: 16px; margin-top: 8px; margin-bottom: 10px; padding-top: 8px;">
	</form>

	<sec:csrfInput/>
	
	<form name="replyForm" class="replyForm" method="post">
		<textarea rows="5" cols="80" id="replytext" name="content"></textarea>
		<input type="hidden" name="boardNo" value="${meetingDetailDTO.boardNo}">
        <br>
        <button type="button" id="submitReply">댓글 작성</button>
        
        <sec:authentication property="principal.id"  var="id" />
        <c:set property="member"  value="id" />
		 <c:if test="${member == dto.writer}"> 
			
		</c:if>
	</form>
        
  <div id="listReply"></div>
  
--%>