<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<script>
		alert("�α��� �ϼ���!");
		location.href="${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
<script type="text/javascript">
function deleteCommunityType(cno){
	var c=confirm("ī�װ��� �ش��ϴ� �۵� �����˴ϴ�! \n������ �����Ͻðڽ��ϱ�?");
	if (c == true) {
		location.href="${pageContext.request.contextPath}/deleteCommunityType.do?categoryNo="+cno;
	} 
}
</script>
<div class="container" style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-12">
			<h1 id="navbars">
				<font style="font-size: 35px">�������� ���ð����Դϴ�.</font>
			</h1>
		</div>
	</div>
	
	<!-- ��ȸ���Խ��� ���� -->
	<div class="row"
		style="margin-left: 0px; margin-bottom: 60px; margin-right: 0px">
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link" href="allcommunity.do">��ü Ŀ�´�Ƽ ���</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">Ŀ�´�Ƽ ī�װ� ����</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
						
							<!-- ��üȸ������ -->
							<form action="${pageContext.request.contextPath}/addcommunitytype.do">
							<sec:csrfInput/>
								ī�װ� �� <input type="text" name="categoryName"> 
								<button class="btn btn-default" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer; background-color: white"
							      	type="submit">�߰�
								</button>
							</form>
							<br>
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">�۹�ȣ</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 13%">ī�װ���</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">����</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:forEach items="${categoryType}" var="ct">
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${ct.categoryNo}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${ct.categoryName}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">
	 								<button class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer; background-color: white"
							      	onclick="deleteCommunityType(${ct.categoryNo})">
										����
									</button>
							      </td>
							    </tr>
							  </c:forEach>
							  </tbody>
							</table>
						
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