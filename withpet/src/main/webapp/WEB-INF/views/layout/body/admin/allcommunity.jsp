<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<style>
.communityBoxul li {height:30px; display:inline-block; cursor:pointer; line-height:30px; padding:0 15px; text-align:center; box-sizing:border-box;}
.communityBox ul li:hover {background:#ff5500}
</style>    
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
				<li class="nav-item"><a class="nav-link active community" href="#">전체 커뮤니티 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="communitycategory.do">커뮤니티 카테고리 관리</a></li>
			</ul>
			<div class="communityBox" style="position: absolute; top:45px; z-index: 1000; background: #aaa;
    				color: #fff; height: 30px; display: none">
				<ul style="margin: 0px; padding: 0px; font-size: 12px; margin-top: 0px">
					<!-- for로 돌리시면됩니다. -->
					<li style="height: 30px; display: inline-block; cursor: pointer; line-height: 30px; padding: 0 15px;
						    text-align: center; box-sizing: border-box;">
						돌보미
					</li>
					<li style="height: 30px; display: inline-block; cursor: pointer; line-height: 30px; padding: 0 15px;
							text-align: center; box-sizing: border-box;">
    					나눔마켓
    				</li>
					<li style="height: 30px; display: inline-block; cursor: pointer; line-height: 30px; padding: 0 15px;
							text-align: center; box-sizing: border-box;">
    					모임후기
    				</li>
				</ul>
			</div>
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