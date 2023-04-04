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
	document.productUpdate.action="${pageContext.request.contextPath}/product/produpdatePro";
	document.productUpdate.submit();
	setTimeout(function() { 
		opener.parent.location.reload();
		window.close();
		}, 200);
	}
	function rst(){
	document.productUpdate.reset();
	}

</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle"> 품목정보수정 </h2><br>
<!-- 	<div class="wrap2"> -->
<!-- 	<button class="button2" onclick="sub()">완료</button>
	<button class="button2" onclick="rst()">초기화</button>	   -->
<!-- 	 </div><br> -->
	 
	<form name="productUpdate" method="post">
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th style="text-align:center">제품구분</th>
					<th style="text-align:center">제품코드</th>
					<th style="text-align:center">제품명</th>
					<th style="text-align:center">거래처코드</th>
					<th style="text-align:center">재고단위</th>
					<th style="text-align:center">적요</th>
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
					<td><input type="text" name="product_cd_name" value="${productDTO.product_cd_name }" readonly></td>
					<td><input type="text" name="product_name" value="${productDTO.product_name }" ></td>
					<td><input type="text" name="business_cd" value="${productDTO.business_cd }" ></td>
					<td><input type="text" name="product_unit" value="${productDTO.product_unit }"></td>
					<td><input type="text" name="remarks" value="${productDTO.remarks }"></td>
				</tr>

			</tbody>
		</table>
	
	</form>
	<br>
	<button class="button2" onclick="sub()">완료</button>
	<button class="button2" onclick="rst()">초기화</button>		
<!-- 본문HTML 입력 끝-->
	</div>
</body>
</html>