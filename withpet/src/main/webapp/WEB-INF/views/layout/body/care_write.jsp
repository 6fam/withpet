<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<script>
		alert("�α��� �ϼ���!");
		location.href="${pageContext.request.contextPath}/loginForm.do";
	</script>
</sec:authorize>
<sec:authorize access="!hasRole('ROLE_DOGMOM')">
	<script>
		alert("���� ������ ��������!");
		location.href="${pageContext.request.contextPath}/home.do";
	</script>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_DOGMOM')">
<div class="container"
	style="background-color: white; border: solid 1px #adadad; padding-bottom:60px;margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px;">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<h1 id="navbars">
				<img src="resources/img/care_write.png" style="width: 250px">
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<div class="row" style="margin-top: 30px">
		<div class="col-sm-1"></div>
		<div class="col-sm-11"></div>
	</div>
	
	
		<div class="row" style="margin-left: 0px">
			<div class="col-sm-1"></div>
			<!-- �����Ͻ��� -->
			<div class="col-sm-2" >
				<!-- �̹��� �̸����� -->
               	<div style="border:solid 1px #cecece;width:180px; height: 200px; margin: 0px; padding: 0px">
               		<img id="blah" src="" alt="���� ���� ���" style="width: 180px; height:200px;"/>
               	</div>
               	<!--  �̹��� ���ε� -->
               	<button type="button" class="btn btn-danger" style="position: absolute;
				  width: 180px; height: 30px; border-radius: 3px; padding-top: 4px; margin-top: 10px; cursor: pointer">
				���ӻ��� ��� </button>
				<div style="width: 180px; height: 40px; cursor:pointer; position:relative">
   					<input type="file" id="imgInp" name="uploadFile" required="required" style="width: 180px; height: 30px; opacity: 0; position: relative; margin-top: 10px; cursor: pointer">
         		</div>
			</div>
			<!-- �����ϳ� -->
			<!-- ���Ӱ�������(���) ���� -->
			<div class="col-sm-8" style="margin-left: 25px">
				<table class="table">
					<tbody>
						<!-- ī�װ� -->
						<tr>
							<td style="width: 100px; text-align: center; font-weight: bold; padding-top: 16px">
								<font style="color: #4f4f4f">ī�װ�</font>
							</td>
							<td>
								<div class="row" style="text-align: center">
									<div class="col-sm-4">
										<select class="form-control" id="exampleSelect1" name="categoryName" style="font-size: 13px">
											<option style="font-size: 13px">ģ��</option>
											<option style="font-size: 13px">�Ʒ�</option>
											<option style="font-size: 13px">��å</option>
											<option style="font-size: 13px">����/���̳�</option>
										</select>
									</div>
									<div class="col-sm-8">
										<input style="font-size: 13px; margin-left:0px;" type="text" class="form-control" name="title" required="required">
									</div>
								</div>
							</td>
						</tr>
						<!-- �����Ͻ� -->
						<tr>
							<td style="width: 100px; text-align: center; font-weight: bold; padding-top: 16px">
								<font style="color: #4f4f4f">�����Ͻ�</font>
							</td>
							<td>
								<div class="row" style="text-align: center">
									<div class="col-sm-5">
										<input type="text" class="form-control" id="meetingStart" name="meetingStart"style="font-size: 13px"> 
									</div>
									<div class="col-sm-2" style="text-align: center; margin-top: 5px">~</div>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="meetingEnd" name="meetingEnd" style="font-size: 13px">
									</div>
								</div>
							</td>
						</tr>
						<!-- �����Ⱓ -->
						<tr>
							<td style="width: 100px; text-align: center; font-weight: bold; padding-top: 16px">
								<font style="color: #4f4f4f">�����Ⱓ</font>
							</td>
							<td>
								<div class="row" style="text-align: center">
									<div class="col-sm-5">
										<input type="text" class="form-control" id="gatheringStart" name="gatheringStart" style="font-size: 13px">
									</div>
									<div class="col-sm-2" style="text-align: center; margin-top: 5px">~</div>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="gatheringEnd" name="gatheringEnd" style="font-size: 13px">
									</div>
								</div>
							</td>
						</tr>
						
						<!-- ���ο� -->
						<tr>
							<td style="width: 100px; text-align: center; font-weight: bold; padding-top: 16px">
								<font style="color: #4f4f4f">���ο�</font>
							</td>
							<td>
								<div class="row" style="text-align: center">
									<div class="col-sm-3" style="padding-right: 0px">
										<input type="number" min="1" name="peopleCount" class="form-control" id="inputDefault" style="font-size: 13px">
									</div>
									<div class="col-sm-2" style="margin-left:-13px; padding-left: 0px; padding-top: 2px">
										��
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<hr>
		<script type="text/javascript">
			function checked(){
				document.getElementById('exampleInputText').readOnly=true;
			}
		</script>
		<!-- ���� ��� ���� -->
		<!-- ������� -->
		<div class="row" style="margin-top: 40px;">
			<div class="col-sm-1"></div>
			<div class="col-sm-1" style="padding-left:0px; margin-top: 5px;">
				<font style="color: #4f4f4f"><b>�������</b></font></div>
			<div class="col-sm-9">
				<div class="row">
					<div class="col-sm-9">
						<input type="text" class="form-control" id="sample5_address" style="font-size: 13px" aria-describedby="emailHelp" name="place">
					</div>
					<div class="col-sm-3">
						<input class="btn btn-danger" type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�" width="30%" name="addressBtn">
						<input style="height: 10px; margin-left: 20px" type="checkbox" name="addressNone" onclick="checkBox(this.form)">����
					</div>
				</div>
			</div>
			<div class="col-sm-1" style="text-align: center; margin-top: 4px"></div>
		</div>
		
		<!-- ���� -->
		<div class="row" style="margin-top: 10px;">
			<div class="col-sm-1"></div>
			<div class="col-sm-10" style="margin:0px; padding-left: 0px; padding-right: 0px">
				<div class="map_wrap" style="border: 1px solid #ddd;">
					<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<!-- ���ּ��Է� -->
		<div class="row" style="padding-left:0px; margin-top: 15px;margin-bottom:40px">
			<div class="col-sm-1"></div>
			<div class="col-sm-1" style="padding-left:0px; margin-top: 5px">
				<font style="color: #4f4f4f"><b>���ּ�</b></font></div>
			<div class="col-sm-9" style="margin-left: 0px; padding-left: 0px">
				<input type="text" class="form-control" id="exampleInputText" style="font-size: 13px" aria-describedby="emailHelp" name="detailPlace">
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<hr>
		
		<!-- �׷켳�� ����-->
		<div class="row" style="margin-top: 20px;">
			<div class="col-sm-1"></div>
			<div class="col-sm-1" style="padding-left:0px; margin-right: 0px; padding-right: 0px"><font style="color: #4f4f4f"><b>��/���ἱ��</b></font></div>
			<div class="col-sm-9">
				<div class="form-check">
					<label class="form-check-label" style="margin-right: 20px">
			        	<input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option1" style="margin-top: 8px;margin-right: 0px"> <font style="font-size: 13px">�����û</font>
			        </label>
			        <label class="form-check-label">
			            <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios3" value="option2" style="margin-top: 8px;margin-right: 0px"> <font style="font-size: 13px">�����û</font>
			      	</label>
			   </div>
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<hr>
		
		<!-- �����Է� ���� -->
		<div class="row" style="margin-top: 40px;margin-bottom: 40px">
			<div class="col-sm-1"></div>
			<div class="col-sm-1" style="padding-left:0px;margin-top: 5px;margin-right: 0px;padding-right: 0px">
				<font style="color: #4f4f4f"><b>����</b></font></div>
			<div class="col-sm-9" style="margin-left: 0px; padding-left: 0px">
				<textarea name="content" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;"></textarea>
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<hr>
		
		<!-- ����ó ���� -->
		<div class="row" style="margin-top: 20px;margin-bottom: 20px">
			<div class="col-sm-1"></div>
			<div class="col-sm-1" style="padding-left:0px;margin-top: 0px;margin-right: 0px;padding-right: 0px">
				<font style="color: #4f4f4f"><b>����ó</b></font></div>
			<div class="col-sm-3" style="margin-left: 0px; padding-left: 0px">
				<input type="text" class="form-control" id="exampleInputText" name="tel" style="font-size: 13px">
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<hr>
		
		<!-- ��ư ���� -->
		<div class="row" style="margin-top: 200px;margin-bottom: 100px">
			<div class="col-sm-1"></div>
			<div class="col-sm-10" style="text-align: center">
				<button type="button" class="btn btn-info registerPost"
					style="width: 100px; height: 40px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">���</button>
				<button type="button" class="btn btn-danger"
					style="width: 100px; height: 40px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer" onclick="cancelAll(); return false;">���</button>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<!-- ��ư �� -->
		
	</div>
</sec:authorize>

<!-- ��¥ ���� css/js -->
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
        <style>
            /*datepicker���� ����� �̹��� ��ư style����*/
            img.ui-datepicker-trigger {
                margin-left:5px; vertical-align:middle; cursor:pointer;
			}
        </style>
        
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <!-- datepicker �ѱ���� -->
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<!-- ��¥ ���� css/js -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4492fe06798cb47618534aee3cc9d20&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4492fe06798cb47618534aee3cc9d20&libraries=services"></script>
<script src="resources/script/chan.js"></script>
