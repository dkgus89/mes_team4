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
    function goSubmit(){
    	window.opener.name="parentPage";
    	document.insertform.target="parentPage";
    	document.insertform.action="${pageContext.request.contextPath}/receive/recinsertpro";
    	document.insertform.submit();
    	self.close();
    }
</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">입고등록 </h2><br>
	
		<form  name="insertform" method="post" >
	
	<div class="wrap2">
		<input type="submit" class="button2" value="등록" onclick="goSubmit()">
		<input type="reset" class="button2" value="초기화">
	 </div><br>
	 <br>
	 
	 
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>입고창고</th>
					<th>발주/수주코드</th>
					<th>입고일자</th>
					<th>진행상태</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="text"></td>
					<td><input type="text" ></td>
					<td><input type="text" ></td>
					<td><input type="text" ></td>
				</tr>

			</tbody>
		</table>
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
