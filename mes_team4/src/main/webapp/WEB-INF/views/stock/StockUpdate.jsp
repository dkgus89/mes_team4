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
document.StockUpdate.target="parentPage";
document.StockUpdate.action="${pageContext.request.contextPath}/stock/stockupdatepro";
document.StockUpdate.submit();
self.close();
}
function rst(){
document.StockUpdate.reset();
}
</script>


</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">재고현황 수정 </h2><br>
<!-- 	<div class="wrap2"> -->
	<button class="button2" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>	  
<!-- 	 </div><br> -->
	 <br><br>
	 
	 
	<form name="StockUpdate" method="post">
		<input type="hidden">
		
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
					<td><input type="text" name="stock_cd" value="${StockDTO.stock_cd}" readonly></td>
					<td><select name="wh_cd">
							<option value="${StockDTO.wh_cd}" selected>${StockDTO.wh_cd}</option>
								<c:forEach var="dto" items="${whMap}">
									<c:if test="${dto.wh_cd != StockDTO.wh_cd}">											
									<option value="${dto.wh_cd}">${dto.wh_cd}</option>	
									</c:if>						
								</c:forEach>
      					</select></td>
					<td><select name="rec_schedule_cd">
							<option value="${StockDTO.rec_schedule_cd}" selected>${StockDTO.rec_schedule_cd}</option>
								<c:forEach var="dto" items="${recMap}">
									<c:if test="${dto.rec_schedule_cd != StockDTO.rec_schedule_cd}">											
									<option value="${dto.rec_schedule_cd}">${dto.rec_schedule_cd}</option>	
									</c:if>						
								</c:forEach>
      					</select></td>
					<td><select name="product_cd">
							<option value="${StockDTO.product_cd}" selected>${StockDTO.product_cd}</option>
								<c:forEach var="dto" items="${prodMap}">
									<c:if test="${dto.product_cd != StockDTO.product_cd}">											
									<option value="${dto.product_cd}">${dto.product_cd}</option>	
									</c:if>						
								</c:forEach>
      					</select></td>
					<td><input type="text" name="stock_count" value="${StockDTO.stock_count}"></td>
				</tr>
			</tbody>
		</table>	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
