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

<script type="text/javascript">
$(document).ready(function() { // j쿼리 시작
	// 셀렉트박스 선택 시 value 저장
	$(document).on('change', '.select-option', function(){
		let consumption_unit = $("option:selected", this).val();
		$(this).closest("td").find("#consumption_unit_arr").val(consumption_unit);
	});
	// 초기화 버튼
	$(document).on('click', '#resetBtn', function() {
		var cpListBtn = $('<button>').attr({
		    'type': 'button',
		    'id': 'cpListBtn'
		}).text('추가');
		 var rpListBtn = $('<button>').attr({
			    'type': 'button',
			    'id': 'rpListBtn'
			}).text('추가');
		 
		var cpTableTr = $('#cproductBody tr');
		cpTableTr.find('td:eq(0)').empty();
		cpTableTr.find('td:eq(1)').empty();
		cpTableTr.find('td:eq(0)').append(cpListBtn);
		
		var rpTableTr = $('#rproductBody tr');
		rpTableTr.find('td:eq(0)').empty();
		rpTableTr.find('td:eq(1)').empty();
		rpTableTr.find('td:eq(0)').append(rpListBtn);
		rpTableTr.find('input').val('');
	});
	
	// 입고리스트 팝업
	$(document).on('click', '#recListBtn', function() {
		var trIndex = $(this).parent().parent().index();
		var rec_schedule_cd = 'rec';
		
		var link = '${pageContext.request.contextPath}/rel/reclist?trIndex='+trIndex+'&rec_schedule_cd='+rec_schedule_cd;     
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
	var result = confirm("게시글을 수정하시겠습니까?");
	if (result == true){    
		document.getElementById('move').submit(); 
		alert("수정");
		setTimeout(function() { 
			opener.parent.location.reload();
			window.close();
			}, 300);
	} else {
		return false;
	}
}

function recListBtn(){
	var link = "${pageContext.request.contextPath}/rel/reclist";     
	var popupWidth = 1050;
	var popupHeight = 500;
	var popupX = (window.screen.width/2) - (popupWidth/2);
	var popupY= (window.screen.height/2) - (popupHeight/2);
	
  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
}

function setChildValue(rec_schedule_cd,wh_cd,product_cd_name,rec_count,pchor_cd){
	
    document.getElementById("rec_schedule_cd").value = rec_schedule_cd;
    document.getElementById("wh_cd").value = wh_cd;
    document.getElementById("product_cd_name").value = product_cd_name;
    document.getElementById("rec_count").value = rec_count;
    document.getElementById("pchor_cd").value = pchor_cd;
 

}
</script>


</head>
<body>

<div id="contents">	
<!-- 본문HTML 입력 시작-->
<h2 class="inserttitle">자재출고 등록</h2><br>
	
	<div class="wrap2">
	  <button class="button2" id="resetBtn">초기화</button>
	  <button class="button2" onclick="insertBtn();">등록</button>
	  <button class="button2" onclick="window.close();">닫기</button>
	 </div>
	 <br>
	 
	<button class="button2" onclick="recListBtn();" style="width:200px">입고목록</button>
	<br>

	<form id="move" action="${pageContext.request.contextPath}/rel/relupdatetPro" method="post" >
	
	<input type="hidden" value="${releaseDTO.rel_schedule_cd }" name="rel_schedule_cd">
	
		<table id="vendortable" class="table table-striped" style="width:1000px;">		
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>입고코드</th>
					<th>입고창고</th>
					<th>입고제품</th>
					<th>입고수량</th>
					<th>발주/수주코드</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="rec_schedule_cd" value="${receiveDTO.rec_schedule_cd}"></td>
					<td><input type="text" name="wh_cd" value="${receiveDTO.wh_cd}"></td>
					<td><input type="text" name="product_cd_name" value="${receiveDTO.product_cd_name}"></td>
					<td><input type="text" name="rec_count" value="${receiveDTO.rec_count}"></td>
					<td><input type="text" name="pchor_cd" value="${receiveDTO.pchor_cd}"></td>

				</tr>
			</tbody>	
			
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>출고일자</th>
					<th>출고수량</th>
					<th>적요</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="date" name="rel_date" value="${releaseDTO.rel_date }">></td>
					<td><input type="text" name="rel_count" value="${releaseDTO.rel_count }"></td>
					<td><input type="text"  class="remarks" name="remarks" size=40  value="${releaseDTO.remarks }"></td>
				</tr>
			</tbody>				
		</table>
	</form>
<!-- 본문HTML 입력 끝-->
</div>	
	
</body>
</html>