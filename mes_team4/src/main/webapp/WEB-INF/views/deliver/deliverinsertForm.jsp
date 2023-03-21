<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출하 추가</title>

<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<script type="text/javascript">
	function fun1() {
		document.fr.submit();
	}

</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">값 입력할 페이지 </h2><br>
	<div class="wrap2">
	  <button class="button2" onclick="fun1()">등록</button>
	  <button class="button2">초기화</button>
	  
	 </div><br>
	 <br>
	 
	 
	<form action="${pageContext.request.contextPath}/deliver/insertPro" method="post" name="fr">
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>선택</th>
					<th>출하코드</th>
					<th>거래처코드</th>
					<th>수주코드</th>
					<th>품목코드</th>
					<th>품목코드2</th>
					<th>출하일자</th>
					<th>출하량</th>
					
				</tr>
			</thead>
					
			
			<tbody>
				<tr>
					<td><input type="checkbox" id="checkbox"></td>
					<td><input type="text" name="deliver_cd"></td>
					<td><input type="text" ></td>
					<td><input type="text" ></td>
					<td><input type="text" ></td>
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
