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
											<th>아이디</th>
											<th>관리</th>
										</tr>
									</thead>
									<c:forEach items="${requestScope.atlist}" var="atl" varStatus="status">
									<tbody>
										<tr>
											<td>${status.count}</td>
											<td>${atl.nick}</td>
											<td>${atl.tel}</td>
											<td id="id">${atl.id}</td>
											<td style="text-align: center;"><button type="button" class="except" value="${atl.id}">강퇴</button></td>
										</tr>
									</tbody>
									</c:forEach>
								</table>
								
						</div>
						<div class="col-sm-3"></div>
					</div>
</div>

<script>
	$(document).ready(function(){
		
		$(".row").on("click", ".except", function() {
			var id = $(this).val();
			//alert(id);
			
			if(confirm("제거하시겠습니까?")){
				
				//alert("클릭");
				$.ajax({
					type:"post",
					url:"exceptAttend.do",
					data:"id"+id,
					success:function(data){
						alert(data+"님 제거 완료");
						$("#possibleCount").text(data);
					}
				}); //ajax
				
			}//if
		});
		
	});
</script>