<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
td, th {
	text-align: center;
}
</style>
<div class="container" style="background-color: white; border: solid 1px #adadad; margin-top: 10px;padding-bottom:60px">
	<div class="row page-header"
		style="margin-top: 20px; margin-bottom: 20px">
		<div class="col-sm-11" style="margin-left: 20px;">
			<h1 id="navbars">
				<img src="resources/img/market_write.png"
					style="width: 200px; display: block;">
			</h1>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<!-- 나눔마켓 작성 시작 -->
	<div class="row" style="margin-left: 0px; margin-right: 0px">
		<div class="col-sm-1" ></div>
		<div class="col-sm-2" style="padding-left:0px">
			<select class="form-control" id="exampleSelect1" style="height:47px">
				<option>나눔합니다</option>
				<option>구매합니다</option>
				<option>판매합니다</option>
			</select>
		</div>
		<div class="col-sm-8" style="padding-left:0px">
		<input class="form-control form-control-lg" type="text" id="inputLarge"placeholder="제목">
		</div>
		<div class="col-sm-1" ></div>
	</div>
	
	
	<div class="row" style="margin-left: 0px; margin-right: 0px">
		<div class="col-sm-1" ></div>
		<div class="col-sm-10" style="padding-left:0px;margin-top:20px">
				<textarea class="form-control" id="exampleTextarea" style="height:450px"placeholder="내용을 입력해주세요"></textarea> 
				<div style="text-align: center; margin-top: 50px">
							    <button type="submit" class="btn btn-primary" style="cursor: pointer">등록</button>
							    <button type="button" class="btn btn-danger" style="cursor: pointer;margin-left:15px;">취소</button>
						    </div>
		<div class="col-sm-1" ></div>
	</div>
	<!-- 나눔마켓 작성 끝 -->
</div>
</div>
