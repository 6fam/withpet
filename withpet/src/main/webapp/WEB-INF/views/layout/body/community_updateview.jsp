<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<script>
		alert("�α��� �ϼ���!");
		location.href="${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-2"></div>
		<div class="col-sm-10">
			<h1 id="navbars">
				<font style="font-size: 35px">�� ����</font>
			</h1>
		</div>
	</div>
	
	<!-- form ����> -->
	<form action="communityUpdate.do" id="frame" method="post" enctype="multipart/form-data">
	<sec:csrfInput/>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-10">
			<div class="row" style="padding-top: 20px; padding-bottom: 20px">
				<div class="col-sm-2">
				<!-- ī�װ� -->
				<select name="categoryNo" class="form-control" id="exampleSelect1">
				<c:forEach items="${categoryType}" var="ct">
					<option value="${ct.categoryNo}">${ct.categoryName}</option>
				</c:forEach>
				</select>
				</div>
				<!-- ������ -->
				<div class="col-sm-8">
					 <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${cdinfo.title}">
				</div>
			</div>
		</div>
	</div>
	
	<div class="row" style="padding-bottom: 20px">
		<div class="col-sm-2"></div>
		<!-- �۳��� -->
		<div class="col-sm-10" style="text-align: center">
			<textarea name="content" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;">${cdinfo.content}</textarea>
		</div>
		<div class="col-sm-1"></div>
	</div>
	
	<div class="row" style="padding-top: 20px; padding-bottom: 20px">
		<div class="col-sm-12" style="text-align: center">
			<button type="button" class="btn btn-info registerCommunityPost"
					style="width: 100px; height: 40px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">���</button>
			<button type="button" class="btn btn-danger"
					style="width: 100px; height: 40px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">���</button>
		</div>
	</div>
 	<sec:authentication property="principal.id" var="sessionId"/>   
	<input type="hidden" name="id" value="${sessionId}"> 
	<input type="hidden" name="boardNo" value="${cdinfo.boardNo}"> 
	</form>
</div>