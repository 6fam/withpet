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
				<li class="nav-item"><a class="nav-link active" href="#">��ü ȸ��</a></li>
				<li class="nav-item"><a class="nav-link" href="normalmember.do">�Ϲ� ȸ��</a></li>
				<li class="nav-item"><a class="nav-link" href="dogmommy.do">����</a></li>
				<li class="nav-item"><a class="nav-link" href="yebimommy.do">���� �����</a></li>
				<li class="nav-item"><a class="nav-link" href="exceptmember.do">Ż�� ȸ��</a></li>
				<li class="nav-item"><a class="nav-link" href="manager.do">������</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
						
						
							<!-- ��üȸ������ -->
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 8%">ȸ����ȣ</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">�̸���</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">�г���</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 20%">��й�ȣ��</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">����Ʈ</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 12%">��������</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">ȸ�����</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">ȸ�����</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">java@gmail.com</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">�����������������ϴ¼Ҹ�</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">��й�ȣ�˷���</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">1000��</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">
								     <select class="form-control tier-select" id="membertierselect" name="ccategoryNo" style="font-size: 12px; height: 24px; padding-top:2px; padding-bottom:2px">
	                                       <option selected="selected">2</option>
	                                       <option>1</option>
	                                 </select>
							      </td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">
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