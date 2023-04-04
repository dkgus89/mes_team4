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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>

<script>
function showPopup(){
	var link = "${pageContext.request.contextPath}/deliver/deliverinstlist";     
	var popupWidth = 1050;
	var popupHeight = 500;
	var popupX = (window.screen.width/2) - (popupWidth/2);
	var popupY= (window.screen.height/2) - (popupHeight/2);
	
  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
// 	window.open("${pageContext.request.contextPath}/deliver/deliverinstlist",'_blank',"deliverinstlist","width=1100", height=200,top=200, left=200");
	}


function setChildValue(business_cd,order_cd,product_cd){

	document.getElementById("inst").value=business_cd;
	document.getElementById("order_cd").value=order_cd;
	document.getElementById("product_cd").value=product_cd;
}

function sub(){
		$(document).ready(function(){
			if($('#inst').val() == " "){
				alert("비즈니스코드를 선택하세요.")
				$('#inst').focus();
				return false;
			}
			if($('#order_cd').val() == " "){
				alert("수주코드를 입력하세요.")
				$('#inst').focus();
				return false;
			}
			if($('#product_cd').val() == " "){
				alert("품목코드를 입력하세요.")
				$('#product_cd').focus();
				return false;
			}
			
			window.opener.name ="parentPage";
			document.deliverInsert.target="parentPage";
			document.deliverInsert.action="${pageContext.request.contextPath}/deliver/deliverinsert";
			document.deliverInsert.submit();
			self.close();
		});
		
}
function rst(){
	document.DeliverInsert.reset();
	}
	$(document).ready(function () {
//	 	alert($("#inst").val());
			$.ajax({
				url:'${pageContext.request.contextPath}/deliver/callcd',
				data:{'ic':$("#inst").val()},
				success:function(result){
					  $('#business_cd').val(result);
				}
			});
			
			$.ajax({
				url:'${pageContext.request.contextPath}/deliver/callcd2',
				data:{'ic':$("#inst").val()},
				success:function(result){
					  $('#order_cd').val(result);
				}
			});
			
			$("#inst").on("change", function(){
				$.ajax({
					url:'${pageContext.request.contextPath}/deliver/callcd',
					data:{'ic':$("#inst").val()},
					success:function(result){
						  $('#product_cd').val(result);			
					}
				});
				
				$.ajax({
					url:'${pageContext.request.contextPath}/perform/callcd2',
					data:{'ic':$("#inst").val()},
					success:function(result){
						$('#product_cd').val(result);			
					}
				});			
			});
	});		

// <script type="text/javascript">
// 	function fun1() {
// 		document.fr.submit();
// 		setTimeout(function() { 
// 			opener.parent.location.reload();
// 			window.close();
// 			}, 100);
// 	}
	
	

</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">출하 등록 페이지 </h2><br>
	<div class="wrap2">
	  <button class="button2" onclick="fun1()">등록</button>
	  <button class="button2">초기화</button>
	  <button class="button2" onclick="showPopup()" style="width:220px">수주등록현황</button>
	  
	 </div><br>
	 <br>
	 
	 
	<form action="${pageContext.request.contextPath}/deliver/insertPro" method="post" id="PI" name="DeliverInsert">
		<input type="hidden" value="" id="instruction_qt">
		
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
					<td><input type="text" name="deliver_cd" id="inst" value=""></td>
					
					
					
						<td><select name="business_cd"> 
<%-- 							<c:forEach var="dto" items="${instMap }"> --%>
<%-- 								<option value="${dto.business_cd }" >${dto.business_cd } </option> --%>
<%-- 							 </c:forEach>	 --%>
<!-- 						</select></td>		 -->
							
									
									
						<td><input type="text" name="order_cd" id="order_cd"> </td>
<%-- 								<c:forEach var="dto" items="${instMap2 }"> --%>
<%-- 									<option value="${dto.order_cd }" > ${dto.order_cd }</option> --%>
<%-- 								</c:forEach> --%>
<!-- 						</select> </td> -->
					
					
					
					<td><input type="text" name="product_cd" id="product_cd"> </td>
<%-- 						<c:forEach var="dto" items="${instMap3 }"> --%>
<%-- 							<option value="${dto.product_cd }" > ${dto.product_cd } </option> --%>
<%-- 						</c:forEach> --%>
<!-- 						</select> </td> -->
						
						
					<td><input type="Date" name="deliver_date" value=""></td>
					<td><input type="text" name="deliver_count" value=""></td>
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
