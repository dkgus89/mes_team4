<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<!-- js파일 들어가는 곳 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<!-- js파일 들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->
<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script type="text/javascript">
	$(document).ready(function() { // j쿼리 시작
		// newRow.find('input').val('');
		// 원자재 행 추가
		$('#addRowBtn').on('click', function() {
		    var newRow = $('#rproductBody tr:first').clone();
		    var rpListBtn = $('<button>').attr({
			    'type': 'button',
			    'id': 'rpListBtn'
			}).text('추가');
		    
		    $('#rproductBody').append(newRow);
		    $('#rproductBody tr:last-child td:eq(0)').empty();
		    $('#rproductBody tr:last-child td:eq(1)').empty();
		    $('#rproductBody tr:last-child td:eq(0)').append(rpListBtn);
		    
		});
	
		// 원자재 행 삭제
		$('#rproductBody').on('click', '#deleteRowBtn', function() {
			var row = $(this).closest('tr');
			if (row.index() > 0) { 
				row.remove();
			} else {
				alert('첫 번째 행은 삭제할 수 없습니다.');
			}     
		});
		
		// 완제품 리스트 팝업
		$(document).on('click', '#cpListBtn', function() {
			var trIndex = $(this).parent().parent().index();
			var product_dv = 'cp';
			
			var link = '${pageContext.request.contextPath}/consmpt/prlist?trIndex='+trIndex+'&product_dv='+product_dv;     
			var popupWidth = 500;
			var popupHeight = 700;
			var popupX = (window.screen.width/2) - (popupWidth/2);
			var popupY= (window.screen.height/2) - (popupHeight/2);
			
		  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
		});
		
		// 원자재 리스트 팝업
		$(document).on('click', '#rpListBtn', function() {
			var trIndex = $(this).parent().parent().index();
			var product_dv = 'rp';
			
			var link = '${pageContext.request.contextPath}/consmpt/prlist?trIndex='+trIndex+'&product_dv='+product_dv;     
			var popupWidth = 500;
			var popupHeight = 700;
			var popupX = (window.screen.width/2) - (popupWidth/2);
			var popupY= (window.screen.height/2) - (popupHeight/2);
			
		  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
		});
	}); // j쿼리 끝
	
	function insertBtn(){
		alert("등록");
		opener.parent.location.reload();
		window.close();
	}
</script>
<!-- 자바스크립트 입력 끝-->
</head>
<body>

	
<!-- 본문HTML 입력 시작-->

	<h2>소요량 등록</h2>
	<div class="wrap2">
	  <button class="button2" onclick="insertBtn();">등록</button>
	  <button class="button2" onclick="window.close();">닫기</button>
	</div>
	<br>

	<form action="" method="post">		
	<input type="hidden" value="">
		<div>제품 등록</div>
		<table id="cproduct" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>제품코드(+)</th>
					<th>품목명</th>
				</tr>
			</thead>
			
			<tbody id="cproductBody">
				<tr>
					<td><button type="button" id="cpListBtn">추가</button></td>
					<td></td>
				</tr>
			</tbody>
		</table>
			
		<div>원자재 등록</div>
		<table id="rproduct" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>원자재코드(+)</th>
					<th>품목명</th>
					<th>소요량</th>
					<th>단위</th>
					<th>삭제</th>
				</tr>
			</thead>
			
			<tbody id="rproductBody">
				<tr>
					<td><button type="button" id="rpListBtn">추가</button></td>
					<td></td>
					<td><input type="text" name="consumption" value=""></td>
					<td><input type="text" name="consumption_unit" value=""></td>
					<td><button type="button" id="deleteRowBtn">삭제</button></td>
				</tr>
			</tbody>
			
		</table>
		
	</form>
	
	<button id="addRowBtn">원자재 추가</button>
	
	
	
<!-- 본문HTML 입력 끝-->
</body>
</html>