<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<form action="donationOpen.do" method="post" enctype="multipart/form-data" id="frame" >
<sec:csrfInput/>
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<!-- 도화지 입니다. -->
			<div style="background-color: white; margin-top: 10px; margin-bottom: 40px; border: 1px solid #d1d1d1; height: 1500px">
				<div class="row page-header"
					style="margin-top: 20px; margin-bottom: 30px">
					<div class="col-sm-1"></div>
					<div class="col-sm-2">
						<h1 id="navbars">
							<img src="resources/img/care_write.png" style="width: 190px; display: block;">
						</h1>
					</div>
					<div class="col-sm-8" style="margin-top: -5px; margin-left: -20px;"></div>
					<div class="col-sm-1"></div>
				</div>
				<div class="row" style="margin-left: 0px">
					<div class="col-sm-1"></div>
					<div class="col-sm-11"></div>
				</div>
				<div class="row" style="margin-left: 0px; margin-right: 0px">
					<div class="col-sm-12">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td style="width: 130px; text-align: center; font-weight: bold">기부 단체</td>
									<td><input type="text" name="donationOrg" style="font-size: 10px" class="form-control" id="exampleInputText" aria-describedby="emailHelp"></td>
								</tr>
								<tr>
									<td style="width: 130px; text-align: center; font-weight: bold">계좌주</td>
									<td><input type="text" name="accountHost" style="font-size: 10px" class="form-control" id="exampleInputText" aria-describedby="emailHelp"></td>
								</tr>
								<tr>
									<td style="width: 130px; text-align: center; font-weight: bold">기부받을 은행</td>
									<td><select class="form-control" name="bankName" id="exampleSelect1" style="width:150px; float: left; font-size: 13px">
									        <option style="font-size: 13px">은행선택</option>
									        <option style="font-size: 13px">국민은행</option>
									        <option style="font-size: 13px">기업은행</option>
									        <option style="font-size: 13px">신한은행</option>
									    </select>
									</td>
								</tr>
								<tr>
									<td style="width: 130px; text-align: center; font-weight: bold">기부계좌</td>
									<td><input type="text" name="accountNo" style="font-size: 10px" class="form-control" id="exampleInputText" aria-describedby="emailHelp"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 반려견 정보 끝 -->
				<br>
				<hr>
				<br>
				<!-- 돌보미 등록 시작 -->
				<div class="row" style="margin-left: 0px;">
					<div class="col-sm-12">
						<div class="row" style="margin-top: 20px;">
							<div class="col-sm-1" style="text-align: center; margin-top: 5px;">제목</div>
							<div class="col-sm-10">
								<input type="text" name="title" class="form-control" id="exampleInputText" aria-describedby="emailHelp">
							</div>
						</div>
						<div class="row" style="margin-top: 40px;">
							<div class="col-sm-1" style="text-align: center; margin-top: 5px;">내용</div>
							<div class="col-sm-11">
								<!-- 스마트에디터 -->
								<textarea name="content" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;"></textarea>
							</div>
						</div>
						<div class="row" style="margin-top: 40px;">
							<div class="col-sm-1" style="text-align: center; margin-top: 5px;">모금 희망액</div>
							<div class="col-sm-6" style="margin-right: 0px; padding-right: 0px">
								<input type="text" name="dreamMoney" class="form-control" id="inputDefault">
							</div>
							<div class="col-sm-1" style="text-align: center; margin-top: 5px;margin-left: 0px;padding-left: 0px">원</div>
						</div>
						
						<!-- 1번째 이미지 -->
						<div class="row" style="margin-top: 40px;">
							<div class="col-sm-1" style="text-align: center; margin-top: 5px;">이미지1</div>
							<div class="col-sm-10" style="margin-right: 0px; padding-right: 0px">
								<input type="file" name="uploadFileList[0]" class="form-control" id="inputDefault">
							</div>
						</div>
						
						<!-- 2번째 이미지 -->
						<div class="row" style="margin-top: 40px;">
							<div class="col-sm-1" style="text-align: center; margin-top: 5px;">이미지2</div>
							<div class="col-sm-10" style="margin-right: 0px; padding-right: 0px">
								<input type="file" name="uploadFileList[1]" class="form-control" id="inputDefault">
							</div>
						</div>
						
						<!-- 3번째이미지 -->
						<div class="row" style="margin-top: 40px;">
							<div class="col-sm-1" style="text-align: center; margin-top: 5px;">이미지3</div>
							<div class="col-sm-10" style="margin-right: 0px; padding-right: 0px">
								<input type="file" name="uploadFileList[2]" class="form-control" id="inputDefault">
							</div>
						</div>
						
						<!-- 버튼 시작 -->
						<div class="row" style="margin-top: 60px;">
							<div class="col-sm-4"></div>
							<div class="col-sm-2">
								<button type="button" class="btn btn-outline-danger registerPost" style="width: 100px; height: 30px; font-size: 12px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">등록</button>
							</div>
							<div class="col-sm-1"></div>
							<div class="col-sm-2">
								<button type="button" class="btn btn-outline-danger" style="width: 100px; height: 30px; font-size: 11px; margin-top: 8px; margin-bottom: 8px; padding-top: 8px; cursor: pointer">취소</button>
							</div>
							<div class="col-sm-2"></div>
						</div>
						<!-- 버튼 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>