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
window.opener.name = "parentPage";
document.StockInsert.target="parentPage";
document.StockInsert.action="${pageContext.request.contextPath}/stock/stockinsertpro";
document.StockInsert.submit();
self.close();	
}
function rst(){
document.StockInsert.reset();
}
</script>


</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">재고현황 추가 </h2><br>
<!-- 	<div class="wrap2"> -->
	<button class="button2" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>	  
<!-- 	 </div><br> -->
	 <br><br>
	 
	 
	<form name="StockInsert" method="post">
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>재고번호</th>
					<th>창고코드</th>
					<th>입고예정코드</th>
					<th>품목코드</th>
					<th>재고수량</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="text" name="stock_cd" value=""></td>
					<td><select name="wh_cd">
							<c:forEach var="dto" items="${whMap}">					
								<option value="${dto.wh_cd}">${dto.wh_cd}</option>							
							</c:forEach>
      				</select></td>
					<td><select name="rec_schedule_cd">
							<c:forEach var="dto" items="${recMap}">					
								<option value="${dto.rec_schedule_cd}">${dto.rec_schedule_cd}</option>							
							</c:forEach>
      				</select></td>
					<td><select name="product_cd">
							<c:forEach var="dto" items="${prodMap}">					
								<option value="${dto.product_cd}">${dto.product_cd}</option>							
							</c:forEach>
      				</select></td>
					<td><input type="text" name="stock_count" value=""></td>
				</tr>

			</tbody>
		</table>
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
