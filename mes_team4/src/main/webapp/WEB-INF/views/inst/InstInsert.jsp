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
function setChildValue(order_cd, product_name, order_count, rproduct_name, consumption, deliver_date){
	
    document.getElementById("order_cd").value = order_cd;
    document.getElementById("product_name").value = product_name;
    document.getElementById("order_count").value = order_count;
    document.getElementById("rproduct_name").value = rproduct_name;
    document.getElementById("consumption").value = consumption;
    document.getElementById("deliver_date").value = deliver_date;

   

}
function sub(){
	$(document).ready(function(){
		// submit 유효성 검사
		var result = confirm("생산실적을 등록하시겠습니까?");
		if (result == true){   
			if($('#instruction_code').val()==""){
				alert("작업지시코드를 선택하세요");
				$('#instruction_code').focus();
				return false;
			}
			if($('#line_cd').val()==""){
				alert("라인코드를 입력하세요");
				$('#line_cd').focus();
				return false;
			}
			if($('#product_cd').val()==""){
				alert("품목코드를 입력하세요");
				$('#product_cd').focus();
				return false;
			}
			if($('#perform_date').val()==""){
				alert("실적일자를 입력하세요");
				$('#perform_date').focus();
				return false;
			}
			if($('#fair_prod').val()==""){
				alert("양품 수량을 입력하세요");
				$('#fair_prod').focus();
				return false;
			}
			if($('#defect_prod').val()==""){
				alert("불량품 수량을 입력하세요");
				$('#defect_prod').focus();
				return false;
			}
			window.opener.name = "parentPage";
			document.PerformInsert.target="parentPage";
			document.PerformInsert.action="${pageContext.request.contextPath}/inst/instinsertpro";
			document.PerformInsert.submit();
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
		document.instInsert.reset();
	} else {
		return false;
	}
}
// $(document).ready(function () {
// // 	alert($("#inst").val());
// 		$.ajax({
// 			url:'${pageContext.request.contextPath}/perform/callcd',
// 			data:{'ic':$("#inst").val()},
// 			success:function(result){
// 				  $('#line_cd').val(result);
// 			}
// 		});
		
// 		$.ajax({
// 			url:'${pageContext.request.contextPath}/perform/callcd2',
// 			data:{'ic':$("#inst").val()},
// 			success:function(result){
// 				  $('#product_cd').val(result);
// 			}
// 		});
		
// 		$("#inst").on("change", function(){
// 			$.ajax({
// 				url:'${pageContext.request.contextPath}/perform/callcd',
// 				data:{'ic':$("#inst").val()},
// 				success:function(result){
// 					  $('#line_cd').val(result);			
// 				}
// 			});
			
// 			$.ajax({
// 				url:'${pageContext.request.contextPath}/perform/callcd2',
// 				data:{'ic':$("#inst").val()},
// 				success:function(result){
// 					$('#product_cd').val(result);			
// 				}
// 			});			
// 		});
// });
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
	 
	 
	<form action="${pageContext.request.contextPath}/inst/instinsertpro" name="instInsert" id="II" method="post">
<!-- 		<input type="hidden" id="instruction_qt" value=""> -->
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">					
					<th>수주코드</th>
					<th>품목이름</th>
					<th>수주량</th>
					<th>원자재이름</th>
					<th>소요량</th>
					<th>출하예정일</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>				
					<td><input type="text" name="order_cd" id="order_cd"></td>
					<td><input type="text" name="product_name" id="product_name"></td>
					<td><input type="text" name="order_count" id="order_count"></td>
      				<td><input type="text" name="rproduct_name" id="rproduct_name"></td>
					<td><input type="text" name="consumption" id="consumption"></td>	
					<td><input type="text" name="deliver_date" id="deliver_date"></td>	
    			</tr>

			</tbody>
		</table>
		
		<br>
		
<!-- 		<table id="vendortable" class="table table-striped"> -->
<!-- 			<thead> -->
<!-- 				<tr style="text-align: center; font-size: 0.9rem"> -->
					
<!-- 					<th>실적일자</th> -->
<!-- 					<th>양품</th> -->
<!-- 					<th>불량</th> -->
<!-- 					<th>불량사유</th> -->
<!-- 					<th>적요</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
			
<!-- 			<tbody> -->
<!-- 				<tr> -->
<!-- 					<td><input type="date" name="perform_date" id="perform_date" value=""></td> -->
<!--     				<td><input type="text" name="fair_prod" id="fair_prod" value=""></td> -->
<!--     				<td><input type="text" name="defect_prod" id="defect_prod" value=""></td> -->
<!--     				<td><input type="text" name="defect_remarks" id="defect_remarks" value=""></td> -->
<!--     				<td><input type="text" name="remarks" id="remarks" value=""></td> -->
<!--     			</tr> -->

<!-- 			</tbody> -->
<!-- 		</table> -->
	
	</form>
	
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>