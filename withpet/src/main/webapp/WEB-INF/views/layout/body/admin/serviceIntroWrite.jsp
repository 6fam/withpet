<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authorize access="!hasRole('ROLE_MANAGER')">
	<script type="text/javascript">
		alert("�α��� �ϼ���!");
		location.href = "${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-12">
			<h1 id="navbars">
				<font style="font-size: 35px">���� �Ұ�</font>
			</h1>
		</div>
	</div>

	<!-- ��ȸ���Խ��� ���� -->
	<div class="row"
		style="margin-left: 0px; margin-bottom: 60px; margin-right: 0px">
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active" href="#">����
						�Ұ�</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember"
					style="padding: 0px 0px 20px 0px;">



					<form action="serviceIntroWrite.do?boardNo=1" method="post">
						<sec:csrfInput />
						<div class="row" style="padding-top: 20px; padding-bottom: 20px">
							<div class="col-sm-12">
									<c:if test="${sdto ne null}">
										<textarea class="form-control" id="exampleTextarea" rows="3"
											style="height: 400px" name="content">${sdto.content}</textarea>
									</c:if>
									<c:if test="${sdto eq null}">
										<textarea class="form-control" id="exampleTextarea" rows="3"
											style="height: 400px" name="content">�۵�ϾȵǾ�����</textarea>
									</c:if>
							</div>
						</div>

						<div class="row" style="padding-top: 20px; padding-bottom: 20px">
							<div class="col-sm-12">
								<button type="submit" class="btn btn-primary btn-lg btn-block">���</button>
							</div>
						</div>
					</form>




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