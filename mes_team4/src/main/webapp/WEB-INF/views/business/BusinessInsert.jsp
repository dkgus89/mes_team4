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

<script type="text/javascript">

	function goPopup(){
		 window.open("jusoPopup","pop","width=1000, height=500, top=200, left=200");
		}
	function jusoCallBack(roadFullAddr, zipNo){
		alert("gg");
// 			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadFullAddr.value = roadFullAddr;
			document.form.zipNo.value = zipNo;
	}
    			</script>
</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">값 입력할 페이지 </h2><br>
	
	<form method="post">
	<div class="wrap2">
	  <button class="button2" >등록</button>
	  <button class="button2" onclick="reset">초기화</button>
	  
	 </div><br>
	 <br>
	
		<input type="hidden" value="">
		<table id="vendortable" class="table table-striped" style="width:1000px;">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>구분</th>
					<th>거래처명</th>
					<th>대표자</th>
					<th>유형</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="text"></td>
					<td><input type="text" ></td>
					<td><input type="text" ></td>
					<td><input type="text" ></td>	
				</tr>
			</tbody>
			
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>전화번호</th>
					<th>이메일</th>
					<th>우편번호 </th>
					<th>주소</th>
					</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text"></td>
					<td><input type="text" ></td>
					<td><input type="text"  name="zipNo" id="zipNo"></td>
					<td><input type="text"  name="roadFullAddr" id="roadFullAddr"></td>
				</tr>
			</tbody>
		</table>
	<button type="button" onClick="goPopup();">우편번호찾기</button>
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
