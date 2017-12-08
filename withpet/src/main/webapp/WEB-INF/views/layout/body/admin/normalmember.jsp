<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-12">
			<h1 id="navbars">
				<font style="font-size: 35px">������������</font>
			</h1>
		</div>
	</div>
	
	<!-- ��ȸ���Խ��� ���� -->
	<div class="row"
		style="margin-left: 0px; margin-bottom: 60px; margin-right: 0px">
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link" href="allmember.do?pageNo=1">��ü ȸ��</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">ȸ��</a></li>
				<li class="nav-item"><a class="nav-link" href="yebimommy.do?pageNo=1">���� ���δ�</a></li>
				<li class="nav-item"><a class="nav-link" href="dogmommy.do?pageNo=1">����� ���δ�</a></li>
				<li class="nav-item"><a class="nav-link" href="exceptmember.do?pageNo=1">Ż�� ȸ��</a></li>
				<li class="nav-item"><a class="nav-link" href="manager.do?pageNo=1">������</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
						
						
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 8%">��ȣ</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">�̸���</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">�г���</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 20%">��й�ȣ����</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 16%">��й�ȣ��</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 12%">��������</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 8%">��������</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 8%">��������</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 8%">��������</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<!-- for -->
							  	<c:forEach items="${normalMember.list}" var="nml">
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${nml.id}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${nml.nick}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${nml.categoryName}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${nml.pwAnswer}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${nml.regdate}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">
							      	<a href="#" class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer">
										��������
									</a>
							      </td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">
							      	<a href="${pageContext.request.contextPath}/adminmypageopened.do?id=${nml.id}" class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer">
										��������
									</a>
							      </td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">
							      	<a href="${pageContext.request.contextPath}/adminmypageparticipate.do?id=${nml.id}"  class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer">
										��������
									</a>
							      </td>
							    </tr>
							  	</c:forEach>
							  </tbody>
							</table>
						</div>
					</div>
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-4"></div>
						<div class="col-sm-6"></div>
						<div class="col-sm-5"></div>
					</div>
				</div>
			</div>
			<!-- ������ ����¡ ���� -->
			<div class="row" style="margin-left: 0px">
				<div class="col-sm-4"></div>
				<div class="col-sm-6">
					<div>
						<c:set value="${requestScope.normalMember.pagingBean}" var="pp" />
						<ul class="pagination">
							<c:if test="${pp.previousPageGroup }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/normalmember.do?pageNo=${pp.startPageOfPageGroup-1}">&laquo;</a></li>
							</c:if>
							<c:forEach var="i" begin="${pp.startPageOfPageGroup}"
								end="${pp.endPageOfPageGroup }">
								<c:choose>
									<c:when test="${pp.nowPage!=i }">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/normalmember.do?pageNo=${i}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="#">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pp.nextPageGroup}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/normalmember.do?pageNo=${pp.endPageOfPageGroup+1}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				<div class="col-sm-5"></div>
			</div>
			<!-- ������ ����¡ �� -->
		</div>
	</div>
</div>