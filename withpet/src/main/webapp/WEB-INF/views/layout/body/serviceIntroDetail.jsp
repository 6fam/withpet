<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container"
	style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-12">
			<h1 id="navbars">
				<font style="font-size: 35px">���񽺼Ұ�</font>
			</h1>
		</div>
	</div>

	<!-- ��ȸ���Խ��� ���� -->
	<div class="row"
		style="margin-left: 0px; margin-bottom: 40px; margin-right: 0px">
		<div class="col-sm-12">
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember"
					style="padding: 0px 0px 20px 0px;">
					<!-- ���� -->
					<div class="row" style="padding-top: 30px; padding-bottom: 0px; font-size:20px">
						<div class="col-sm-12">
							�� ���� ����
						</div>
					</div>
					
					<!-- content -->
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
							${sdto.content}<br>
						</div>
					</div>
					
					<!-- ���� -->
					<div class="row" style="padding-top: 60px; padding-bottom: 0px; font-size:20px">
						<div class="col-sm-12">
							�� �Բ��Ͻð� ��ü���
						</div>
					</div>
					
					<!-- ��ü ��� �̹��� -->
					<div class="row" style="padding-top: 0px; padding-bottom: 20px">
						<div class="col-sm-12" style="text-align:center;">
							<img alt="���" src="resources/img/grade.png" style="width: 700px">
						</div>
					</div>
					
					<!-- ��ü ��� ���� ���� -->
					<div class="row" style="padding-top: 0px; padding-bottom: 20px">
						<div class="col-sm-2"></div>
						<div class="col-sm-8">
							- �Ϲ�ȸ��(red) : ȸ������ �� �Ϲ�ȸ��<br>
							- ��������(yellow) : ����� ���� ���  <br>
							- ��������δ�(green) : ������ , ��� ����� ���δ� ���� �� ����� ���δ�<br>
							- ������ , ���(blue) : ��ڰ� �����ڷ� ȸ�� ���� �� ������
						</div>
						<div class="col-sm-2"></div>
					</div>
					
					
					<!-- ���� -->
					<div class="row" style="padding-top: 60px; padding-bottom: 0px; font-size:20px">
						<div class="col-sm-12">
							�� ����� ���δ� Ȯ�� ����
						</div>
					</div>
					<div class="row" style="padding-top: 0px; padding-bottom: 0px">
						<div class="col-sm-12" style="text-align:center;">
							<img alt="���" src="resources/img/grade2.png" style="width: 700px">
						</div>
					</div>
					
					<!-- ���� ���� ���� ���� -->
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-2"></div>
						<div class="col-sm-8">
							�� ȸ������ (�Ϲ�ȸ��) <br>
							�� �α��� �� ���������� ����� ��û (��������)<br>
							�� ��ڰ� ������ ���������� ����� ���δ� ��� ���� (����� ���δ�)
							
						</div>
						<div class="col-sm-2"></div>
					</div>
					
					<!-- ���� -->
					<div class="row" style="padding-top: 60px; padding-bottom: 0px; font-size:20px">
						<div class="col-sm-12">
							�� �Բ��Ͻð� �Ұ�
						</div>
					</div>
					
					<!-- ���� ���� �Ұ� �̹��� �κ� -->
					<div class="row" style="padding-top: 20px; padding-bottom: 0px">
						<div class="col-sm-4" style="border-right:1px dotted #ddd;text-align:center;margin:0 auto">
							<img alt="���Ӿ�����" src="resources/img/icon1.png" style="width: 75px;padding-bottom:30px">
							<br>���� ����<br><br>
							<p>����̵� ���� ������ ����<br>����̵��� ��ȸ���� �淯 �ִ� ���� �Դϴ�.</p>
						</div>
						<div class="col-sm-4" style="border-right:1px dotted #ddd;text-align:center;margin:0 auto">
							<img alt="���̰�ġ������" src="resources/img/icon2.png" style="width: 75px;padding-bottom:30px">
							<br>������ ��ġ ����<br><br>
							<p>��θ� ���� ����̵鿡�� <br>������ �ִ� �����Դϴ�.</p>
						</div>
						<div class="col-sm-4" style="text-align:center;margin:0 auto">
							<img alt="Ŀ�´�Ƽ������" src="resources/img/icon3.png" style="width: 75px;padding-bottom:30px">
							<br>Ŀ�´�Ƽ ����<br><br>
							<p>��������, ��������, �ݷ�����, ������ ���� <br> ���������� ���� �� �� �ִ� �����Դϴ�.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>