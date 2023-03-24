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

<script>
function sub(){
	document.prodinsert.action="${pageContext.request.contextPath}/product/prodinsertPro";
	document.prodinsert.submit();
	setTimeout(function() { 
		opener.parent.location.reload();
		window.close();
		}, 200);
	}
function rst(){
	document.prodinsert.reset();
	}
</script>

</head>
<body>
	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>품목정보등록</h2><br>
	 <br>
<form name="prodinsert" method="post">
제품구분 : <label><input type="radio" name="product_dv" value="원자재" > 원자재
				<input type="radio" name="product_dv" value="완제품"> 완제품<br></label>
제품코드 : <input type="text" name="product_cd_name" value=""><br>
제품명 : <input type="text" name="product_name" value=""><br>
거래처코드 : <input type="text" name="business_cd" value=""><br>
규격 : <input type="text" name="product_size" value=""><br>
재고단위 : <input type="text" name="product_unit" value=""><br>
적요 : <input type="text" name="remarks" value=""><br>

</form>
 <br>
<!-- <div class="wrap2"> -->
	<button class="button2" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>	  
<!-- </div><br>  -->	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->