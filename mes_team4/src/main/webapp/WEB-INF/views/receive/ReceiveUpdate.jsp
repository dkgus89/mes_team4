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
	document.receiveUpdate.action="${pageContext.request.contextPath}/receive/recupdatePro";
	document.receiveUpdate.submit();
	setTimeout(function() { 
		opener.parent.location.reload();
		window.close();
		}, 200);
	}
	function rst(){
	document.receiveUpdate.reset();
	}

</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2> ${receiveDTO.rec_schedule_cd } 입고 수정</h2><br>
	<div class="wrap2">
	<button class="button2" onclick="sub()">완료</button>
	<button class="button2" onclick="rst()">초기화</button>	  
	 </div><br><br>
	 
	<form name="receiveUpdate" method="post" action="${pageContext.request.contextPath}/receive/recupdatePro">
		<input type="hidden" name="rec_schedule_cd" value="${receiveDTO.rec_schedule_cd}">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>입고창고</th>
					<th>발주/수주코드</th>
					<th>제품코드</th>
					<th>수량</th>
					<th>입고일자</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="text" name="wh_cd" value="${receiveDTO.wh_cd}"></td>
					<td><input type="text" name="pchor_cd" value="${receiveDTO.pchor_cd }" readonly></td>
					<td><input type="text" name="product_cd_name" value="${receiveDTO.product_cd_name }" readonly></td>
					<td><input type="text" name="rec_count" value="${receiveDTO.rec_count }" readonly></td>
					<td><input type="date" name="rec_date" value="${receiveDTO.rec_date }"></td>
				</tr>

			</tbody>
		</table>
	
	</form>
	<br>
	
<!-- 본문HTML 입력 끝-->
	</div>
</body>
</html>