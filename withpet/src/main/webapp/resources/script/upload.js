/* function img(){
		uploadForm.uploadFile.click();
	}

	function submit(){
		document.getElementById("imgInp").target = "watchImg";
	} */

$(document).ready(function() {
	$("#imgInp").on('change', function() {
		readURL(this, "#blah");
	}); // on
	$("#imgInp1").on('change', function() {
		readURL(this, "#blah1");
	}); // on
	$("#imgInp2").on('change', function() {
		readURL(this, "#blah2");
	}); // on
	$("#imgInp3").on('change', function() {
		readURL(this, "#blah3");
	}); // on
}); // ready

function readURL(input, idName) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$(idName).attr('src', e.target.result);
		}

		reader.readAsDataURL(input.files[0]);
	}// if
} // readURL

function checkForm(msg){
	return(confirm(msg));
}
