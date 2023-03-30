<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../main/Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->
<link href="${pageContext.request.contextPath}/resources/css/Consumption.css" rel="stylesheet" type="text/css">
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
	
	<div class ="wrap2" id="table_search">
		<form action="${pageContext.request.contextPath}/consmpt/list" method="get">
			<input type="text" name="search" class="input_box" placeholder="검색하세요" value="" size=60>
			<input type="submit" value="search" class="button2">
		</form>
	</div>
	
	<form method="post">
	
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
					
					<th>등록일</th>
					<th>수정일</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
			
				<c:set var="count" value="-1"></c:set>
				<c:set var="current" value="-1"></c:set>
				
				<c:forEach var="dto" items="${rprConsmptList }"> 
				<c:set var="current" value="${current+1 }"></c:set>
				
  				<tr>
  				<c:if test="${fn:contains(pageDTO.showTd, current)}">
  					<c:set var="count" value="${count+1 }"></c:set>
        			<td rowspan="${pageDTO.rowcolsTd.get(count) }"><input type="checkbox" name="rowCheck" value=""></td>
    				<td rowspan="${pageDTO.rowcolsTd.get(count) }">${dto.cproduct_cd_name}</td>
    				<td rowspan="${pageDTO.rowcolsTd.get(count) }">${dto.cproduct_name}</td>
    			</c:if>
    			
	    			<td>${dto.rproduct_cd_name}</td>
	    			<td>${dto.rproduct_name}</td>
	    			<td>${dto.consumption}</td>
	    			<td>${dto.consumption_unit}</td> 
	    			
	    		<c:if test="${fn:contains(pageDTO.showTd, current)}">
	    			<td rowspan="${pageDTO.rowcolsTd.get(count) }">${dto.insert_date}</td>
	    			<td rowspan="${pageDTO.rowcolsTd.get(count) }">${dto.update_date}</td>
	    			<td rowspan="${pageDTO.rowcolsTd.get(count) }"><input type="button" value="수정" onclick="updatePopup('${orderDTO.order_cd}');"></td>
	    		</c:if>
  				</tr>
  				
				</c:forEach>
				
			</tbody>
		</table>
	

	</form>
	
	<div id="pagingControl">
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
			<a href="${pageContext.request.contextPath}/consmpt/cplist?pageNum=${pageDTO.startPage-pageDTO.pageBlock}&search=">Prev</a>
		</c:if>
		
		<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
			<a href="${pageContext.request.contextPath}/consmpt/cplist?pageNum=${i}&search=">${i}</a> 
		</c:forEach> 
		
		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
			<a href="${pageContext.request.contextPath}/consmpt/cplist?pageNum=${pageDTO.startPage+pageDTO.pageBlock}&search=">Next</a>
		</c:if>
	</div>
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->
