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
function allCheck(){
	var ac = document.performlist.allcheck;
	var rc = document.performlist.rowcheck;
	if(ac.checked == true){
		for(i=0; i<rc.length; i++){
			rc[i].checked=true;}
	}else {
		for(i=0;i<rc.length;i++){
			rc[i].checked=false;}
	} }
	
	
</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2> 생산실적 </h2><br>
	<div id="table_search">
			<form action="${pageContext.request.contextPath}/perform/perform" method="get">
				<select name="selectcol">
							<option value="perform_cd">실적코드</option>
							<option value="instruction_code">작업지시코드</option>
							<option value="line_cd">라인코드</option>
							<option value="product_cd">품목코드</option>
      			</select>
				<input type="text" name="search" class="input_box">
				<input type="submit" value="search" class="button2">
			</form>
		</div>
		<br>
	<div class="wrap2">
		
	  <button class="button2" onclick="showPopup();">추가</button>
	  <button class="button2" onclick="chdelete();">삭제</button>
	  <br>
	 </div><br>
	 <br>
	 
	 
	<form name="performlist">
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th><input type="checkbox" name="allcheck" onClick='allCheck()'></th>
					<th>번호</th>
					<th>실적코드</th>
					<th>작업지시코드</th>
					<th>라인코드</th>
					<th>라인명</th>
					<th>품목코드</th>
					<th>품목명</th>
					<th>실적일자</th>
					<th>지시수량</th>
					<th>양품</th>
					<th>불량</th>
					<th>불량사유</th>
					<th>적요</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="dto" items="${PerformMap}" varStatus="status">

				<tr style="text-align: center; font-size: 0.9rem">
				<td><input type="checkbox" id="checkbox" name="rowcheck" value="${dto.perform_cd}"></td>
				<td>${status.count}</td>
				<td>${dto.perform_cd}</td>
    			<td>${dto.instruction_code}</td>
    			<td>${dto.line_cd}</td>
    			<td>${dto.line_name}</td>
    			<td>${dto.product_cd}</td> 
    			<td>${dto.product_name}</td> 			
    			<td>${dto.perform_date}</td>
    			<td>${dto.instruction_qt}</td>
    			<td>${dto.fair_prod}</td>
    			<td>${dto.defect_prod}</td>
    			<td>${dto.defect_remarks}</td>
    			<td>${dto.remarks}</td>
    			<td><button class="button2" onclick="showPopup2('${dto.perform_cd}');">수정</button></td>
    			</tr>
   			 
				</c:forEach>				
			</tbody>
		</table>		
		<div id="array"></div>	
	</form>
	
<!-- 페이징 -->
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/perform/perform?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&selectcol=${pageDTO.selectcol}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/perform/perform?pageNum=${i}&search=${pageDTO.search}&selectcol=${pageDTO.selectcol}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/perform/perform?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&selectcol=${pageDTO.selectcol}">[10페이지 다음]</a>
</c:if>	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->