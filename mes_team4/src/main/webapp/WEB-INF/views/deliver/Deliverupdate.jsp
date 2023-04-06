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
	function sub() {
		
		
	//	document.DeliverUpdate.action=""
		document.DeliverUpdate.submit();
		setTimeout(function() { 
			opener.parent.location.reload();
			window.close();
			}, 100);
	}

</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">출하 수정 페이지</h2><br>
	<div class="wrap2">
	  <button class="button2" onclick="sub()">등록</button>
	  <button class="button2" onclick="ret()">입력값리셋</button>
	  
	 </div><br>
	 <br>
	 
	 
	<form name="DeliverUpdate" method="post" action="${pageContext.request.contextPath}/deliver/updatePro">
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>출하코드</th>
					<th>거래처코드</th>
					<th>수주코드</th>
					<th>품목코드</th>
					<th>출하일자</th>
					<th>출하량</th>
					
					
				</tr>
			</thead>
					
					
					
			
			<tbody>
				<tr>
					<td><input type="text" name="deliver_cd" value="${deliverDTO.deliver_cd}" readonly="readonly"></td>
<%-- 					<td><input type="text" name="business_cd" value="${deliverDTO.business_cd }"></td>					 --%>
<%-- 					<td><input type="text" name="order_cd" value="${deliverDTO.order_cd }"></td> --%>
<%-- 					<td><input type="text" name="product_cd" value="${deliverDTO.product_cd }"></td> --%>
						<td><select name="business_cd"> 
							<c:forEach var="dto" items="${instMap }">
								<option value="${dto.business_cd}" >${dto.business_cd} </option>
							 </c:forEach>	
						</select></td>		
							
									
									
						<td><select  name="order_cd">
								<c:forEach var="dto" items="${instMap2 }">
									<option value="${dto.order_cd}" > ${dto.order_cd}</option>
								</c:forEach>
						</select> </td>
					
					
					
					<td><select name="product_cd_name">
						<c:forEach var="dto" items="${instMap3 }">
							<option value="${dto.product_cd_name }" > ${dto.product_cd_name } </option>
						</c:forEach>
						</select> </td>
					<td><input type="Date" name="deliver_date" value="${deliverDTO.deliver_date }"></td>
					<td><input type="text" name="deliver_count" value="${deliverDTO.deliver_count }"></td>
				</tr>

			</tbody>
			
			
			
		</table>
		
		<br>
		
		
<!-- 		<table id="vendortable" class="table table-striped"> -->
<!-- 			<thead> -->
<!-- 				<tr style="text-align: center; font-size: 0.9rem"> -->
					
<!-- 					<th>품목코드2</th> -->
<!-- 					<th>출하일자</th> -->
<!-- 					<th>출하량</th> -->
					
<!-- 				</tr> -->
<!-- 			</thead> -->
					
					
					
			
<!-- 			<tbody> -->
<!-- 				<tr> -->
					
<!-- 					<td><input type="text" name="product_cd2"></td> -->
<!-- 					<td><input type="date" name="deliver_date"></td> -->
<!-- 					<td><input type="text" name="deliver_count"></td> -->
<!-- 				</tr> -->

<!-- 			</tbody> -->
			
			
			
		</table>
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
