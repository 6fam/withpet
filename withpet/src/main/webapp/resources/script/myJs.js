var chkJoinIdValue = false;
var chkJoinPwValue = false;
var chkJoinPwConfirmValue = false;
var chkJoinNickValue = false;


$(document).ready(function (){
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
	
	$(".community").mouseover(function(){
		$(".communityBox").show();
	});
	
	$(".communityBox").mouseover(function(){
		$(".communityBox").show();
	});
	
	$(".communityBox").mouseout(function(){
		$(".communityBox").hide();
	});
});



/**
 * 회원가입 중복체크
 */
function dupleId(){
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	var id = $('.form-group #id').val();
	
	if(0 == id.length){
		$('#dupleMessage').text('아이디를 입력 해주세요.');
		$('#dupleMessage').css("color","#c1bfbf");
		chkJoinValue = false;
	} else if(id.length<4 || id.length>30){
		$('#dupleMessage').text('4글자이상 30글자미만으로 입력해주세요.');
		$('#dupleMessage').css("color","#ff6b6b");
		chkJoinIdValue = false;
	} else if(!id.match(regExp)){
		$('#dupleMessage').text('이메일 형식에 맞지않은 아이디입니다.');
		$('#dupleMessage').css("color","#ff6b6b");
		chkJoinIdValue = false;
	} else{
		$.ajax({
			type:"GET",
			url:"findMemberByIdAjax.do",				
			data:"id="+id,
			success:function(data){	
				if(data!="fail"){
					$('#dupleMessage').text('사용 가능한 아이디입니다.');
					$('#dupleMessage').css("color","#1cbeff");
					chkJoinIdValue = true;
				}else{
					$('#dupleMessage').text('중복 된 아이디입니다.');
					$('#dupleMessage').css("color","#ff6b6b");
					chkJoinIdValue = false;
				}
			}
		});
	}
}

/**
 * 회원가입 닉네임 중복체크
 */
function dupleNick(){
	var nick = $('.form-group #nick').val();
	
	if(0 == nick.length){
		$('#dupleNickMessage').text('닉네임을 입력 해주세요.');
		$('#dupleNickMessage').css("color","#c1bfbf");
		chkJoinValue = false;
	} else if(id.length<4 || id.length>30){
		$('#dupleNickMessage').text('4글자이상 30글자미만으로 입력해주세요.');
		$('#dupleNickMessage').css("color","#ff6b6b");
		chkJoinIdValue = false;
	} else{
		$.ajax({
			type:"GET",
			url:"findMemberByNickAjax.do",				
			data:"nick="+nick,
			success:function(data){	
				if(data!="fail"){
					$('#dupleNickMessage').text('사용 가능한 닉네임입니다.');
					$('#dupleNickMessage').css("color","#1cbeff");
					chkJoinIdValue = true;
				}else{
					$('#dupleNickMessage').text('중복된 닉네임입니다.');
					$('#dupleNickMessage').css("color","#ff6b6b");
					chkJoinIdValue = false;
				}
			}
		});
	}
}

/**
 * 비밀번호 유효성 검사
 */
function chkPassword(){
	var id = $('.form-group #id').val();
	var password = $('.form-group #pw').val();
	var checkNumber = password.search(/[0-9]/g);
	var checkEnglish = password.search(/[a-z]/ig);
	
	if(!/^[a-zA-Z0-9]{6,15}$/.test(password)){
		$('#checkPwMessage').text('숫자와 영문자 조합으로 6~15자리를 사용해야 합니다.');
		$('#checkPwMessage').css("color","#ff6b6b");
		chkJoinPwValue = false;
	} else if(checkNumber <0 || checkEnglish <0){
		$('#checkPwMessage').text('숫자와 영문자를 혼용하여야 합니다.');
		$('#checkPwMessage').css("color","#ff6b6b");
		chkJoinPwValue = false;
	} else if(/(\w)\1\1\1/.test(password)){
		$('#checkPwMessage').text('444같은 문자를 4번 이상 사용하실 수 없습니다.');
		$('#checkPwMessage').css("color","#ff6b6b");
		chkJoinPwValue = false;
	} else if(password.search(id) > -1){
		$('#checkPwMessage').text('비밀번호에 아이디가 포함되었습니다.');
		$('#checkPwMessage').css("color","#ff6b6b");
		chkJoinPwValue = false;
	} else {
		$('#checkPwMessage').text('사용 가능한 비밀번호 입니다.');
		$('#checkPwMessage').css("color","#1cbeff");
		chkJoinPwValue = true;
	}
}

