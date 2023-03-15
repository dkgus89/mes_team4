<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<!-- js파일 들어가는 곳 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<!-- js파일 들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->
<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>
</script>
<!-- 자바스크립트 입력 끝-->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

</head>
<body>

<div id="topcontainer">
	<div id ="head">
	
		<div class="wrap">
		  <button class="button">홈</button>
		  <button class="button">로그인</button>
		  <button class="button">마이페이지</button>
		  <button class="button">로그아웃</button>
		</div>

	</div>

	<div id="header">
		
		<h1 class="main">의약품 생산 MES<img src="${pageContext.request.contextPath}/resources/image/robot.png"></h1>
	</div> 
</div>
