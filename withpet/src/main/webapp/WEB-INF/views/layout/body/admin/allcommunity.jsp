<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="!hasRole('ROLE_MANAGER')">
	<script type="text/javascript">
		alert("�α��� �ϼ���!");
		location.href = "${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>   
<style>
.communityBoxul li {height:30px; display:inline-block; cursor:pointer; line-height:30px; padding:0 15px; text-align:center; box-sizing:border-box;}
.communityBox ul li:hover {background:#ff5500}
</style>    
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
				<li class="nav-item"><a class="nav-link active community" href="#">��ü Ŀ�´�Ƽ ���</a></li>
				<li class="nav-item"><a class="nav-link" href="communitycategory.do">Ŀ�´�Ƽ ī�װ� ����</a></li>
			</ul>
			<div class="communityBox" style="position: absolute; top:45px; z-index: 1000; background: #aaa;
    				color: #fff; height: 30px; display: none">
				<ul style="margin: 0px; padding: 0px; font-size: 12px; margin-top: 0px">
					<!-- for�� �����ø�˴ϴ�. -->
					<c:forEach items="${categoryType}" var="ct">
					<li style="height: 30px; display: inline-block; cursor: pointer; line-height: 30px; padding: 0 15px;
						    text-align: center; box-sizing: border-box;">
						<a href="activecommunity.do?categoryNo=${ct.categoryNo}&categoryName=${ct.categoryName}">${ct.categoryName}</a>
					</li>
					</c:forEach>
    				<!-- for �� -->
				</ul>
			</div>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
							<h2>�� �Խù�</h2>
						
							<!-- ��ü Ŀ�´�Ƽ ���� -->
							<form action="${pageContext.request.contextPath}/removecommunity.do" method="post">
							<sec:csrfInput/>
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">�۹�ȣ</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 13%">ī�װ���</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 33%">����</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 20%">�ۼ���</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">��ȸ��</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 19%">�������</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 5%">����</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:forEach items="${comlist.list}" var="cl">
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.boardNo}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.categoryName}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.title}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.id}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.hits}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${cl.wdate}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">
							      	<button class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer; background-color: white"
							      	name="boardNo" value="${cl.boardNo}">
										����
									</button>
							      </td>
							    </tr>
							  </c:forEach>
							    </tbody>
							</table>
							</form>
							
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