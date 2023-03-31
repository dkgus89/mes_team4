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

<!-- 자바스크립트 입력 시작-->
<script>
function setParentText(){
	opener.document.getElementById("wInput").value = document.getElementById("wInput").value
	window.close();
}

$(document).ready(function() { // j쿼리 시작
	
	// Url값 전달받기
	var queryString = window.location.search;
	var urlParams = new URLSearchParams(queryString);
	var trIndex = urlParams.get('trIndex');
	var business_name = urlParams.get('business_name');
	
	// 선택한 제품값 넘기기			
		$(document).on('click', 'tr', function() {
			var tr = $(this);
			var td = tr.children();
			var tdArr = [];
			td.each(function(i){
                tdArr.push(td.eq(i).text());
            });
					
					if (insert) {
						var parentWindowTr = window.opener.$('#busbody tr').eq(trIndex);
						
						parentWindowTr.find('td:eq(0)').empty();
						parentWindowTr.find('td:eq(1)').empty();
						
						var input0 = $('<input>').attr({
						    'type': 'text',
						    'name': 'business_name_arr',
						    'readonly': true
						}).val(tdArr[0]);
						var input1 = $('<input>').attr({
						    'type': 'text',
						    'name': 'business_name_arr',
						    'readonly': true
						}).val(tdArr[1]);
						
						parentWindowTr.find('td:eq(0)').append(input0);
						parentWindowTr.find('td:eq(1)').append(input1);
						
						window.close();
					}
			
		});
	
}); // j쿼리 끝
</script>
<!-- 자바스크립트 입력 끝-->


	<div id="contents">
<!-- 본문HTML 입력 시작-->
	<h2>거래처명</h2><br>
	
	
    <div class="search">
    <form action="${pageContext.request.contextPath}/rel/bnlist" method="get">
       <input type="text" name="search" class="button2">
       <input type="submit" class="button2" value="검색" >
     </form>  
    </div>
	 
<!-- 	<form name="businesslist">		 -->
		<table id="bus" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>거래처명</th>
<!-- 					<th>선택</th> -->
				</tr>
			</thead>
			
			<tbody id="busbody">
			<c:forEach var="warehouseDTO" items="${wnameList }">
				<tr>
					<td>${warehouseDTO.wh_name}</td>
<!-- 					<td> -->
<%-- 					<button class="button2" id="bInput" value="${businessDTO.business_name}" onclick="setParentText()">선택</button> --%>
<!-- 					</td> -->
				</tr>
			</c:forEach>			
			</tbody>

		</table>
		
<!-- 	</form> -->


<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/rel/bnlist?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/rel/bnlist?pageNum=${i}&search=${pageDTO.search}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/rel/bnlist?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}">[10페이지 다음]</a>
</c:if>
	
<!-- 본문HTML 입력 끝-->
</div>
	
</body>
</html>