<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function updateCommunityView(boardNo){
	
	location.href = "${pageContext.request.contextPath}/communityUpdateView.do?boardNo="+boardNo;
}
function deleteCommunity(boardNo,categoryNo){
	location.href = "${pageContext.request.contextPath}/communityDelete.do?boardNo="+boardNo+"&categoryNo="+categoryNo;
}
function communityList(categoryNo){
	location.href = "${pageContext.request.contextPath}/community.do?categoryNo="+categoryNo;
}
</script>
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-2"></div>
		<div class="col-sm-10">
			<h1 id="navbars">
				<font style="font-size: 35px">상세내용</font>
			</h1>
		</div>
	</div>
	
	<div class="row" style="padding-bottom: 20px;margin-top: 20px">
		<div class="col-sm-2"></div>
		<div class="col-sm-8" style="border-bottom: solid 1px #cecece; padding-bottom: 20px">
			<font style="font-size: 32px">${cdinfo.title}</font>
		</div>
		<div class="col-sm-2"></div>
	</div>
	
	<div class="row" style="padding-bottom: 120px">
		<div class="col-sm-2"></div>
		<!-- 글내용 -->
		<div class="col-sm-8">
			${cdinfo.content}
		</div>
		<div class="col-sm-2"></div>
	</div>
		<!-- 글 수정 및 삭제 폼-->
	<div class="row" style="padding-top: 20px; padding-bottom: 20px">
		<div class="col-sm-12" style="text-align: center">
			<sec:authentication property="principal.id" var="sessionId" />
			<c:if test="${sessionId==cdinfo.id}">
				<button type="button" class="btn btn-info"
					onclick="updateCommunityView(${cdinfo.boardNo})"
					style="width: 100px; height: 40px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">수정</button>
				<button type="button" class="btn btn-danger"
					onclick="deleteCommunity(${cdinfo.boardNo},${cdinfo.categoryNo})"
					style="width: 100px; height: 40px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">삭제</button>
			</c:if>
			<button type="button" class="btn btn-info"
				onclick="communityList(${cdinfo.categoryNo})"
				style="width: 100px; height: 40px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">목록으로</button>

		</div>

	</div>
</div>
