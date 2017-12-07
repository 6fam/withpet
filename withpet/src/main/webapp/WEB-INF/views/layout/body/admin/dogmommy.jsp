<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="!hasRole('ROLE_MANAGER')">
	<script type="text/javascript">
		alert("�α��� �ϼ���!");
		location.href = "${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
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
				<li class="nav-item"><a class="nav-link" href="allmember.do">��ü ȸ��</a></li>
				<li class="nav-item"><a class="nav-link" href="normalmember.do">ȸ��</a></li>
				<li class="nav-item"><a class="nav-link" href="yebimommy.do">���� ���δ�</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">����� ���δ�</a></li>
				<li class="nav-item"><a class="nav-link" href="exceptmember.do">Ż�� ȸ��</a></li>
				<li class="nav-item"><a class="nav-link" href="manager.do">������</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
							<!-- ��üȸ������ -->
							<!-- ��üȸ������ -->
							<form action="${pageContext.request.contextPath}/managerdogmomdelete.do" method="post">
							<sec:csrfInput/>
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 4%">��ȣ</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">�̸���</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">�г���</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">������̸�</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">����</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 9%">�߼�ȭ����</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">����̻���</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">����̵������</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">���ֽ�������</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">����</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<!-- for -->
							  	<c:forEach items="${dogmomlist.list}" var="dml">
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.id}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.nick}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.name}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.gender}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.neutralization}</td>
							     <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.bdate}</td>
							     <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.dogDTO.regDate}</td>
							     <td style="padding: .45rem; text-align: center; font-size: 12px">${dml.permitdate}</td>
							     <td style="padding: .45rem; text-align: center; font-size: 12px">
							     	<button class="btn btn-default" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer; background-color: white" 
							      		name="id" value="${dml.dogDTO.id}">
										����
									</button>
							     </td>
							    </tr>
							  	</c:forEach>
							    <!-- for �� -->
							    	</tbody>
								</table>
							</form>
							<!-- ��üȸ������ �� -->
						</div>
					</div>
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-4"></div>
						<div class="col-sm-6"></div>
						<div class="col-sm-5"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>