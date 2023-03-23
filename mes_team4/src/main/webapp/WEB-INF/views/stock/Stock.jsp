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
    window.open("${pageContext.request.contextPath}/stock/stockinsert","stockinsert","width=1000, height=250, top=200, left=200");
}
function showPopup2(cd){
    window.open("${pageContext.request.contextPath}/stock/stockupdate?stock_cd="+cd,"stockupdate","width=1000, height=250, top=200, left=200");
}
function chdelete(){
	document.stocklist.action="${pageContext.request.contextPath}/stock/stockdelete";
	document.stocklist.submit();
}
</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2> 재고현황 </h2><br>
	<div class="wrap2">
	  <button class="button2" onclick="showPopup();">추가</button>
	  <button class="button2"  onclick="chdelete();">삭제</button>
	  
	 </div><br>
	 <br>
	 
	 
	<form name="stocklist">
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>선택</th>
					<th>재고번호</th>
					<th>창고코드</th>
					<th>입고예정코드</th>
					<th>품목코드</th>
					<th>재고수량</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="StockDTO" items="${StockList}">

				<tr>				
				<td><input type="checkbox" name="chbox" value="${StockDTO.stock_cd}"></td>
				<td>${StockDTO.stock_cd}</td>
				<td>${StockDTO.wh_cd}</td>
				<td>${StockDTO.rec_schedule_cd}</td>
				<td>${StockDTO.product_cd}</td>
				<td>${StockDTO.stock_count}</td>    			
    			<td><button class="button2" onclick="showPopup2('${StockDTO.stock_cd}');">수정</button></td>
    			</tr>
   			 
				</c:forEach>	
			</tbody>
		</table>		
		<div id="array"></div>	
	</form>
	
<!-- 페이징 -->
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/stock/stock?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/stock/stock?pageNum=${i}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/stock/stock?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[10페이지 다음]</a>
</c:if>	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->