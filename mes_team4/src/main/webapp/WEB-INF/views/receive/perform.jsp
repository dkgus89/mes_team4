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

function input1(order_cd,product_cd_name,fair_prod){
	opener.setChildValue3(order_cd,product_cd_name,fair_prod);
	window.close();
}

</script>
</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->
	<h2>실적목록</h2><br>
	<div class="wrap2">
	
	 </div><br>
	 <br>
	 
	 
	<form name="performlist" method="get">
<!-- 		<input type="hidden" value=""> -->
		
		<table id="vendortable" class=" table table-striped" style="width:1300px">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th style="text-align: center;">실적코드</th>
					<th style="text-align: center;">작업지시코드</th>
					<th style="text-align: center;">수주코드</th>
					<th style="text-align: center;">라인코드</th>
					<th style="text-align: center; width: 50px;">라인명</th>
					<th style="text-align: center;">제품코드</th>
					<th style="text-align: center;">품목명</th>
					<th style="text-align: center;">실적일자</th>
					<th style="text-align: center;">지시수량</th>
					<th style="text-align: center;">양품</th>
					<th style="text-align: center;">불량</th>
					<th style="text-align: center;">불량사유</th>
					<th style="text-align: center;">적요</th>
					<th style="text-align: center;">선택</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="dto" items="${PerformMap}" varStatus="status">

				<tr style="text-align: center; font-size: 0.8rem">
					<td style="text-align: center;">${dto.perform_cd}</td>
    				<td style="text-align: center;">${dto.instruction_code}</td>
    				<td style="text-align: center;">${dto.order_cd}</td>
    				<td style="text-align: center;">${dto.line_cd}</td>
    				<td style="text-align: center;">${dto.line_name}</td>
    				<td style="text-align: center;">${dto.product_cd_name}</td> 
    				<td style="text-align: center;">${dto.product_name}</td> 			
    				<td style="text-align: center;">${dto.perform_date}</td>
    				<td style="text-align: center;">${dto.instruction_qt}</td>
    				<td style="text-align: center;">${dto.fair_prod}</td>
    				<td style="text-align: center;">${dto.defect_prod}</td>
    				<td style="text-align: center;">${dto.defect_remarks}</td>
    				<td style="text-align: center;">${dto.remarks}</td>
    				<td style="text-align: center;"><button class="button2" onclick="input1('${dto.order_cd}','${dto.product_cd_name}','${dto.fair_prod}');">선택</button></td>
    			</tr>
   			 
				</c:forEach>			
			</tbody>

		</table>
		
	</form>
	
<!-- 본문HTML 입력 끝-->
	</div>
</body>
</html>