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

<script>
function sub(){
	document.prodinsert.action="${pageContext.request.contextPath}/product/prodinsertPro";
	document.prodinsert.submit();
	setTimeout(function() { 
		opener.parent.location.reload();
		window.close();
		}, 200);
	}
function rst(){
	document.prodinsert.reset();
	}
</script>

</head>
<body>
	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>품목정보등록</h2><br>
	 <br>
<form action="${pageContext.request.contextPath}/product/prodinsertPro" name="prodinsert" method="post" >

		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>제품구분</th>
					<th>품목타입 </th>
					<th>제품코드 </th>
					<th>제품명 </th>
					<th>거래처명 </th>
					<th>재고단위  </th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>
					<select  name="product_dv">
						<option value="">선택해주세요</option>
						<option value="완제품">완제품</option>
						<option value="원자재">원자재</option>
					</select>
					</td>
					
					<td>
					<select  name="product_type_cd">
						<option value="">선택해주세요</option>
						<option value="1">1 완제품</option>
						<option value="2">2 주원료</option>
						<option value="3">3 부원료</option>
						<option value="4">4 포장자재</option>
					</select>
					</td>
					
					<td><input type="text" name="product_cd_name"></td>
					<td><input type="text" name="product_name"></td>
					<td><select name ="business_cd">
					<option value="">선택해주세요</option>
						<c:forEach var="dto" items="${instMap}">
							<option value="${dto.business_cd }">${dto.business_cd } </option>
						</c:forEach>
					</select></td>
					<td><select  name="product_unit">
						<option value="">선택해주세요</option>
						<option value="완제품">EA</option>
						<option value="원자재">kg</option>
					</select></td>
					<td><input type="text"  class="remarks" name="remarks" ></td>
				</tr>
			</tbody>				
		</table>

	</form>
 <br>
<!-- <div class="wrap2"> -->
	<button class="button2" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>	  
<!-- </div><br>  -->	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->