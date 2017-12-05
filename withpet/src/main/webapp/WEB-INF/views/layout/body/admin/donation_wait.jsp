<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="container" style="background-color: white; border: solid 1px #adadad; margin-top: 10px">
	<div class="row page-header" style="margin-top: 20px">
		<div class="col-sm-12">
			<h1 id="navbars">
				<font style="font-size: 35px">관리자페이지</font>
			</h1>
		</div>
	</div>
	
	<!-- 총회원게시판 시작 -->
	<div class="row"
		style="margin-left: 0px; margin-bottom: 60px; margin-right: 0px">
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link" href="alldonation.do">전체 모금함</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">모금 대기중</a></li>
				<li class="nav-item"><a class="nav-link" href="donatting.do">모금 진행중</a></li>
				<li class="nav-item"><a class="nav-link" href="donationfinish.do">모금 마감</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
						
						
							<!-- 전체회원관리 -->
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 8%">회원번호</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">이메일</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">닉네임</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">댕댕이이름</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 8%">성별</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 13%">중성화여부</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 13%">댕댕이등록일</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 14%">승인</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<!-- for -->
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">java@gmail.com</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">포기란배승찬셀때나하는소리</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">댕댕이</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">남</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">YES</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">2017-12-05</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px">
							      	<a href="#" class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer">
										승인
									</a>
							      </td>
							    </tr>
							  </tbody>
							</table>
							<!-- 전체회원관리 끝 -->
							
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