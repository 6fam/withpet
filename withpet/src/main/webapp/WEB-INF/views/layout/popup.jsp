<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html>
<html lang="en">
  <!-- META / CSS / Javascript /Font 등 설정정보 -->
  <!-- CSS			: css/mystyle.css 에서 작업하시면 됩니다. -->
  <!-- JavaScript	: script/myjs.js 에서 작업하시면 됩니다. -->
  <!-- 링크 걸린 순서 변경 시 코드 에러 생길 수 있습니다. -->
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>함께 하시 개</title>
    
    <script type="text/javascript" src="resources/js/service/HuskyEZCreator.js" charset="utf-8"></script>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    
    <!-- Bootstrap core JavaScript -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/popper/popper.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- 결제모듈 -->
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <!-- JavaScript 수정 -->
    <script src="resources/script/myJs.js"></script>
    
    <link rel="stylesheet" type="text/css" href="resources/css/chan.css"/>
    <!-- upload -->
    <script src="resources/script/upload.js"></script>
    
    <link rel="stylesheet" type="text/css" href="resources/css/style.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery.jscrollpane.css" />
	<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow&v1' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Ovo' rel='stylesheet' type='text/css' />
	<!-- Fullscreen jQuery template -->
	<script id="fullviewTmpl" type="text/x-jquery-tmpl"></script>
  </head>

  <!-- 실제 클라이언트에게 보여줄 레이아웃 구성입니다. -->
  <body style="margin-top: 0px; padding-top: 0px">
	<!-- 바디 부분입니다. -->
	<div class="body"  style="padding-bottom: 40px">
		<tiles:insertAttribute name="body" />
	</div>
    <script src="resources/js/smarteditor.js"></script>
  </body>
</html>
