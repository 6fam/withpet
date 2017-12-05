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
				<li class="nav-item"><a class="nav-link active" href="#">전체 모금함</a></li>
				<li class="nav-item"><a class="nav-link" href="donationwait.do">모금 대기중</a></li>
				<li class="nav-item"><a class="nav-link" href="donatting.do">모금 진행중</a></li>
				<li class="nav-item"><a class="nav-link" href="donationfinish.do">모금 마감</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
						
						
							<!-- 전체회원관리 -->
							<table class="table table-hover table-border">
							  <thead class="thead-dark">
							    <tr>
							      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 5%">#</th>
							      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 12%">분류</th>
							      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 55%">제목</th>
							      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 13%">작성자</th>
							      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 5%">조회수</th>
							      <th style="background-color: #191919; color: white; padding: .25rem; font-size: 14px; text-align: center; width: 10%">작성일자</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <td style="padding: .45rem">1</td>
							      <td style="padding: .45rem">Column</td>
							      <td style="padding: .45rem"><a href="communityDetail.do">Column</a></td>
							      <td style="padding: .45rem">Column</td>
							      <td style="padding: .45rem">Column</td>
							      <td style="padding: .45rem">Column</td>
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