<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="resources/css/chan.css" />
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<script>
		alert("로그인 하세요!");
		location.href = "${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
<script type="text/javascript">

	function fnMove(seq) {
		var offset = $("#div" + seq).offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	}

	$(document).ready(function(){
		
		//댓글 리스트 보기
		//listReply();
		//댓글 카운트 보기
		replyCount();
		
		//게시글 삭제
		$("#deleteBtn").click(function(){
			if(confirm("게시글을 삭제하시겠습니까?"))
				location.href="${pageContext.request.contextPath}/care_delete.do?boardNo=${careDetail.boardNo}";		
		});//click
	    
		//댓글 카운트 보기
		function replyCount(){
			alert("댓글카운트");
			var boardNo=${careDetail.boardNo};
			$.ajax({
				type:"get",
				url:"replyCount.do",
				data:"boardNo="+boardNo,
				success:function(data){
					alert(data);
					$(".rcount").text(data);
				}
			}); // ajax
		}
		
		//  댓글 리스트 보기 
		/* function listReply() {
			var boardNo=${careDetail.boardNo};
			$.ajax({
				type : "get",
				url : "listJson.do",
				data : "boardNo="+boardNo,
				success:function(result) {
					alert("댓글 리스트 가져오기 success ");
					var output = "<table>";
					for ( var i in result) {
						output += "<tr>";
						output += "<td >id: " + result[i].id + "<br>";
						output += result[i].content + "</td>";
						output += "<td><button type='button' class='replyDelete' value="+result[i].replyNo+">삭제</button></td>"
						output += "</tr>";
					}
					output += "</table>";
					$("#listReply").html(output);
				} //success
			}); //ajax
		} //listReply */
		
		// 댓글 작성
		$("#submitReply").click(function() {
			var replytext = $("#replytext").val();
			alert(replytext);
			
			$.ajax({
				type : "post",
				url : "insertReply.do",
				data : $(".replyForm").serialize(),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(
						"${_csrf.headerName}","${_csrf.token}");
				},
				success : function(data) {
					alert("댓글이 등록되었습니다.");
					document.getElementById("replyForm").reset();
					listReply();
					replyCount();
				}
			});
		}); // #submitReply click
		
		$(document).on('click', '.replyDelete', function(e){
			alert("1replyNo: "+$(this).attr('value')); //버튼 value 
			var replyNo=$(this).attr('value');
			alert("2: "+replyNo);
			if(confirm("댓글을 삭제하시겠습니까?")){
				$.ajax({
					type:"post",
					url:"deleteReply.do",
					data: "replyNo="+replyNo,
					beforeSend : function(xhr) {
						xhr.setRequestHeader(
							"${_csrf.headerName}","${_csrf.token}");
					},
					success: function(data){
						alert("댓삭");
						listReply();
						replyCount();
					} //success
				})// ajax
			}//if 
		}); // on click
		
		
	}); // ready
	
