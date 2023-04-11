<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEDI-FAC</title>

<!-- 파비콘 들어가는곳 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/favicon.ico">
<!-- 파비콘 들어가는곳 -->

<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script>

function input1(wh_cd){
	opener.setChildValue(wh_cd);
	window.close();
}

</script>
</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->
	<h2>창고목록</h2><br>
	<div class="wrap2">
	
	 </div><br>
	 <br>
	 
	 
	<form name="whlist" >
<!-- 		<input type="hidden" value=""> -->
		
		<table id="vendortable" class=" table table-striped" style="width:600px">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>창고코드</th>
					<th>창고명</th>
					<th>창고구분</th>
					<th>창고지역</th>
					<th> </th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="whDTO" items="${whList }">
				<tr>
					<td>${whDTO.wh_cd}</td>
					<td>${whDTO.wh_name}</td>
					<td>${whDTO.wh_dv}</td>
					<td>${whDTO.wh_addr}</td>
					<td>
					<button class="button2" onClick="input1('${whDTO.wh_cd}');">선택</button>
					</td>
				</tr>
			</c:forEach>			
			</tbody>

		</table>
		
	</form>
	
<!-- 본문HTML 입력 끝-->
	</div>
</body>
</html>