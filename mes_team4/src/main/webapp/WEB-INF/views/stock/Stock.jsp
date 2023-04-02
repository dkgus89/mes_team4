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
function allCheck(){
	
	var ac = document.stocklist.allcheck;
	var rc = document.stocklist.rowcheck;
	if(ac.checked == true){
		for(i=0; i<rc.length; i++){
			rc[i].checked=true;}
	}else {
		for(i=0;i<rc.length;i++){
			rc[i].checked=false;}
	} 
}
</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2> 재고현황 </h2><br>
	<div id="table_search">
		<form action="${pageContext.request.contextPath}/stock/stock" method="get">
				<select name="select">
				<c:choose>
						<c:when test="${pageDTO.select == 'wh_cd'.toString()}">
							<option value="stock_cd">재고번호</option>
							<option value="wh_cd" selected>창고코드</option>
							<option value="rec_schedule_cd">입고예정코드</option>
							<option value="product_cd">품목코드</option>
						</c:when>
						<c:when test="${pageDTO.select == 'rec_schedule_cd'.toString()}">
							<option value="stock_cd">재고번호</option>
							<option value="wh_cd">창고코드</option>
							<option value="rec_schedule_cd" selected>입고예정코드</option>
							<option value="product_cd">품목코드</option>
						</c:when>
						<c:when test="${pageDTO.select == 'product_cd'.toString()}">
							<option value="stock_cd">재고번호</option>
							<option value="wh_cd">창고코드</option>
							<option value="rec_schedule_cd">입고예정코드</option>
							<option value="product_cd" selected>품목코드</option>
						</c:when>			
						<c:otherwise>
							<option value="stock_cd" selected>재고번호</option>
							<option value="wh_cd">창고코드</option>
							<option value="rec_schedule_cd">입고예정코드</option>
							<option value="product_cd">품목코드</option>
						</c:otherwise>
				</c:choose>			
      			</select>
				<input type="text" name="search" class="input_box" value="${pageDTO.search}">
				<input type="submit" value="search" class="button2">
		</form>
	</div>
	<br>	
	
	<div class="wrap2" style="float: left;">
	
	  <button class="button2" onclick="showPopup();">추가</button>
	  <button class="button2"  onclick="chdelete();">삭제</button>
	  
	 </div><br>
	 <br>
	 
	 
	<form name="stocklist">
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th><input type="checkbox" name="allcheck" onClick='allCheck()'></th>
					<th style="text-align: center; width: 25px;">번호</th>
					<th>재고번호</th>
					<th>창고코드</th>
					<th>창고이름</th>
					<th>입고예정코드</th>
					<th>입고예정일</th>
					<th>품목코드</th>
					<th>품목명</th>
					<th>재고수량</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="dto" items="${StockMap}" varStatus="status">

				<tr>				
				<td><input type="checkbox" id="checkbox" name="rowcheck" value="${dto.stock_cd}"></td>
				<td style="text-align: center;">${status.count + ((pageDTO.pageNum-1)*pageDTO.pageSize)}</td>
				<td>${dto.stock_cd}</td>
				<td>${dto.wh_cd}</td>
				<td>${dto.wh_name}</td>
				<td>${dto.rec_schedule_cd}</td>
				<td>${dto.rec_date}</td>
				<td>${dto.product_cd}</td>
				<td>${dto.product_name}</td>
				<td>${dto.stock_count}</td>    			
    			<td><button class="button2" onclick="showPopup2('${dto.stock_cd}');">수정</button></td>
    			</tr>
   			 
				</c:forEach>	
			</tbody>
		</table>		
		<div id="array"></div>	
	</form>
	
<!-- 페이징 -->
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/stock/stock?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&select=${pageDTO.select}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/stock/stock?pageNum=${i}&search=${pageDTO.search}&select=${pageDTO.select}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/stock/stock?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&select=${pageDTO.select}">[10페이지 다음]</a>
</c:if>	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->