</script>
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-1"></div>
		<div class="col-sm-6">
			<h1 id="navbars">
				<img src="resources/img/care_detail.png" style="width: 230px;">
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<div class="row" style="margin-left: 0px; margin-top: 20px">
		<div class="col-sm-1"></div>
		<div class="col-sm-14">
			<p>
				<strong>나의 반려견 정보</strong>
			</p>
		</div>
	</div>
	<div class="row" style="margin-left: 0px">
		<div class="col-sm-1"></div>
		<!-- 섬네일시작 -->
		<div class="col-sm-3">
			<div style="border: solid 1px #cecece; width: 180px; height: 200px; margin: 0px; padding: 0px">
				<img alt="댕댕이 이미지" src="${pageContext.request.contextPath}/resources/upload/${ddto.imgPath}" width="180px" height="200px">
			</div>
		</div>
		<!-- 섬네일끝 -->
		<!-- 반려견 정보 시작 -->
		<div class="col-sm-7">
			<table class="table table-bordered">
				<tbody>
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<tr>
						<td style="text-align: center; font-weight: bold; width: 45%">댕댕이 이름</td>
						<td>${ddto.name}</td>
					</tr>
					<tr>
						<td style="text-align: center; font-weight: bold; width: 45%">성별</td>
						<td>${ddto.gender}</td>
					</tr>
					<tr>
						<td style="text-align: center; font-weight: bold; width: 45%">나이</td>
						<td>${ddto.bdate}</td>
					</tr>
					<tr>
						<td style="text-align: center; font-weight: bold; width: 45%">성격</td>
						<td>${ddto.intro}</td>
					</tr>
				</sec:authorize>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 반려견 정보 끝 -->
	<br>
	<hr>
	<br>
	<!-- 돌보미 상세정보 탭 시작 -->
	<div class="row" style="margin-left: 0px; margin-right: 0px">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a onclick="fnMove('1')"
					class="nav-link active">상세내용</a></li>
				<li class="nav-item"><a onclick="fnMove('2')" class="nav-link">
						지도보기</a></li>
				<li class="nav-item"><a onclick="fnMove('3')" class="nav-link">댓글보기</a></li>
				<li class="nav-item"><a onclick="fnMove('4')" class="nav-link">신청안내</a></li>
			</ul>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<!-- 돌보미 상세정보 탭 끝 -->
	<!-- 돌보미 탭 내용들 시작 -->
	<div class="row" style="margin: 0 auto;">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" style="margin: 30px">
		<sec:authorize access="hasRole('ROLE_MEMBER')">
			 <div id="div1">
				<div class="row" style="margin-left: 0px;">
					<div class="col-sm-2">제목</div>
					<div class="col-sm-10">${careDetail.title}</div>
				</div>
				<div class="row" style="margin-left: 0px; margin-top: 30px">
					<div class="col-sm-2">주의사항</div>
					<div class="col-sm-10">${careDetail.content}
					</div>
				</div>
				<div class="row" style="margin-left: 0px; margin-top: 30px">
					<div class="col-sm-2">모임일시</div>
					<div class="col-sm-4" style="text-align:center">${careDetail.date.meetingStart}</div>
					<div class="col-sm-1">~</div>
					<div class="col-sm-4" style="text-align:center">${careDetail.date.meetingEnd}</div>
				</div>
				<div class="row" style="margin-left: 0px; margin-top: 30px">
					<div class="col-sm-2">접수기간</div>
					<div class="col-sm-4" style="text-align:center">${careDetail.date.gatheringStart}</div>
					<div class="col-sm-1">~</div>
					<div class="col-sm-4" style="text-align:center">${careDetail.date.gatheringEnd}</div>
				</div>
				<div class="row" style="margin-left: 0px; margin-top: 30px">
					<div class="col-sm-2">주소</div>
					<div class="col-sm-10" id="address">${careDetail.place}</div>
				</div>
			</div>
			</sec:authorize>
			<div id="div2" style="width: 95%; margin-top: 40px">
				<div id="map" style="width: 100%; height: 350px;"></div>
			</div>
			<div id="div3" style="margin-top: 40px">
			
			
				<div class="row" style="margin-left: 0px;">
					<div class="col-sm-11">
						돌보미 댓글 (<span class="rcount"></span>건)
		            
    --------------------------------------------------------------------------------------------------------------------
		            <!--  돌보미 댓글 작성 -->
						<form name="replyForm" class="replyForm" method="post" id="replyForm">
			               <div class="row" style="margin-left: 0px;">
			                  <div class="col-sm-10">
			                     <input type="hidden" name="boardNo" value="${careDetail.boardNo}">
			                     <input type="text" name="content" class="form-control" id="replytext" aria-describedby="emailHelp" 
			                     style="width:680px; height:50px;" placeholder="댓글을 입력해주세요.">
			                  </div>
			                  <div class="col-sm-2" align="right">
			                     <button type="button" id="submitReply">댓글 작성</button>
			                  </div>
			               </div>
			            </form>
    ------------------------------------------------------------------------------
            	<!--  돌보미 댓글 리스트 -->
			            <div class="row" style="margin-top:20px;">
			               <div class="col-sm-1"></div>
			               <div class="col-sm-10" style="margin-top: 5px;margin-left: 40px">
			                  <table id="listReply">
			                  <c:forEach items="${careDetail.replyList }" var="reply">
			                  	<tr>
			                  		<td><b>${reply.id }</b><br>${reply.content }</td><td></td>
			                  	</tr>	
			                  </c:forEach>
			                  	<tr>
			                  	
			                  	</tr>
			                  </table>
			               </div>
			               <div class="col-sm-1" style="margin-top: 5px"></div>
			            </div>
					
			-------------------------------------------------------------------------------	
					</div>
				</div>
				
			</div>
			<div id="div4"
				style="border: 1px solid #ddd; margin-top: 40px; width: 95%; padding: 30px 20px 20px 20px; background: #ddd">
				<h6>
					<strong>신청안내</strong>
				</h6>
				<ul>
					<li><strong>돌보미 신청은 참여신청 기간 내에만 가능합니다.</strong></li>
					<li><strong>돌보미 신청은 댓글작성/연락 방법을 통하여 신청가능합니다. </strong></li>
					<li>돌보미 내용과 관련한 사항은 모임 개설자에게 문의 바랍니다.</li>
				</ul>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<!-- 돌보미 탭 내용들 끝 -->
	<!--로그인시 버튼 시작-->
		<sec:authentication property="principal.id" var="myid"/>
      		<c:if test="${myid eq careDetail.id}">
				<div class="row" style="margin-top: 40px; margin-bottom: 40px">
					<div class="col-sm-4"></div>
					<div class="col-sm-2">
						<a href="${pageContext.request.contextPath}/care_update.do?boardNo=${careDetail.boardNo}" class="btn btn-outline-danger"
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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4492fe06798cb47618534aee3cc9d20&libraries=services"></script>
		
	<script>
	
	$(document).ready(function() {
		//alert("뜨나?");
		var address = $("#address").html();
		alert(address);
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
			
	
		/* $(".btn").click(function name() {
			alert("지도검색");
			
			var address = $("#address").val();
			
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
		}) */
			
	});
		
	</script>

