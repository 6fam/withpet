<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="tagline-upper text-center text-heading text-shadow d-none d-lg-block"
	style="color:white ; background-image:url('resources/img/checkpettern.jpg');padding-top: 0px; border-bottom: solid 1px #cecece; height: 75px; margin-top:-20px; padding-top: 25px">
	<div class="row">
		<div style="margin-top:5px;" class="col-sm-1"></div>
		<div class="col-sm-11" style="text-align:left">
			<a href="community.do?categoryNo=31" style="font-size: 14px;color:white">��������</a>
			<font style="font-size: 12px">|</font>
			<a href="community.do?categoryNo=34" style="font-size: 14px;color:white">������</a>
			<font style="font-size: 12px">|</font>
			<a href="community.do?categoryNo=33" style="font-size: 14px;color:white">�ݷ�������</a>
			<font style="font-size: 12px">|</font>
			<a href="community.do?categoryNo=32" style="font-size: 14px;color:white">�����ı�</a>
		</div>
	</div>
</div>

<div class="container" style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<!-- <div class="row" style="padding-bottom: 20px; margin-top: 20px">
		<div class="col-sm-12">
			<a href="community.do?categoryNo=31" style="font-size: 13px">��������</a>
			<font style="font-size: 12px">|</font>
			<a href="community.do?categoryNo=34" style="font-size: 13px">������</a>
			<font style="font-size: 12px">|</font>
			<a href="community.do?categoryNo=33" style="font-size: 13px">�ݷ�������</a>
			<font style="font-size: 12px">|</font>
			<a href="community.do?categoryNo=32" style="font-size: 13px">�����ı�</a>
		</div>
	</div> -->
	
	<div class="row page-header">
		<div class="col-sm-12">
			<h1 id="navbars">
				<font style="font-size: 35px">��������</font>
				<a href="communityWriteView.do" class="btn btn-outline-danger"
					style="width: 100px; height: 25px; font-size: 12px; margin-left: 10px; margin-top: 14px; margin-bottom: 8px; padding-top: 6px; cursor: pointer">
				�۾���
				</a>
			</h1>
		</div>
	</div>

	<div class="row" style="padding-top: 20px; padding-bottom: 20px">
		<div class="col-sm-12">
			<table style="width: 100%">
			  <thead>
				<tr>
			      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">#</th>
			      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 12%">�з�</th>
			      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 55%">����</th>
			      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 13%">�ۼ���</th>
			      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">��ȸ��</th>
			      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">�ۼ�����</th>
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