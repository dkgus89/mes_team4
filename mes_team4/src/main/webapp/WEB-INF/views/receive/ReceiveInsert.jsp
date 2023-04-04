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
	document.recinsert.action="${pageContext.request.contextPath}/receive/recinsertPro";
	document.recinsert.submit();
	setTimeout(function() { 
		opener.parent.location.reload();
		window.close();
		}, 200);
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
</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">입고등록 </h2><br>
	
	<button class="button2" onclick="showPopup();" style="width:100px">창고</button>
	
	<div class="wrap2">
	<button class="button2" id="sub" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>
	 </div><br>
	 <br>
	 
	 <form action="${pageContext.request.contextPath}/receive/recinsertPro" name="recinsert" method="post" >
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>입고창고</th>
					<th>발주/수주코드</th>
					<th>수량</th>
					<th>입고일자</th>
					<th>진행상태</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="text" name="wh_cd" id="wh_cd"></td>
					<td><input type="text" name="pchor_cd" id="pchor_cd"></td>
					<td><input type="text" name="rec_count" id="rec_count"></td>
					<td><input type="date" name="rec_date" id="rec_date" value=""></td>
					<td><input type="text" name="in_complete" id="in_complete"></td>
				</tr>

			</tbody>
		</table>
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
