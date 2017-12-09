
/**
 * 지도 api script
 */
var address = $("input[name=place]").val();

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.1777531,127.1150254), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
    position: new daum.maps.LatLng(37.537187, 127.005476),
    map: map
});


//주소-좌표 변환 객체를 생성합니다
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


function sample5_execDaumPostcode() {
	//alert("여기가 안되나?");
    new daum.Postcode({
        oncomplete: function(data) {
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = data.address; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 기본 주소가 도로명 타입일때 조합한다.
            if(data.addressType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample5_address").value = fullAddr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                }
            });
        }
    }).open();
}
	
//================================================================
	
	
//================================================================
/**
 * 이미지 업로드 버튼 script
 */	
function img(){
	uploadForm.uploadFile.click();
}

function submit(){
	document.getElementById("uploadImg").target = "watchImg";
}
	

	
/**
 * 이미지 미리보기
 */
   $(function() {
       $("#uploadImg").on('change', function(){
           readURL(this);
       });
   });

   function readURL(input) {
       if (input.files && input.files[0]) {
       var reader = new FileReader();

        reader.readAsDataURL(input.files[0]);
       }
   }

	
/**
 * 이미지 업로드
 */
  $(function() {
      $("#imgInp").on('change', function(){
          readURL(this);
      });
  });

  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
              $('#blah').attr('src', e.target.result);
          }

        reader.readAsDataURL(input.files[0]);
      }
  }
   	
  
  /**
   * 협의 체크 시 주소 텍스트 비활성화
   */

  function checkBox(frm){
	  if( frm.addressNone.checked == true ){
		   frm.place.disabled = true;
		   frm.addressBtn.disabled = true;
		   frm.detailPlace.disabled = true;
		   frm.place.value = "추후 협의";
		} else{ 
		   frm.place.disabled = false;
		   frm.addressBtn.disabled = false;
		   frm.detailPlace.disabled = false;
		   frm.place.value = "";
		}
  }
  
  
  /**
   * 현재 이전 날짜 비활성화
   */
  
  $(function() {
	  //접수 시작을 누르면 접수종료일을 접수시작 이후의 날짜로.
	  $('#gatheringStart').change( function() {
  			$('#gatheringEnd').attr('min', $('#gatheringStart').val());
      });
	  
	  //접수 종료를 누르면 미팅당일시간의 최소시간을 접수종료일 이후로.
      $('#gatheringEnd').change( function() {
    	  $('#meetingStart').attr('min', $('#gatheringEnd').val());
      });
      
      //미팅당일 시작시간을 누르면 미팅종료시간을 미팅당일 시작일 이후로.
      $('#meetingStart').change( function() {
    	  $('#meetingEnd').attr('min', $('#meetingStart').val());
      });
  });

      
  /**
   * 취소 버튼 클릭시 발생하는 이벤트 
   */
     function cancelAll(){
    	 document.getElementById("frame").reset();
     }
     
     
   /**
    * 등록 확인 시 이벤트 (유효성 검사 포함)
    */
     function checkForm(){
    	 var mFrm = document.meetingFrm;
    	 
        oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
        var ir1 = $("#ir1").val();
    	 
    	 if(mFrm.uploadFile.value==""){
    		 alert("이미지를 올려주세요");
    		 return false;
    	 }else if(mFrm.title.value==""){
    		 alert("모임명을 입력하세요");
    		 mFrm.title.focus();
    		 return false;
    	 }else if(mFrm.meetingStart.value=="" && mFrm.meetingEnd.value==""){
    		 alert("모임 일시를 입력하세요");
    		 return false;
    	 }else if(mFrm.gatheringStart.value=="" && mFrm.gatheringEnd.value==""){
    		 alert("접수 기간을 입력하세요");
    		 return false;
    	 }else if(mFrm.peopleCount.value==""){
    		 alert("모임 인원을 입력하세요");
    		 mFrm.peopleCount.focus();
    		 return false;
    	 }else if(mFrm.place.value==""){
    		 /*if(mFrm.place.disabled && mFrm.detailPlace.disabled){
    			 mFrm.place.value="";
    			 mFrm.detailPlace.value="";
    		 }*/
    			 alert("주소 검색 하세요");
    			 mFrm.place.focus();
    			 return false;
    		 
    	 }else if(mFrm.intro.value.length==0){
    		 alert("간단 소개 입력하세요");
    		 return false;
    	 }else if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>' || ir1 == '<p><br></p>')  {
             alert("내용을 입력하세요.");
             oEditors.getById["ir1"].exec("FOCUS"); //포커싱
             return false;
             
	     }else if(mFrm.tel.value==""){
	    	 alert("전화번호를 입력하세요");
	    	 return false;
	     }
    	 
 	}
         
         
//===============================================         
         
//===============================================
     
     
   /*//날짜 비교하는 스크립트
     function checkDate(){
    	 alert("바꼈나?");
	     var today = new Date();
	     var gatheringStart = $("#gatheringStart").val();
	     var gatheringEnd = $("#gatheringEnd").val();
	     if (today>gatheringEnd) {
	         alert("모집대기");
	         $("#categoryStateNo").val(25);
	     }else if(today>gatheringStart && today<gatheringEnd){
	         alert("모집중");
	         $("#categoryStateNo").val(26);
	     }else{
	    	 alert("모집마감");
	    	 $("#categoryStateNo").val(27);
	     }
	     
     }*/
     
