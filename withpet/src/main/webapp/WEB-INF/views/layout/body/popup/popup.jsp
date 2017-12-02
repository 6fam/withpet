<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<div class="container" style="background-color: white">
					<br>
					<p>
						<strong>참여자 리스트</strong> 
					</p>
					<br>
					<div class="row" style="margin-left: 0px">
						<div class="col-sm-12" style="padding-left: 0px">
								<table class="table table-hover table-bordered">
									<thead class="thead-dark">
										<tr>
											<th>순번</th>
											<th>참여자</th>
											<th>연락처</th>
										</tr>
									</thead>
									<c:forEach items="${requestScope.atlist}" var="atl" varStatus="status">
									<tbody>
										<tr>
											<td>${status.count}</td>
											<td>${atl.nick}</td>
											<td>${atl.tel}</td>
												
										</tr>
									</tbody>
									</c:forEach>
								</table>
								
						</div>
						<div class="col-sm-3"></div>
					</div>
</div>