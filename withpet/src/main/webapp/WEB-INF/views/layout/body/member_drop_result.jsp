<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript">
	$(document).ready(function(){
		alert("탈퇴처리가 되었습니다.");
		$("#logoutForm").submit();
	});
</script>

<form id="logoutForm" action="${pageContext.request.contextPath }/logout.do"
	method="post" style="display:none">
	<sec:csrfInput/>
</form>