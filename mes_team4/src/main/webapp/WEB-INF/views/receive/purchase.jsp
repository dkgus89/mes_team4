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

function input1(purchase_cd,rproduct_cd_name,purchase_count){
	opener.setChildValue2(purchase_cd,rproduct_cd_name,purchase_count);
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
	 
	 
	<form name="whlist" method="get">
<!-- 		<input type="hidden" value=""> -->
		
		<table id="vendortable" class=" table table-striped" style="width:600px">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>발주코드</th>
					<th>거래처코드</th>
					<th>원자재코드</th>
					<th>발주량</th>
					<th>발주일자</th>
					<th>납품예정일</th>
					<th> </th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="dto" items="${purchaseMapList }" varStatus="sts">
				<tr>
	    			<td>${dto.purchase_cd}</td>
	    			<td>${dto.business_cd}</td>
		    		<td>${dto.rproduct_cd_name}</td>
		    		<td>${dto.purchase_count}</td>
		    		<td>${dto.purchase_date}</td>
		    		<td>${dto.purchase_due}</td> 
					<td>
					<button class="button2" onClick="input1('${dto.purchase_cd}','${dto.rproduct_cd_name}','${dto.purchase_count}');">선택</button>
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