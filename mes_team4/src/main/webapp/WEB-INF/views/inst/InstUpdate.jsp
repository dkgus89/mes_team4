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
function setChildValue(order_cd, product_cd, product_name, order_count, deliver_date){
	 	
		document.getElementById("order_cd").value = order_cd;
		document.getElementById("product_cd").value = product_cd;
	    document.getElementById("product_name").value = product_name;
	    document.getElementById("order_count").value = order_count;
	    document.getElementById("deliver_date").value = deliver_date;
}
function sub(){
	$(document).ready(function(){ //Jquery 시작
		// submit 유효성 검사
		var rt = null;
		var fp = document.getElementById("fair_prod").value;
		var dp = document.getElementById("defect_prod").value;
		var qt = document.getElementById("instruction_qt").value;
		var int_fp = Number(fp);
		var int_dp = Number(dp);
		var int_qt = Number(qt);
		var result = confirm("수정사항을 등록하시겠습니까?");
		if (result == true){   		
			$.ajax({ //ajax 시작
				type:"GET",
	 			url:'${pageContext.request.contextPath}/inst/ordercheck',
	 			async: false,
	 			data:{'order':$('#order_cd').val()},
	 			success:function(result){
	 				 if(result!=0) {
	 		              alert("이전에 이미 선택되었던 수주입니다.");
	 		              rt=1;
	 		          }
	 			}
	 		}); //ajax 끝
			if(rt==1){
				return false;
			}
			if($('#order_cd').val()==""){
				alert("수주번호를 선택하세요");
				$('#order_cd').focus();
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
			if(int_fp > int_qt){
				alert("양품 수량이 지시수량을 초과했습니다.");
				$('#fair_prod').focus();
				return false;
			}
			if(int_dp > int_qt){
				alert("불량품 수량이 지시수량을 초과했습니다.");
				$('#defect_prod').focus();
				return false;
			}
			if((int_fp + int_dp) > int_qt){
				alert("총 생산량이 지시수량을 초과했습니다.");
				return false;
			}
			// 유효성 검사 통과시 submit
			window.opener.name = "parentPage";
			document.PerformUpdate.target="parentPage";
			document.PerformUpdate.action="${pageContext.request.contextPath}/perform/performupdatepro";
			document.PerformUpdate.submit();
			self.close();
		} else {
			return false;
		}
	}); //Jquery 끝
}
//초기화 기능
function rst(){
	// 초기화 유효성 검사
	var result = confirm("초기화 하시겠습니까?");
	if (result == true){    
		document.PerformUpdate.reset();
	} else {
		return false;
	}
}
</script>


</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">작업지시 수정</h2><br>
<!-- 	<div class="wrap2"> -->
	<button class="button2" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>	 	
<!-- 	<button class="button2" onclick="showPopup();" style="width:200px">수주현황</button> -->
<!-- 	 </div><br> -->
	 <br><br>
	 
	 
	<form name="instUpdate" method="post">
<%-- 		<input type="hidden" name="perform_cd" value="${perform.perform_cd}"> --%>
<!-- 		<input type="hidden" id="instruction_qt" value=""> -->
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
<!-- 					<th>실적코드</th> -->
					<th>수주코드</th>
					<th>품목코드</th>				
				</tr>
			</thead>
			
			<tbody>
				<tr>
					
<!-- 					<td><select name="instruction_code"  id="inst"> -->
<%-- 							<option value="${perform.instruction_code}" selected>${perform.instruction_code}</option> --%>
<%-- 								<c:forEach var="dto" items="${instMap}"> --%>
<%-- 									<c:if test="${dto.instruction_code != perform.instruction_code}">											 --%>
<%-- 									<option value="${dto.instruction_code}">${dto.instruction_code}</option>	 --%>
<%-- 									</c:if>						 --%>
<%-- 								</c:forEach> --%>
<!--       					</select></td> -->
<%-- 					<td><input type="text" name="instruction_code" id="instruction_code" value="${perform.instruction_code}"></td> --%>
    				<td><input type="text" name="order_cd" id="order_cd" value="${instruction.order_cd}"></td>
    				<td><input type="text" name="product_cd" id="product_cd" value="${instruction.product_cd}"></td>			
				</tr>
								
			</tbody>
		</table>
		
		<br>
		
<!-- 		<table id="vendortable" class="table table-striped"> -->
<!-- 			<thead> -->
<!-- 				<tr style="text-align: center; font-size: 0.9rem">					 -->
<!-- 					<th>실적일자</th> -->
<!-- 					<th>양품</th> -->
<!-- 					<th>불량</th> -->
<!-- 					<th>불량사유</th> -->
<!-- 					<th>적요</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
			
<!-- 			<tbody> -->
<!-- 				<tr> -->
<%--     				<td><input type="date" name="perform_date" id="perform_date" value="${perform.perform_date}"></td> --%>
<%--     				<td><input type="text" name="fair_prod" id="fair_prod" value="${perform.fair_prod}"></td> --%>
<%--     				<td><input type="text" name="defect_prod" id="defect_prod" value="${perform.defect_prod}"></td> --%>
<%--     				<td><input type="text" name="defect_remarks" id="defect_remarks" value="${perform.defect_remarks}"></td> --%>
<%--     				<td><input type="text" name="remarks" id="remarks" value="${perform.remarks}"></td> --%>
<!-- 				</tr> -->

<!-- 			</tbody> -->
<!-- 		</table> -->
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
