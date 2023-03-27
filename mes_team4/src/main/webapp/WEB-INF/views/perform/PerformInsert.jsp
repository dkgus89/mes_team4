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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script>
function sub(){
document.PerformInsert.action="${pageContext.request.contextPath}/perform/performinsertpro";
document.PerformInsert.submit();
setTimeout(function() { 
	opener.parent.location.reload();
	window.close();
	}, 200);
}
function rst(){
document.PerformInsert.reset();
}



</script>
</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">생산실적 추가 </h2><br>
<!-- 	<div class="wrap2"> -->
	<button class="button2" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>
	
<!-- 	 </div><br> -->
	 <br><br>
	 
	 
	<form name="PerformInsert" method="post">
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>실적코드</th>
					<th>작업지시코드</th>
					<th>라인코드</th>
					<th>품목코드</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="text" name="perform_cd" value=""></td>
					<td><select name="instruction_code">
							<c:forEach var="dto" items="${instMap}">					
								<option value="${dto.instruction_code}">${dto.instruction_code}</option>							
							</c:forEach>
      				</select></td>
    				<td><select name="line_cd">
							<c:forEach var="dto" items="${instMap}">					
								<option value="${dto.line_cd}">${dto.line_cd}</option>							
							</c:forEach>
      				</select></td>
      				<td><select name="product_cd">
							<c:forEach var="dto" items="${instMap}">					
								<option value="${dto.product_cd}">${dto.product_cd}</option>							
							</c:forEach>
      				</select></td>
    			</tr>

			</tbody>
		</table>
		
		<br>
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					
					<th>실적일자</th>
					<th>양품</th>
					<th>불량</th>
					<th>불량사유</th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="date" name="perform_date" value=""></td>
    				<td><input type="text" name="fair_prod" value=""></td>
    				<td><input type="text" name="defect_prod" value=""></td>
    				<td><input type="text" name="defect_remarks" value=""></td>
    				<td><input type="text" name="remarks" value=""></td>
    			</tr>

			</tbody>
		</table>
	
	</form>
	
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
