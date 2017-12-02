
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
		} else{ 
		   frm.place.disabled = false;
		   frm.addressBtn.disabled = false;
		   frm.detailPlace.disabled = false;
		}
  }
  
  
  /**
   * 현재 이전 날짜 비활성화
   */
  
  $(function() {
      
  

      //datepicker 한국어로 사용하기 위한 언어설정
      $.datepicker.setDefaults($.datepicker.regional['ko']); 
      
      // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
      // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

      //시작일.
      $('#meetingStart').datepicker({
          showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
          buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
          dateFormat: "yy-mm-dd",             // 날짜의 형식
          changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
          minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
          onClose: function( selectedDate ) {    
              // 시작일(fromDate) datepicker가 닫힐때
              // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
              $("#meetingEnd").datepicker( "option", "minDate", selectedDate );
          }                
      });

      //종료일
      $('#meetingEnd').datepicker({
          showOn: "both", 
          buttonImageOnly : true,
          dateFormat: "yy-mm-dd",
          changeMonth: true,
          //minDate: 0, // 오늘 이전 날짜 선택 불가
          onClose: function( selectedDate ) {
              // 종료일(toDate) datepicker가 닫힐때
              // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
              $("#meetingStart").datepicker( "option", "maxDate", selectedDate );
          }                
      });
      
      //시작일.
      $('#gatheringStart').datepicker({
    	  showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
    	  buttonImage: "images/calendar.gif", // 버튼 이미지
    	  buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
    	  buttonText: "날짜선택",
    	  dateFormat: "yy-mm-dd",             // 날짜의 형식
    	  changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
    	  minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
    	  onClose: function( selectedDate ) {    
    		  // 시작일(fromDate) datepicker가 닫힐때
    		  // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
    		  $("#gatheringEnd").datepicker( "option", "minDate", selectedDate );
    		  $("#meetingStart").datepicker( "option", "maxDate", selectedDate );
    	  }                
      });
      
      //종료일
      $('#gatheringEnd').datepicker({
    	  showOn: "both", 
    	  buttonImage: "images/calendar.gif", 
    	  buttonImageOnly : true,
    	  buttonText: "날짜선택",
    	  dateFormat: "yy-mm-dd",
    	  changeMonth: true,
    	  //minDate: 0, // 오늘 이전 날짜 선택 불가
    	  onClose: function( selectedDate ) {
    		  // 종료일(toDate) datepicker가 닫힐때
    		  // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
    		  $("#meetingStart").datepicker( "option", "maxDate", selectedDate );
    	  }                
      });
  });
      
  /**
   * 취소 버튼 클릭시 발생하는 이벤트 
   */
     function cancelAll(){
    	 document.getElementById("frame").reset();
     }
     
     
   /**
    * 등록 확인 시 이벤트 
    */
     function checkForm(){
 		return confirm("등록하시겠습니까?");
 	}
         
         
//===============================================         
         
//===============================================
     