/**
 * 비밀번호 확인 검사
 */
function chkConfirmPw(){
	var pw = $('.form-group #pw').val();
	var confirm_pw = $('.form-group #confirm_pw').val();
	if(pw == confirm_pw){
		$('#checkConfirmPwMessage').text('비밀번호가 일치 합니다.');
		$('#checkConfirmPwMessage').css("color","#1cbeff");
		chkJoinPwConfirmValue = true;
	}else{
		$('#checkConfirmPwMessage').text('비밀번호가 일치하지 않습니다.');
		$('#checkConfirmPwMessage').css("color","#ff6b6b");
		chkJoinPwConfirmValue = false;
	}
}

/**
 * 회원가입 닉네임 중복체크
 */
function dupleNick(){
	var nick = $('.form-group #nick').val();
	if(0 == nick.length){
		$('#dupleNickMessage').text('');
		chkJoinNickValue = false;
	} else if(2 < nick.length){
		$.ajax({
			type:"get",
			url: "DispatcherServlet",
			data:"command=dupleNickCheck&nick="+nick,
			success:function(data){//data로 서버의 응답 정보가 들어온다.
				if(data == "yes"){
					$('#dupleNickMessage').text('사용 가능한 닉네임입니다.');
					$('#dupleNickMessage').css("color","#1cbeff");
					chkJoinNickValue = true;
				}else{
					$('#dupleNickMessage').text('사용 불가능한 닉네임입니다.');
					$('#dupleNickMessage').css("color","#ff6b6b");
					chkJoinNickValue = false;
				}
			},
			timeout: 3000,
			error: function() {
				alert("timeout error");
			}
		});
	}else{
		$('#dupleNickMessage').text('3글자이상 8글자미만으로 입력해주세요.');
		$('#dupleNickMessage').css("color","#ff6b6b");
		chkJoinNickValue = false;
	}
}

function chkSubmit(){
	var id = $('.form-group #id').val();
	var pw = $('.form-group #pw').val();
	var confirm_pw = $('.form-group #confirm_pw').val();
	var nick = $('.form-group #nick').val();
	var age = $('.form-group #age').val();
	var q_answer = $('.form-group #pw_answer').val();
	
	if(chkJoinIdValue == false || id.length == 0) {
		alert("아이디를 정확히 입력해주세요.");
	}else if(chkJoinPwValue == false || pw.length == 0) {
		alert("비밀번호 정확히 입력해주세요.");
	}else if(chkJoinPwConfirmValue == false || confirm_pw.length == 0) {
		alert("비밀번호 확인을 정확히 입력해주세요.");
	}else if(chkJoinNickValue == false || nick.length == 0) {
		alert("닉네임을 정확히 입력해주세요.");
	}else if(age.length == 0) {
		alert("나이를 입력해주세요.");
	}else if(q_answer.length == 0) {
		alert("비밀번호 찾기 답변을 입력해주세요.");
	}else if( $("input[name=tend_code]:checkbox:checked").length == 0 ) {
		if(confirm("성향은 회원가입 후 마이페이지에서 수정가능합니다.\n회원가입을 진행합니다.")){
			document.JoinFrame.submit();
		}else{
			return false;
		}
	}else{
		if(confirm("회원가입을 진행합니다.")){
			document.JoinFrame.submit();
		}else{
			return false;
		}
	}
}


