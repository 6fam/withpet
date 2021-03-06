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
				<li class="nav-item"><a class="nav-link" href="normalmember.do?pageNo=1">ȸ��</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">���� ���δ�</a></li>
				<li class="nav-item"><a class="nav-link" href="dogmommy.do?pageNo=1">����� ���δ�</a></li>
				<li class="nav-item"><a class="nav-link" href="exceptmember.do?pageNo=1">Ż�� ȸ��</a></li>
				<li class="nav-item"><a class="nav-link" href="manager.do?pageNo=1">������</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
							<form action="${pageContext.request.contextPath}/managerdogmompermit.do" method="post">
							<sec:csrfInput/>
								<table style="width: 100%">
								<thead>
									<tr>
									    <th style="padding: .25rem; font-size: 14px; text-align: center; width: 4%">��ȣ</th>
									  	<th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">�̸���</th>
									    <th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">�г���</th>
									    <th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">������̸�</th>
									    <th style="padding: .25rem; font-size: 14px; text-align: center; width: 4%">����</th>
									    <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">�߼�ȭ����</th>
								     	<th style="padding: .25rem; font-size: 14px; text-align: center; width: 13%">����̻���</th>
									    <th style="padding: .25rem; font-size: 14px; text-align: center; width: 13%">����̵����</th>
							     		<th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">����</th>
									</tr>
								</thead>
								<tbody>
							  		<!-- for -->
								    <c:forEach items="${yebilist.list}" var="ye" varStatus="status"> 
								    <tr>
								      <td style="padding: .45rem; text-align: center; font-size: 12px">${status.count}</td>
								      <td style="padding: .45rem; text-align: center; font-size: 12px">${ye.dogDTO.id}</td>
								      <td style="padding: .45rem; text-align: center; font-size: 12px">${ye.nick}</td>
								      <td style="padding: .45rem; text-align: center; font-size: 12px">${ye.dogDTO.name}</td>
								      <td style="padding: .45rem; text-align: center; font-size: 12px">${ye.dogDTO.gender}</td>
								      <td style="padding: .45rem; text-align: center; font-size: 12px">${ye.dogDTO.neutralization}</td>
								      <td style="padding: .45rem; text-align: center; font-size: 12px">${ye.dogDTO.bdate}</td>
								      <td style="padding: .45rem; text-align: center; font-size: 12px">${ye.dogDTO.regDate}</td>
								      <td style="padding: .45rem; text-align: center; font-size: 12px">
								      	<button class="btn btn-default" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer; background-color: white" 
								      		name="id" value="${ye.dogDTO.id}">
											����
										</button>
								      </td>
								    </tr>
								    </c:forEach>
							    	<!-- for -->
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
			<!-- ������ ����¡ ���� -->
			<div class="row" style="margin-left: 0px">
				<div class="col-sm-4"></div>
				<div class="col-sm-6">
					<div>
						<c:set value="${requestScope.yebilist.pagingBean}" var="pp" />
						<ul class="pagination">
							<c:if test="${pp.previousPageGroup }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/yebimommy.do?pageNo=${pp.startPageOfPageGroup-1}">&laquo;</a></li>
							</c:if>
							<c:forEach var="i" begin="${pp.startPageOfPageGroup}"
								end="${pp.endPageOfPageGroup }">
								<c:choose>
									<c:when test="${pp.nowPage!=i }">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/yebimommy.do?pageNo=${i}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="#">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pp.nextPageGroup}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/yebimommy.do?pageNo=${pp.endPageOfPageGroup+1}">&raquo;</a></li>
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