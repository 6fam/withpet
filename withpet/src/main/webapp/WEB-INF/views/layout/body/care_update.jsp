<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="resources/css/chan.css" />
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<script>
		alert("�α��� �ϼ���!");
		location.href = "${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
<sec:authorize access="!hasRole('ROLE_DOGMOM')">
	<script>
		alert("���� ������ ��������!");
		location.href = "${pageContext.request.contextPath}/home.do";
	</script>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_DOGMOM')">
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<!-- ��ȭ�� �Դϴ�. -->
				<div
					style="background-color: white; margin-top: 10px; margin-bottom: 40px; border: 1px solid #d1d1d1; height: 1300px">
					<div class="row page-header"
						style="margin-top: 20px; margin-bottom: 30px">
						<div class="col-sm-1"></div>
						<div class="col-sm-2">
							<h1 id="navbars">
								<img src="resources/img/care_write.png"
									style="width: 190px; display: block;">
							</h1>
						</div>
						<div class="col-sm-8"
							style="margin-top: -5px; margin-left: -20px;"></div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-1"></div>
						<div class="col-sm-14">
							<p>
								<strong>���� �ݷ��� ����</strong> / <strong>${ddto.id}</strong>
							</p>
						</div>
					</div>
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-1"></div>
						<!-- �����Ͻ��� -->
						<div class="col-sm-3">
							<div
								style="border: solid 1px #cecece; width: 180px; height: 200px; margin: 0px; padding: 0px"></div>
						</div>
						<!-- �����ϳ� -->
						<!-- �ݷ��� ���� ���� -->
						<div class="col-sm-7">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td style="text-align: center; font-weight: bold; width: 45%">�����
											�̸�</td>
										<td>${ddto.name}</td>
									</tr>
									<tr>
										<td style="text-align: center; font-weight: bold; width: 45%">����</td>
										<td>${ddto.gender}</td>
									</tr>
									<tr>
										<td style="text-align: center; font-weight: bold; width: 45%">����</td>
										<td>${ddto.bdate}</td>
									</tr>
									<tr>
										<td style="text-align: center; font-weight: bold; width: 45%">����</td>
										<td>${ddto.intro}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- �ݷ��� ���� �� -->
					<br>
					<hr>
					<br>
					<!-- ������ ��� ���� -->
					<div class="row" style="margin-left: 0px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<form method="post" action="care_updateCheck.do">
								<sec:csrfInput />
								<input type="hidden" name="boardNo" value="${boardNo}">
								<div class="row" style="margin-top: 20px;">
									<div class="col-sm-2"
										style="text-align: center; margin-top: 5px;">����</div>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="exampleInputText"
											aria-describedby="emailHelp" name="title">
									</div>
								</div>
								<div class="row" style="margin-top: 40px;">
									<div class="col-sm-2"
										style="text-align: center; margin-top: 5px;">���ǻ���</div>
									<div class="col-sm-10">
										<textarea class="form-control" id="exampleTextarea" rows="3"
											style="margin-top: 0px; margin-bottom: 0px; height: 94px;"
											name="content"></textarea>
									</div>
								</div>
								<div class="row" style="margin-top: 40px;">
									<div class="col-sm-2"
										style="text-align: center; margin-top: 5px;">�����Ͻ�</div>
									<div class="col-sm-4">
										<input type="date" class="form-control" id="inputDefault"
											name="meetingStart">
									</div>
									<div class="col-sm-1"
										style="text-align: center; margin-top: 5px">~</div>
									<div class="col-sm-4">
										<input type="date" class="form-control" id="inputDefault"
											name="meetingEnd">
									</div>
								</div>
								<div class="row" style="margin-top: 40px;">
									<div class="col-sm-2"
										style="text-align: center; margin-top: 5px;">�����Ⱓ</div>
									<div class="col-sm-4">
										<input type="date" class="form-control" id="inputDefault"
											name="gatheringStart">
									</div>
									<div class="col-sm-1"
										style="text-align: center; margin-top: 5px">~</div>
									<div class="col-sm-4">
										<input type="date" class="form-control" id="inputDefault"
											name="gatheringEnd">
									</div>
								</div>
								<div class="row" style="margin-top: 40px;">
									<div class="col-sm-2"
										style="text-align: center; margin-top: 5px;">�ּ�</div>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="exampleInputText"
											aria-describedby="emailHelp" name="address">
									</div>
									<div class="col-sm-2"
										style="text-align: center; margin-top: 4px">
										<input style="height: 10px;" type="checkbox"
											class="form-check-input">����
									</div>
								</div>
								<div class="row" style="margin-top: 40px;">
									<div class="col-sm-2"></div>
									<!-- ���� -->
									<div class="col-sm-8">
										<div
											style="border: solid 1px #cecece; width: 100%; height: 200px; margin: 0px; padding: 0px"></div>
									</div>
									<!-- ���� -->
								</div>
								<div class="row" style="margin-top: 40px;">
									<div class="col-sm-2"
										style="text-align: center; margin-top: 5px;">���ּ�</div>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="exampleInputText"
											aria-describedby="emailHelp" name="detailAddress">
									</div>
								</div>
								<!-- ��ư -->
								<div class="row" style="margin-top: 40px; margin-bottom: 40px">
									<div class="col-sm-4"></div>
									<div class="col-sm-2">
										<button type="submit" class="btn btn-outline-danger"
											style="width: 100px; height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">�����ϱ�</button>
									</div>
									<div class="col-sm-1"></div>
									<div class="col-sm-2">
										<button type="button" class="btn btn-outline-danger"
											style="width: 100px; height: 30px; font-size: 11px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">���</button>
									</div>
									<div class="col-sm-2"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- ������ ��� �� -->
				<div class="col-sm-1"></div>
			</div>
		</div>
	</div>
</sec:authorize>









