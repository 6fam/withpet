<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-12">
			<h1 id="navbars">
				<font style="font-size: 35px">나눔마켓</font>
				<a href="communityWriteView.do" class="btn btn-outline-danger"
					style="width: 100px; height: 25px; font-size: 12px; margin-left: 10px; margin-top: 14px; margin-bottom: 8px; padding-top: 6px; cursor: pointer">
				글쓰기
				</a>
			</h1>
		</div>
	</div>

	<div class="row" style="padding-top: 20px; padding-bottom: 20px">
		<div class="col-sm-12">
			<table class="table table-hover table-border">
			  <thead class="thead-dark">
			    <tr>
			      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 5%">#</th>
			      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 12%">분류</th>
			      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 55%">제목</th>
			      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 13%">작성자</th>
			      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 5%">조회수</th>
			      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 10%">작성일자</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${cmulist}" var="cl">
			    <tr>
			      <td style="padding: .45rem">${cl.boardNo}</td>
			      <td style="padding: .45rem">${cl.categoryName}</td>
			      <td style="padding: .45rem"><a href="communityDetail.do?boardNo=${cl.boardNo}">${cl.title}</a></td>
			      <td style="padding: .45rem">${cl.id}</td>
			      <td style="padding: .45rem">${cl.hits}</td>
			      <td style="padding: .45rem">${cl.wdate}</td>
			    </tr>
			  </c:forEach>
			    
			    
			  </tbody>
			</table>
		</div>
	</div>
</div>