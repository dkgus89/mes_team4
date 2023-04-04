<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function goSubmit(){
    	window.opener.name="parentPage";
    	document.insertform1.target="parentPage";
    	document.insertform1.action="${pageContext.request.contextPath}/order/orderinsertpro";
    	document.insertform1.submit();
    	self.close();
    }
</script>

</head>
<body>
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">주문등록</h2><br>
	
	<form  name="insertform1" method="post" >
	
	<div class="wrap2">
		<input type="submit" class="button2" value="등록" onclick="goSubmit()">
		<input type="reset" class="button2" value="초기화">
	 </div><br>
	 <br>

		<input type="hidden" value="">
		<table id="vendortable" class="table table-striped" style="width:1000px;">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>거래처</th>
					<th>제품명</th>
					<th>주문량</th>
					<th>수주등록날짜</th>
					<th>출하예정날짜</th>
					<th>담당자</th>	
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>
					<select id="select1"  name="business_cd">
						<option value="">코드 : 거래처명</option>
					<c:forEach var="businessList" items="${businessList}">
						<option value="${businessList.business_cd}" name="${businessList.business_cd}">${businessList.business_cd} : ${businessList.business_name}</option>
					</c:forEach>
					</select>
					
					</td>
					<td>
					<select id="select1"  name="product_cd" >
						<option value="">코드 : 제품명</option>
					<c:forEach var="productList" items="${productList}">
						<option value="${productList.product_cd}"  name="${productList.product_cd}">${productList.product_cd} : ${productList.product_name}</option>
					</c:forEach>
					</select>
					</td>
					<td><input type="text" name="order_count" size=8;></td>	
					<td><input type="date" name="order_date"></td>
					<td><input type="date" name="deliver_date"></td>
					<td>
					<select id="select1"  name="emp_no" >
						<option value="">담당직원</option>
					<c:forEach var="systemList" items="${systemList}">
						<option value="${systemList.emp_no}"  name="${systemList.emp_no}">${systemList.emp_no} : ${systemList.emp_name}</option>
					</c:forEach>
					</select>
					</td>	
				</tr>
			</tbody>
		</table>

	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	</body>
</html>