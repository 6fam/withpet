<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="!hasRole('ROLE_MEMBER')">
   <script>
      alert("로그인하세요!");
      location.href="${pageContext.request.contextPath}/loginForm.do";
   </script>
</sec:authorize>

<div class="container" style="background-color: white;  border: solid 1px #adadad; margin-top: 10px;padding-bottom:60px;">  
   <div class="row page-header" style="margin-top: 20px">
      <div class="col-sm-1"></div>
      <div class="col-sm-10">
         <h1 id="navbars">
            <img src="resources/img/dog_info.png" style="width: 290px">
         </h1>
      </div>
      <div class="col-sm-1"></div>
   </div>
   
   <div class="row" style="margin-top: 20px;">
      <div class="col-sm-1"></div>
      <div class="col-sm-2">
               <p>
                  <strong><sec:authentication property="principal.nick"/>님</strong>
               </p>
      </div>
   </div>
   
 <form action="${pageContext.request.contextPath }/updateDogInfo.do" method="post"
    id="dogSubmit" enctype="multipart/form-data" onsubmit="return checkForm('댕댕이 정보를 수정하시겠습니까?')">
 	 <sec:csrfInput/>
   <div class="row" style="margin-top: 10px;">
      <div class="col-sm-1"></div>
         <!-- 섬네일시작 -->
         <div class="col-sm-2">
         		<!-- 이미지 미리보기 -->
               	<div style="border:solid 1px #cecece;width:180px; height: 200px; margin: 0px; padding: 0px">
               		<img id="blah" src="" alt="댕댕이 사진 등록" style="width: 180px; height:200px;"/>
               	</div>
               	<!--  이미지 업로드 -->
   				<input type="file" id="imgInp" name="uploadFile" required="required">
         </div>
         <!-- 섬네일끝 -->
         
         
         
         <!-- 반려견 인증 시작 -->
         <div class="col-sm-7"  style="margin-left:50px">
         <table class="table table-bordered">
             <tbody>   
               	<tr>
                    <td  style="text-align:center;font-weight:bold">댕댕이 이름</td>
                    <td><input type="text" name="name" value="${ddto.name}" class="form-control" id="exampleInputText" required="required"></td>
                  </tr>
                  <tr>
                    <td  style="text-align:center;font-weight:bold">출생년도</td>
                     <td><input type="date" name="bdate" class="form-control" id="inputDefault" required="required"></td>
                  </tr>
                  <tr>
                    <td  style="text-align:center;font-weight:bold">성별</td>
                     <td>
                       <div class="row" style="margin-left: 0px;text-align:left">
                        <div class="col-sm-2" style="margin-left:5px;margin-top: 5px;">
                           <input style="height: 10px;" name="gender" type="radio" value="female" class="form-check-input" checked="checked">암컷
                        </div>
                        <div class="col-sm-2" style="margin-left: 40px; margin-top: 5px;">
                           <input style="height: 10px;" name="gender" type="radio" value="male" class="form-check-input">수컷
                        </div>
                        <div class="col-sm-2" style="margin-left: 40px; margin-top: 5px;">
                           <input style="height: 10px;" name="neutralization" value="neutralization" type="checkbox" class="form-check-input">중성화 수술 여부
                        </div>
                     </div>
                    </td>
                  </tr>
                  <tr>
                    <td  style="text-align:center;font-weight:bold">댕댕이 정보</td>
                     <td>
                     <textarea class="form-control" id="exampleTextarea" rows="3" name="intro" required="required"
                     style="margin-top: 0px; margin-bottom: 0px; height: 94px;" ></textarea>
                     </td>
                  </tr>
             </tbody>
           </table>
         </div>
     
      <!-- 반려견 인증 끝 -->
      <!-- 버튼 시작 -->
   </div>
   <div class="row" style="margin-top: 30px;">
      <div class="col-sm-5"></div>
      <div class="col-sm-4">
	         <button type="submit" class="btn btn-outline-danger" id="dogSubmitBtn" 
	            style="width: 100px; height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">수정</button>
	         <a href="${pageContext.request.contextPath }/mypage.do">
		         <button type="button" class="btn btn-outline-danger"
		            style="width: 100px; height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">취소</button>
	           </a>
	  </div> 
      <div class="col-sm-4"></div>
   </div>
         </form>         
   <!-- 버튼 끝 -->
 </div>