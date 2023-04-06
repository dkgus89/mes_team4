<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../main/Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->
<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>
	$(document).ready(function() { // j쿼리 시작
		// 셀렉트박스 선택 시 value 저장
		$("#select-menu").on("change", function(){
			let search_option = $("option:selected", this).val();
			$("#search_option").val(search_option);
		});	
	}); // j쿼리 끝
	
	// 발주 등록 팝업
	function insertFn(){
	var link = "${pageContext.request.contextPath}/purchase/insert";     
	var popupWidth = 1300;
	var popupHeight = 260;
	var popupX = (window.screen.width/2) - (popupWidth/2);
	var popupY= (window.screen.height/2) - (popupHeight/2);
	
  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
	}
	
	// 발주 수정 팝업
	function updateFn(purchase_cd){
	var link = "${pageContext.request.contextPath}/purchase/update?purchase_cd="+purchase_cd;     
	var popupWidth = 1300;
	var popupHeight = 260;
	var popupX = (window.screen.width/2) - (popupWidth/2);
	var popupY= (window.screen.height/2) - (popupHeight/2);
	
  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
	}
	
	// 발주 삭제 처리
	function deleteFn(){
		var link = "${pageContext.request.contextPath}/purchase/delete";     
		var checkedValue = [];
		var checkList = $("input[name='rowCheck']");
		for(var i=0; i<checkList.length; i++){
			if(checkList[i].checked){
				checkedValue.push(checkList[i].value);
			}
		}
		
		if (checkedValue.length==0) {
			alert("선택한 행이 없습니다.\n삭제할 행을 선택 후 삭제 버튼을 눌러주세요.");
			return false;
		} else {
			var result = confirm("선택한 행을 삭제하시겠습니까?");
			if(result) {
				$.ajax({ // ajex start
					url:'${pageContext.request.contextPath }/purchase/delete',
					type : 'POST',
					traditional : true,
					data: {checkedValue:checkedValue },
					success:function(response){
						if(response=="delete") {
							window.location.reload(true);
							alert("삭제 되었습니다.");
						} else {
							alert("실패");
						}
					}
				});// ajex end
			} else {
				return false;
			}
		}
		
	}
	
	// 체크박스 올체크
	function allChecking(){
	    var rowCheck = document.getElementsByName("rowCheck");
	    var allCheck = document.getElementById("allCheck");﻿
	    for (let checkbox of rowCheck){
	    	checkbox.checked = allCheck.checked;
	    }
	}
	
	// 진행상태 체크박스 value 전달
	function checkOnlyOne(element) {
	  const checkboxes = document.getElementsByName("com_sts");
	  
		  checkboxes.forEach((cb) => {
		      cb.checked = false;
		  });
		  
		  element.checked = true;
		  
		  var checkedValue = element.value;
		  var search_com = document.getElementById("search_com");
		  search_com.value = checkedValue;   
		  
	} 
