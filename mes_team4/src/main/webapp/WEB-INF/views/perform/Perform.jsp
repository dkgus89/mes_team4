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
function showPopup(){
    window.open("${pageContext.request.contextPath}/perform/performinsert","performinsert","width=1100, height=350, top=200, left=200");
}
function showPopup2(cd){
    window.open("${pageContext.request.contextPath}/perform/performupdate?perform_cd="+cd,"performupdate","width=1100, height=350, top=200, left=200");
}
function chdelete(){
	document.performlist.action="${pageContext.request.contextPath}/perform/performdelete";
	document.performlist.submit();
}
</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2> 생산실적 </h2><br>
	<div class="wrap2">
	  <button class="button2" onclick="showPopup();">추가</button>
	  <button class="button2" onclick="chdelete();">삭제</button>
	  
	 </div><br>
	 <br>
	 
	 
	<form name="performlist">
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>선택</th>
					<th>실적코드</th>
					<th>작업지시코드</th>
					<th>라인코드</th>
					<th>품목코드</th>
					<th>수주코드</th>
					<th>실적일자</th>
					<th>양품</th>
					<th>불량</th>
					<th>불량사유</th>
					<th>적요</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="PerformDTO" items="${PerformList }">

				<tr style="text-align: center; font-size: 0.9rem">
				<td><input type="checkbox" name="chbox" value="${PerformDTO.perform_cd}"></td>
				<td>${PerformDTO.perform_cd}</td>
    			<td>${PerformDTO.instruction_code}</td>
    			<td>${PerformDTO.line_cd}</td>
    			<td>${PerformDTO.product_cd}</td>
    			<td>${PerformDTO.order_cd}</td>    			
    			<td>${PerformDTO.perform_date}</td>
    			<td>${PerformDTO.fair_prod}</td>
    			<td>${PerformDTO.defect_prod}</td>
    			<td>${PerformDTO.defect_remarks}</td>
    			<td>${PerformDTO.remarks}</td>
    			<td><button class="button2" onclick="showPopup2('${PerformDTO.perform_cd}');">수정</button></td>
    			</tr>
   			 
				</c:forEach>				
			</tbody>
		</table>		
		<div id="array"></div>	
	</form>
	
<!-- 페이징 -->
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/perform/perform?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/perform/perform?pageNum=${i}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/perform/perform?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[10페이지 다음]</a>
</c:if>	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->