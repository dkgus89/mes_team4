<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">


</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">값 입력할 페이지 </h2><br>
	
	 <br>
	 
	 
	<form action="${pageContext.request.contextPath}/wh/whinsertPro" method="post">
	<div class="wrap2">
	  <button class="button2">등록</button>
	  <button class="button2">초기화</button>
	  
	 </div><br>
	 창고코드 : <input type="text" name="wh_cd" ><br>
	 창고명 : <input type="text" name="wh_name"><br>
	 창고구분 : <label><input type="radio" name="wh_dv" value="0" checked="checked">완제품</label>
	 		 <label><input type="radio" name="wh_dv" value="1">원자재</label><br>
	 창고주소 : <input type="text" name="wh_addr"><br>
	 창고연락처 : <input type="tel" name="wh_tel"><br>
	 창고사용여부 : <label><input type="radio" name="wh_use" value="1" checked="checked">사용</label>
	 		 <label><input type="radio" name="wh_use" value="0">미사용</label><br>
	 적요 : <input type="text" name="remarks"><br>
	 </form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
