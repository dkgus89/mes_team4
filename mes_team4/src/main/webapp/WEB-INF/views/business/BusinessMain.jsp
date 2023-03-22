<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../main/Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>
window.name ='parentPage';

function showPopup(){
    window.open("businessinsert","거래처팝업","width=800, height=400, top=200, left=200");
}
function updatePopup(){
    window.open("businessupdate","거래처수정팝업","width=800, height=400, top=200, left=200");
}

function allCheck(){
	var ac = document.myform.allcheck;
	var rc = document.myform.rowcheck;
	
	if(ac.checked == true){
		for(i=0; i<rc.length; i++){
			rc[i].checked=true;
		}
	}else {
		for(i=0;i<rc.length;i++){
			rc[i].checked=false;
		}
		
	}
}

</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>거래처 관리</h2><br>
	<div class="wrap2">
	  <button class="button2" onclick="showPopup();">추가</button>
	  <button class="button2" onclick="">삭제</button>
	 </div><br>
	 <br>
 
	<form method="post" name="myform">
<!-- 		<input type="hidden" value="">	 -->
		
		<table id="vendortable" class=" table table-striped" style="width:1000px;">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th><input type="checkbox" name="allcheck" onClick='allCheck()'></th>
					<th>코드</th>
					<th>구분</th>
					<th>업종유형</th>
					<th>거래처명</th>
					<th>전화번호</th>
					<th>대표이름</th>
					<th>비고</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="businessDTO" items="${businessList}">
			<tr>
				<td><input type="checkbox" id="checkbox" name="rowcheck"></td>
				<td>${businessDTO.business_cd}</td>
				<td>${businessDTO.business_dv}</td>
				<td>${businessDTO.business_type}</td>
				<td>${businessDTO.business_name}</td>
				<td>${businessDTO.business_tel}</td>
				<td>${businessDTO.business_ceo}</td>
				<td><input type="button" value="수정" onclick="updatePopup();"></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>	
	</form>	
	
	
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/business/businessmain?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/business/businessmain?pageNum=${i}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/business/businessmain?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[10페이지 다음]</a>
</c:if>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->