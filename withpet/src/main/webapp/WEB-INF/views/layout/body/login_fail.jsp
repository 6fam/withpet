<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert("${SPRING_SECURITY_LAST_EXCEPTION.message}!");
location.href="${pageContext.request.contextPath}/home.do";
</script>