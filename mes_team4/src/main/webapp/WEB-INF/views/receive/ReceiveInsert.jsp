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

// 창고현황
function sub(){
	window.opener.name = "parentPage";
	document.recinsert.target="parentPage";
	document.recinsert.action="${pageContext.request.contextPath}/receive/recinsertPro";
	document.recinsert.submit();
	self.close();
	}
	
function showPopup(){
    	var link = "${pageContext.request.contextPath}/receive/warehouse";     
    	var popupWidth = 700;
    	var popupHeight = 800;
    	var popupX = (window.screen.width/2) - (popupWidth/2);
    	var popupY= (window.screen.height/2) - (popupHeight/2);
    	
      	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
    }
    function setChildValue(wh_cd){
        document.getElementById("wh_cd").value = wh_cd;
    }

// 발주현황
function showPopup2(){
    	var link = "${pageContext.request.contextPath}/receive/purchase";     
    	var popupWidth = 800;
    	var popupHeight = 800;
    	var popupX = (window.screen.width/2) - (popupWidth/2);
    	var popupY= (window.screen.height/2) - (popupHeight/2);
    	
      	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
    }
    function setChildValue2(purchase_cd,rproduct_cd_name,purchase_count){
        document.getElementById("pchor_cd").value = purchase_cd;
        document.getElementById("product_cd_name").value = rproduct_cd_name;
        document.getElementById("rec_count").value = purchase_count;
    }

// 수주현황
function showPopup3(){
    	var link = "${pageContext.request.contextPath}/receive/order";     
    	var popupWidth = 800;
    	var popupHeight = 800;
    	var popupX = (window.screen.width/2) - (popupWidth/2);
    	var popupY= (window.screen.height/2) - (popupHeight/2);
    	
      	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
    }
    function setChildValue3(order_cd,product_cd,order_count){
        document.getElementById("pchor_cd").value = order_cd;
        document.getElementById("product_cd_name").value = product_cd;
        document.getElementById("rec_count").value = order_count;
    }
    
function rst(){
    	document.recinsert.reset();
    	}    
</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">입고등록 </h2><br>
	
	<button class="button2" onclick="showPopup();" style="width:100px">창고</button>
	<button class="button2" onclick="showPopup2();" style="width:100px">발주</button>
	<button class="button2" onclick="showPopup3();" style="width:100px">수주</button>

	 <br>
	 <br>
	 
	 <form action="${pageContext.request.contextPath}/receive/recinsertPro" name="recinsert" method="post" >
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>입고창고</th>
					<th>발주/수주코드</th>
					<th>제품코드</th>
					<th>수량</th>
					<th>입고일자</th>
					<th>진행상태</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="text" name="wh_cd" id="wh_cd"></td>
					<td><input type="text" name="pchor_cd" id="pchor_cd"></td>
					<td><input type="text" name="product_cd_name" id="product_cd_name"></td>
					<td><input type="text" name="rec_count" id="rec_count"></td>
					<td><input type="date" name="rec_date" id="rec_date" value=""></td>
					<td>
					<select  name="in_complete" id="in_complete">
						<option value="">선택해주세요</option>
						<option value="0">미완료</option>
						<option value="1">완료</option>
					</select>
					</td>
				</tr>

			</tbody>
		</table>
	
	</form>
	<br>
	<button class="button2" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
