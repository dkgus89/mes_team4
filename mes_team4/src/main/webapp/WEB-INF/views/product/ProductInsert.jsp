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
function winclose() {
	opener.name="parentPage";
	document.frmName.target=opener.name;
	document.insertform.action="${pageContext.request.contextPath}/product/productinsertPro"
	document.insertform.submit();
	self.close();
}
</script>

</head>
<body>
	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>품목정보관리 </h2><br>
	<form action="${pageContext.request.contextPath}/product/prodinsertPro" method="post">
	<div class="wrap2">
	  <button class="button2" type="submit" onclick="javascript:winclose()">저장</button>
	  <button class="button2">초기화</button>
	 </div><br>
	 <br>


제품코드 : <input type="text" name="product_cd_name" value=""><br>
제품명 : <input type="text" name="product_name" value=""><br>
제품구분 : <label><input type="radio" name="product_dv" value="1" > 원자재
				 <input type="radio" name="product_dv" value="2"> 완제품<br></label>
거래처코드 : <input type="text" name="business_cd" value=""><br>
규격 : <input type="text" name="product_size" value=""><br>
재고단위 : <input type="text" name="product_unit" value=""><br>
적요 : <input type="text" name="remarks" value=""><br>

</form>

	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->