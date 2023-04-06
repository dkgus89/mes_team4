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
function showPopup(){
	var link = "${pageContext.request.contextPath}/inst/orderlist";     
	var popupWidth = 1050;
	var popupHeight = 500;
	var popupX = (window.screen.width/2) - (popupWidth/2);
	var popupY= (window.screen.height/2) - (popupHeight/2);
	
  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
}
function setChildValue(order_cd, product_cd_name, order_count, deliver_date){
	
    document.getElementById("order_cd").value = order_cd;
    document.getElementById("product_cd_name").value = product_cd_name;
    document.getElementById("order_count").value = order_count;
    document.getElementById("deliver_date").value = deliver_date;

   

}
function sub(){
	$(document).ready(function(){
		// submit 유효성 검사
		var result = confirm("작업을 등록하시겠습니까?");
		if (result == true){   
// 			if($('#order_cd').val()==""){
// 				alert("수주코드를 선택하세요");
// 				$('#order_cd').focus();
// 				return false;
// 			}
			
// 			if($('#line_cd').val()==""){
// 				alert("작업라인을 선택하세요");
// 				$('#line_cd').focus();
// 				return false;
// 			}
// 			if($('#instruction_date').val()==""){
// 				alert("작업지시일자를 입력하세요");
// 				$('#instruction_date').focus();
// 				return false;
// 			}
// 			if($('#instruction_qt').val()==""){
// 				alert("지시수량을 입력하세요");
// 				$('#instruction_qt').focus();
// 				return false;
// 			}
// 			if($('#instruction_state').val()==""){
// 				alert("지시상태를 선택하세요");
// 				$('#instruction_state').focus();
// 				return false;
// 			}
			window.opener.name = "parentPage";
			document.insert.target="parentPage";
			document.insert.action="${pageContext.request.contextPath}/inst/instinsertpro";
			document.insert.submit();
			self.close();
		} else {
			return false;
		}	
	});
}
function rst(){
	// 초기화 유효성 검사
	var result = confirm("초기화 하시겠습니까?");
	if (result == true){    
		document.insert.reset();
	} else {
		return false;
	}
}

</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">작업지시 추가</h2><br>
<!-- 	<div class="wrap2"> -->
<!-- 	<button class="button2" id="aj">ajax</button> -->
	<button class="button2" id="sub" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>
	<button class="button2" onclick="showPopup();" style="width:200px">수주현황</button>
	
<!-- 	 </div><br> -->
	 <br><br>
	 
	 
	<form action="${pageContext.request.contextPath}/inst/instinsertpro" name="insert" id="II" method="post">
<!-- 		<input type="hidden" id="instruction_qt" value=""> -->
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">					
					<th>수주코드</th>
					<th>품목코드</th>
					<th>수주량</th>
					<th>출하예정일</th>
				</tr>
			</thead>
			
			<tbody>
				<tr style="text-align: center; font-size: 0.9rem">				
					<td><input type="text" name="order_cd" id="order_cd"></td>
					<td><input type="text" name="product_cd_name" id="product_cd_name"></td>
					<td><input type="text" name="order_count" id="order_count"></td>
					<td><input type="date" name="deliver_date" id="deliver_date"></td>	
    			</tr>

			</tbody>
		</table>
		
		<br>
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>라인코드</th>
					<th>지시일자</th>
					<th>지시수량</th>
					<th>지시상태</th>
				</tr>
			</thead>
			
			<tbody>
				<tr style="text-align: center; font-size: 0.9rem">
					<td><select name="line_cd" id="line_cd">
    					<option value="">--------</option>
    					<option value="FL001">1라인</option>
    					<option value="FL002">2라인</option>
    					<option value="FL003">3라인</option>
					</select></td>
					<td><input type="date" name="instruction_date" id="instruction_date"></td>	
    				<td><input type="text" name="instruction_qt" id="instruction_qt"></td>
    				<td><select name="instruction_state" id="instruction_state">
    					<option value="">------------</option>
    					<option value="0">대기</option>
    					<option value="1">작업중</option>
    					<option value="2">작업완료</option>
					</select></td>
    			</tr>

			</tbody>
		</table>
	
	</form>
	

<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>