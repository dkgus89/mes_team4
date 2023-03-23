<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- js파일 들어가는 곳 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<!-- js파일 들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->
<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script type="text/javascript">
	$(document).ready(function() { // j쿼리 시작
		// input 행 추가
		$('#rprBtn').click(function() {
		    var newRow = $('#rproductBody tr:first').clone();
		    newRow.find('input').val('');
		    $('#rproductBody').append(newRow);
		});
		//삭제버튼 클릭 시 행 삭제
		$('#rproductBody').on('click', '#deleteRow', function() {
			var row = $(this).closest('tr');
			if (row.index() > 0) { 
				row.remove();
			} else {
				alert('첫 번째 행은 삭제할 수 없습니다.');
			}
		});
	}); // j쿼리 끝
	
	function insertBtn(){
		alert("등록");
		opener.parent.location.reload();
		window.close();
	}
</script>
<!-- 자바스크립트 입력 끝-->


	
<!-- 본문HTML 입력 시작-->

	<h2>소요량 등록</h2>
	<div class="wrap2">
	  <button class="button2" onclick="insertBtn();">등록</button>
	  <button class="button2" onclick="window.close();">닫기</button>
	  
	 </div>
	 <br>
	 
	 
	<form action="" method="post">		
	
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
					<input type="hidden" value="test1">
					<td><input type="text" value="test1"></td>
					<td><input type="text" value="test2"></td>
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
					<input type="hidden" value="test1">
					<td><input type="text" name="" value=""></td>
					<td><input type="text" name="" value=""></td>
					<td><input type="text" name="" value=""></td>
					<td><input type="text" name="" value=""></td>
					<td><button type="button" id="deleteRow">삭제</button></td>
				</tr>
			</tbody>
			
		</table>
	</form>
	
	<button id="rprBtn">원자재 추가</button>
	
	
	
<!-- 본문HTML 입력 끝-->