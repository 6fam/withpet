<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert("이미 참여중인 모임입니다!");
location.href="${pageContext.request.contextPath}/meetingDetail.do?boardNo="+${boardNo};
</script>