$(document).ready(function (){
	IMP.init('imp99239962');
	
	$("#accountPay").click(function (){
		var pay = $("#pay").val();
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : pay,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;

		    }
		    alert(msg);
		    $("#payform").submit();
		}); 
	});
	
	$("#cheon").click(function (){
		$("#pay").val("1000");
	});
	
	$("#ocheon").click(function (){
		$("#pay").val("5000");
	});
	
	$("#manwon").click(function (){
		$("#pay").val("10000");
	});
	
	$("#omanwon").click(function (){
		$("#pay").val("50000");
	});
	
	$("#sibmanwon").click(function (){
		$("#pay").val("100000");
	});
	
	 /**
     * 헤더 공통 ( 로그인 팝업 )
     */
    // 로그인버튼을 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
    $('#sidebox').click(function(e){
        // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
        e.preventDefault();
        // 팝업창을 띄웁니다.
        wrapWindowByMask();
    });

    // 닫기(close)를 눌렀을 때 작동합니다.
    $('.window .close').click(function (e) {
        e.preventDefault();
        $('.mask, .window').hide();
    });

    // 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
    $('.mask').click(function () {
        $(this).hide();
        $('.window').hide();
    });
    
    $(".registerPost").click(function() {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var donationOrg = $("#donationOrg").val();
		var accountHost = $("#accountHost").val();
		var bankName = $("#bankName").val();
		var accountNo = $("#accountNo").val();
		var title = $("#title").val();
		var ir1 = $("#ir1").val();
		var dreamMoney = $("#dreamMoney").val();
		
		if(donationOrg == null || donationOrg == ""){
			alert("모금 협회명을 입력하세요.");
			$("#donationOrg").focus();
			return false;
		}else if(accountHost == null || accountHost == "" ){
			alert("모금받을 계좌주를 입력하세요.");
			$("#accountHost").focus();
			return false;
		}else if(bankName == null || bankName == "" || bankName == "은행선택" ){
			alert("모금받을 계좌은행을 입력하세요.");
			$("#bankName").focus();
			return false;
		}else if(accountNo == null || accountNo == "" ){
			alert("모금받을 계좌번호를 입력하세요.");
			$("#accountNo").focus();
			return false;
		}else if(title == null || title == "" ){
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}else if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>' || ir1 == '<p><br></p>')  {
			alert("내용을 입력하세요.");
			oEditors.getById["ir1"].exec("FOCUS"); //포커싱
			return false;
		}else if(dreamMoney == null || dreamMoney == "" ){
			alert("모금 희망액을 입력 해주세요.");
			$("#dreamMoney").focus();
			return false;
		}else if(document.frame.uploadFileList[0].value==""){
	        alert("1번 이미지를 올려주세요");
	        return false;
	    }else if(document.frame.uploadFileList[1].value==""){
	        alert("2번 이미지를 올려주세요");
	        return false;
	    }else if(document.frame.uploadFileList[2].value==""){
	        alert("3번 이미지를 올려주세요");
	        return false;
	    }else{
	    	$("#frame").submit();
	    }
	});
    
    $(".registerCommunityPost").click(function() {
    	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); 
    	//alert("작성 버튼 눌렸어! myJs.js 286번째줄 확인해!");
    	$("#frame").submit();
    });
});


/**
 * 헤더 로그인 팝업 펑션
 */
function wrapWindowByMask(){
    // 화면의 높이와 너비를 변수로 만듭니다.
    var maskHeight = $(document).height();
    var maskWidth = $(window).width();

    // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
    $('.mask').css({'width':maskWidth,'height':maskHeight});

    // fade 애니메이션 : 80%의 불투명으로 변합니다.
    $('.mask').fadeTo("slow",0.8);

    // 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
    var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
    var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );

    // css 스타일을 변경합니다.
    $('.window').css({'left':left,'top':top, 'position':'absolute'});

    // 레이어 팝업을 띄웁니다.
    $('.window').fadeIn(1000);
}
