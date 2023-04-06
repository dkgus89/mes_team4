<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		// 초기화 버튼
		$(document).on('click', '#resetBtn', function() {
			var bsListBtn = $('<button>').attr({
			    'type': 'button',
			    'id': 'bsListBtn'
			}).text('추가');
			var rpListBtn = $('<button>').attr({
				'type': 'button',
				'id': 'rpListBtn'
			}).text('추가');
			var emListBtn = $('<button>').attr({
			    'type': 'button',
			    'id': 'emListBtn'
			}).text('추가');
			 
			var pcTableTr = $('#purchaseBody tr');
			pcTableTr.find('td:eq(0)').empty();
			pcTableTr.find('td:eq(1)').empty();
			pcTableTr.find('td:eq(2)').empty();
			pcTableTr.find('td:eq(0)').append(bsListBtn);
			pcTableTr.find('td:eq(1)').append(rpListBtn);
			pcTableTr.find('td:eq(2)').append(emListBtn);
			pcTableTr.find('input').val('');

		});
		
		// 거래처 리스트 팝업
		$(document).on('click', '#bsListBtn', function() {
			var trIndex = $(this).parent().parent().index();
			
			var link = '${pageContext.request.contextPath}/purchase/bslist?trIndex='+trIndex;     
			var popupWidth = 500;
			var popupHeight = 700;
			var popupX = (window.screen.width/2) - (popupWidth/2) + 800;
			var popupY= (window.screen.height/2) - (popupHeight/2);
			
		  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
		});
	
		// 원자재 리스트 팝업
		$(document).on('click', '#rpListBtn', function() {
			var trIndex = $(this).parent().parent().index();
			var product_dv = 'rp';
			
			var link = '${pageContext.request.contextPath}/purchase/prlist?trIndex='+trIndex+'&product_dv='+product_dv;     
			var popupWidth = 500;
			var popupHeight = 700;
			var popupX = (window.screen.width/2) - (popupWidth/2) + 800;
			var popupY= (window.screen.height/2) - (popupHeight/2);
			
		  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
		});
		
		// 사원 리스트 팝업
		$(document).on('click', '#emListBtn', function() {
			var trIndex = $(this).parent().parent().index();
			
			var link = '${pageContext.request.contextPath}/purchase/emlist?trIndex='+trIndex;     
			var popupWidth = 500;
			var popupHeight = 700;
			var popupX = (window.screen.width/2) - (popupWidth/2) + 800;
			var popupY= (window.screen.height/2) - (popupHeight/2);
			
		  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
		});
	}); // j쿼리 끝
	function insertBtn(){
		// submit 전 제한 사항
		
		// 내용 제한 넘길 시 submit 진행
		var result = confirm("게시글을 등록하시겠습니까?");
		if (result == true){    
			document.getElementById('move').submit(); 
			alert("등록");
		} else {
			return false;
		}
	}
</script>
<!-- 자바스크립트 입력 끝-->
</head>
<body>

	
<!-- 본문HTML 입력 시작-->

	<h2>원자재 발주 등록</h2>
	<div class="wrap2">
	  <button class="button2" id="resetBtn">초기화</button>
	  <button class="button2" onclick="insertBtn();">등록</button>
	  <button class="button2" onclick="window.close();">닫기</button>
	</div>
	<br>

	<form id="move" action="${pageContext.request.contextPath}/purchase/insertPro" method="post">		
	<input type="hidden" value="">
	
		<br>
		<table id="purchase" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>거래처코드</th>
					<th>원자재코드</th>
					<th>담당자코드</th>
					<th>발주일자</th>
					<th>납품예정일</th>
					<th>발주량</th>
				</tr>
			</thead>
			
			<tbody id="purchaseBody">
				<tr>
					<td><button type="button" id="bsListBtn">추가</button></td>
					<td><button type="button" id="rpListBtn">추가</button></td>
					<td><button type="button" id="emListBtn">추가</button></td>
					<td><input type="date" name="purchase_date_st" value=""></td>
					<td><input type="date" name="purchase_due_st" value=""></td>
					<td><input type="text" name="purchase_count" value="" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
				</tr>
			</tbody>
		</table>
				
	</form>
	
<!-- 본문HTML 입력 끝-->
</body>
</html>