</script>
<!-- 자바스크립트 입력 끝-->


	
<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>원자재 발주 관리 </h2><br>
	<div class="wrap2">
	  <button class="button2" id="insertBtn" onclick="insertFn();">추가</button>
	  <button class="button2" id="deleteBtn" onclick="deleteFn();">삭제</button>
	</div><br>
	<br>
	
	
	<div class ="search_wrap" id="table_search">
		<form action="${pageContext.request.contextPath}/purchase/list?search=${pageDTO.search}&search_option=${pageDTO.search_option}&search_com=${pageDTO.search_com}&start_date=${pageDTO.start_date}&end_date=${pageDTO.end_date}&start_due_date=${pageDTO.start_due_date}&end_due_date=${pageDTO.end_due_date}" method="get">		
			
			<input id="search_option" name="search_option" type="hidden" value="all">
			<input id="search_com" name="search_com" type="hidden" value="">
			
			발주일자 <input type="date" name="start_date" value=""> ~ <input type="date" name="end_date" value="">
			
			<select id="select-menu" class="button2">
			<option value="all">통합검색</option>
			<option value="bs">거래처</option>
			<option value="rp">원자재</option>
			<option value="em">담당자</option>			
			</select> 
			<input type="text" name="search" class="input_box" placeholder="품목명 또는 코드를 입력하세요." value="" size=60>
			<input type="submit" value="search" class="button2">
			
			<br>
			납품예정일 <input type="date" name="start_due_date" value=""> ~ <input type="date" name="end_due_date" value="">
			진행상황 전체<input type="checkbox" id="comAllCheck" name="com_sts" onclick='checkOnlyOne(this)' value=""> 완료<input type="checkbox" id="comCheck" name="com_sts" onclick='checkOnlyOne(this)' value="완료"> 미완료<input type="checkbox" id="comNotCheck" name="com_sts" onclick='checkOnlyOne(this)' value="미완료">
	
		</form>
	</div>
	
	<br>
	<br>
	<div>거래처 ${pageDTO.cd}현황</div>
	
		<table id="vendortable" class=" table table-striped" style="width:1000px;">
			
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th><input type="checkbox" id="allCheck" onclick="allChecking();"></th>
					<th> </th>
					<th>발주코드</th>
					<th>거래처코드</th>
					<th>원자재코드</th>
					<th>발주량</th>
					<th>발주일자</th>
					<th>납품예정일</th>
					<th>담당자코드</th>
					<th>담당자</th>
					<th>진행상황</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
			<c:choose>
			<c:when test="${not empty PurchaseListB}">
				<c:forEach var="dto" items="${PurchaseListB}" varStatus="sts"> 
			  		<tr>
	        		<td><input type="checkbox" name="rowCheck" value="${dto.purchase_cd }"></td>
	        		<td>${pageDTO.startRow+1+sts.index }</td>
	    			<td>${dto.purchase_cd}</td>
	    			<td>${dto.business_cd}</td>
		    		<td>${dto.rproduct_cd_name}</td>
		    		<td>${dto.purchase_count}</td>
		    		<td>${dto.purchase_date}</td>
		    		<td>${dto.purchase_due}</td> 
		    		<td>${dto.emp_no}</td>
		    		<td>${dto.emp_name}</td>
		    		<td>${dto.purchase_com}</td>
		    		<td><button class="button2" id="updateBtn" onclick="updateFn('${dto.purchase_cd}')">수정</button></td>
	  				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="11" style="text-align: center;">등록된 데이터가 없습니다.</td>
				</tr>
			</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		
	
	<div id="pagingControl">
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
			<a href="${pageContext.request.contextPath}/purchase/list?pageNum=${pageDTO.startPage-pageDTO.pageBlock}&search=${pageDTO.search}&search_option=${pageDTO.search_option}&search_com=${pageDTO.search_com}&start_date=${pageDTO.start_date}&end_date=${pageDTO.end_date}&start_due_date=${pageDTO.start_due_date}&end_due_date=${pageDTO.end_due_date}">Prev</a>
		</c:if>
		
		<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
			<a href="${pageContext.request.contextPath}/purchase/list?pageNum=${i}&search=${pageDTO.search}&search_option=${pageDTO.search_option}&search_com=${pageDTO.search_com}&start_date=${pageDTO.start_date}&end_date=${pageDTO.end_date}&start_due_date=${pageDTO.start_due_date}&end_due_date=${pageDTO.end_due_date}">${i}</a> 
		</c:forEach> 
		
		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
			<a href="${pageContext.request.contextPath}/purchase/list?pageNum=${pageDTO.startPage-pageDTO.pageBlock}&search=${pageDTO.search}&search_option=${pageDTO.search_option}&search_com=${pageDTO.search_com}&start_date=${pageDTO.start_date}&end_date=${pageDTO.end_date}&start_due_date=${pageDTO.start_due_date}&end_due_date=${pageDTO.end_due_date}">Next</a>
		</c:if>
	</div>
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->
