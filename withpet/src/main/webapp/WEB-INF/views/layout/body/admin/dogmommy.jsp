<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
				<li class="nav-item"><a class="nav-link" href="normalmember.do">�Ϲ� ȸ��</a></li>
				<li class="nav-item"><a class="nav-link" href="yebimommy.do">���� �����</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">����</a></li>
				<li class="nav-item"><a class="nav-link" href="exceptmember.do">Ż�� ȸ��</a></li>
				<li class="nav-item"><a class="nav-link" href="manager.do">������</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
						
						
							<!-- ��üȸ������ -->
							<!-- ��üȸ������ -->
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
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">java@gmail.com</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����������������ϴ¼Ҹ�</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">��</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">O</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">
							      	<a href="#" class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer">
										����
									</a>
							      </td>
							    </tr>
							    <!-- for �� -->
							    
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">java@gmail.com</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����������������ϴ¼Ҹ�</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">��</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">O</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">
							      	<a href="#" class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer">
										����
									</a>
							      </td>
							    </tr>
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">java@gmail.com</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����������������ϴ¼Ҹ�</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">��</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">O</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">
							      	<a href="#" class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer">
										����
									</a>
							      </td>
							    </tr>
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">java@gmail.com</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����������������ϴ¼Ҹ�</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">��</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">O</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">
							      	<a href="#" class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer">
										����
									</a>
							      </td>
							    </tr>
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">java@gmail.com</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����������������ϴ¼Ҹ�</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">��</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">O</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">
							      	<a href="#" class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer">
										����
									</a>
							      </td>
							    </tr>
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">java@gmail.com</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����������������ϴ¼Ҹ�</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">�����</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">��</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">O</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">
							      	<a href="#" class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer">
										����
									</a>
							      </td>
							    </tr>
							    
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