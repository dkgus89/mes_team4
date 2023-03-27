<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../main/Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>
	$(document).ready(function() { // j쿼리 시작
	}); // j쿼리 끝
	
	// 소요량 등록 팝업
	function insert(){
	var link = "${pageContext.request.contextPath}/consmpt/insert";     
	var popupWidth = 900;
	var popupHeight = 700;
	var popupX = (window.screen.width/2) - (popupWidth/2);
	var popupY= (window.screen.height/2) - (popupHeight/2);
	
  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
	}
	
	// 체크박스 올체크
	function allChecking(){
	    var rowCheck = document.getElementsByName("rowCheck");
	    var allCheck = document.getElementById("allCheck");﻿
	    for (let checkbox of rowCheck){
	    	console.log("check");
	    	checkbox.checked = allCheck.checked;
	    }
	}
	
</script>
<!-- 자바스크립트 입력 끝-->


	
<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>소요량 관리 </h2><br>
	<div class="wrap2">
	  <button class="button2" onclick="insert();">추가</button>
	  <button class="button2" onclick="deleteValue();">삭제</button>
	</div><br>
	<br>
	 
	<form method="post" name="myform"> 
	
		<table id="vendortable" class=" table table-striped" style="width:1000px;">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th><input type="checkbox" id="allCheck" onclick="allChecking();"></th>
					<th>완제품코드</th>
					<th>품목명</th>
					<th>원자재코드</th>
					<th>품목명</th>
					<th>소요량</th>
					<th>단위</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
				<%-- <c:forEach var="orderDTO" items="${orderList}"> --%>
				<tr>
					<td><input type="checkbox" name="rowCheck" value=""></td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td><input type="button" value="수정" onclick="updatePopup('${orderDTO.order_cd}');"></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="rowCheck" value=""></td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td><input type="button" value="수정" onclick="updatePopup('${orderDTO.order_cd}');"></td>
				</tr>
				<%-- </c:forEach> --%>
			</tbody>
		</table>	

	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->
