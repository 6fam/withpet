<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert("모집 정원이 찼습니다");
	location.href="${pageContext.request.contextPath}/meetingDetail.do?boardNo="+${boardNo};
</script>
