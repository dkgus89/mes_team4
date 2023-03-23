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

<script type="text/javascript">
function sub(){
document.insertform.action="${pageContext.request.contextPath}/wh/whinsertPro";
document.insertform.submit();
setTimeout(function() { 
	opener.parent.location.reload();
	window.close();
	}, 200);
}
function rst(){
document.LineInsert.reset();
}
</script>


</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">창고 등록</h2><br>
	
	 <br>
	 <div class="wrap2">
	  <button class="button2" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>	 
	  
	 </div><br>
	 
	<form action="${pageContext.request.contextPath}/wh/whinsertPro" name="insertform" method="post">
	
	 
	 창고명 : <input type="text" name="wh_name"><br>
	 창고구분 : <label><input type="radio" name="wh_dv" value="완제품" checked="checked">완제품</label>
	 		 <label><input type="radio" name="wh_dv" value="원자재">원자재</label><br>
	 창고코드 : <input type="text" name="wh_cd"><br> 		 
	 창고주소 : <input type="text" name="wh_addr"><br>
	 창고연락처 : <input type="tel" name="wh_tel"><br>
	 창고사용여부 : <label><input type="radio" name="wh_use" value="사용" checked="checked">사용</label>
	 		    <label><input type="radio" name="wh_use" value="미사용">미사용</label><br>
	 적요 : <input type="text" name="remarks"><br>
	 </form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
