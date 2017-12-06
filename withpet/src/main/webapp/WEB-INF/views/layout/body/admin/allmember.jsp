<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<li class="nav-item"><a class="nav-link active" href="#">전체 회원</a></li>
				<li class="nav-item"><a class="nav-link" href="normalmember.do">일반 회원</a></li>
				<li class="nav-item"><a class="nav-link" href="yebimommy.do">견주 대기자</a></li>
				<li class="nav-item"><a class="nav-link" href="dogmommy.do">견주</a></li>
				<li class="nav-item"><a class="nav-link" href="exceptmember.do">탈퇴 회원</a></li>
				<li class="nav-item"><a class="nav-link" href="manager.do">관리자</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active show" id="allmember" style="padding: 0px 0px 20px 0px;">
					<div class="row" style="padding-top: 20px; padding-bottom: 20px">
						<div class="col-sm-12">
						
						
							<!-- 전체회원관리 -->
							<table style="width: 100%">
							  <thead>
							    <tr>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 8%">번호</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">이메일</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 15%">닉네임</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 20%">연락처</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">포인트</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 12%">가입일자</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">회원등급</th>
							      <th style="padding: .25rem; font-size: 14px; text-align: center; width: 10%">회원등급</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:forEach items="${allMember.list}" var="al">
							    <tr>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">1</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${al.id}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${al.nick}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${al.tel}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${al.money}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">${al.regdate}</td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">
								     <select class="form-control tier-select" id="membertierselect" name="ccategoryNo" style="font-size: 12px; height: 24px; padding-top:2px; padding-bottom:2px">
	                                       <option selected="selected">2</option>
	                                       <option>1</option>
	                                 </select>
							      </td>
							      <td style="padding: .45rem; text-align: center; font-size: 12px; height: 39px">
							      	<a href="#" class="btn btn-default" id="logoutAction" style="border-color:black ;text-decoration:none ;color:black ;display:inline-block;height: 24px; font-size: 12px; margin-bottom: 0px; padding-top: 5px; cursor: pointer">
										변경
									</a>
							      </td>
							    </tr>
							  </c:forEach>
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