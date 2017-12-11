<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		$("#checkPwAnswer").click(function(){
			var id=$("#id").val();
			var categoryNo=$("select[name=categoryNo]").val();
			var pwAnswer=$("#pwAnswer").val();
			$.ajax({
				type: "GET",
				url: "checkIdPwAnswer.do",
				data: $("#checkpw").serialize(),
				success:function(data){
					if(data == "ok"){
						alert("새롭게 사용할 비밀번호를 입력해주세요.");
						location.href="f_changePw.do?id="+id;
					}else{
						alert("비밀번호 찾기에 대한 정보를 잘못 입력하셨습니다.");
						/* $("#checkpw").reset();				 */
						document.getElementById("checkpw").reset();
					}
				}
			}); ajax
		}); // click
	});
</script>
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>		
		<div class="col-sm-10">
			<!-- 도화지 입니다. -->
			<div style="background-color: white; margin-top: 10px; margin-bottom: 40px; border: 1px solid #d1d1d1; height: 650px">
				<div class="row page-header" style="margin-top: 150px;margin-bottom: 30px">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<h1 id="navbars" style="text-align: center">
							<img src="resources/img/findpw.png" style="width: 320px">
						</h1>
					</div>
					<div class="col-sm-3"></div>
				</div>
				
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<form action="${pageContext.request.contextPath }/checkIdPwAnswer.do" id="checkpw">
							<input type="text" class="form-control" name="id" id="id" aria-describedby="emailHelp" placeholder="Enter ID" style="margin-bottom: 5px">
								<div class="form-group" style="clear: both">
								    <select class="form-control" id="exampleSelect1" name="categoryNo">
										<c:forEach items="${requestScope.pwQuestion }" var="list">
									    	<option value="${list.CATEGORY_NO}">${list.CATEGORY_NAME}</option>
										</c:forEach>
									</select>
								</div>
								<input type="text" name="pwAnswer" id="pwAnswer" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Answer" style="margin-bottom: 5px">
								<Button class="btn btn-outline-info" type="button" id="checkPwAnswer"
									style="height: 40px; width:220px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px;cursor: pointer">
									확인
								</Button>
								<a href="${pageContext.request.contextPath }/home.do" class="btn btn-outline-danger"
									style="height: 40px; width:219px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 13px;cursor: pointer">
									취소
								</a>
					</form>
					</div>
					<div class="col-sm-3"></div>
				</div>
				
			</div>
		</div>
		<div class="col-sm-1"></div>		
	</div> 
</div>