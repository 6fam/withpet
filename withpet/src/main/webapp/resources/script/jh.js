/**
 * 
 */
/*
 * 마이페이지 - 비밀번호 수정
 */
function chkUpdatePWSubmit(){
	var pw = $('.form-group #pw').val();
	var confirm_pw = $('.form-group #confirm_pw').val();
	
	if(chkJoinPwValue == false || pw.length == 0) {
		alert("비밀번호 정확히 입력해주세요.");
	}else if(chkJoinPwConfirmValue == false || confirm_pw.length == 0) {
		alert("비밀번호 확인을 정확히 입력해주세요.");
	}else{
		if(confirm("비밀번호를 수정하시겠습니까?")){
			document.JoinFrame.submit();
		}else{
			return false;
		}
	}
	return false;
}
/*
 * 로그인 - 비밀번호 수정
 */
function chkChangePWSubmit(){
	var pw = $('.form-group #pw').val();
	var confirm_pw = $('.form-group #confirm_pw').val();
	
	if(chkJoinPwValue == false || pw.length == 0) {
		alert("비밀번호 정확히 입력해주세요.");
	}else if(chkJoinPwConfirmValue == false || confirm_pw.length == 0) {
		alert("비밀번호 확인을 정확히 입력해주세요.");
	}else{
			document.JoinFrame.submit();
			return true;
	}
	return false;
}

$(document).ready(function(){
	$(".findPW").click(function() {
		var id=$("#id").val();
		location.href="f_idbyquestion.do?id="+id;
	});
});


