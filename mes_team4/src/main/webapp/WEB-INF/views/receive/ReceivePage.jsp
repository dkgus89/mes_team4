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
function showPopup() {
	window.open("recinsert","입고팝업","width=1200, height=300, top=200, left=200");
}
function updatePopup(cd) {
	 window.open("${pageContext.request.contextPath}/receive/recupdate?rec_schedule_cd="+cd,"recupdate","width=1400, height=300, top=200, left=200");
}
</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2> 자재입고관리 </h2><br>
	
		<div class="search">
		<form action="${pageContext.request.contextPath}/receive/recpage" method="get" >
			<select name="select" class="button2">
			<option value="" style="text-align:center">선택</option>
				<option value="rec_schedule_cd">입고코드</option>
				<option value="pchor_cd">발주/수주코드</option>
				<option value="product_cd_name">제품코드</option>
			</select>
			<input type="text" name="search" class="button2" style="width:200px">
			<input type="submit" class="button2" value="검색">
		</form>
	</div>
	
	<div class="wrap2">
	  <button class="button2" onclick="showPopup();">추가</button>
	  <button class="button2" onclick="chdelete();">삭제</button>
	 </div><br>
	 <br>
	 
	 <div>전체 ${pageDTO.count }건</div>
	 
	<form name="receiveList">
		<input type="hidden" value="">
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>선택</th>
					<th> </th>
					<th>입고코드</th>
					<th>입고창고</th>
					<th>발주/수주코드</th>
					<th>제품코드</th>
					<th>입고수량</th>
					<th>입고일자</th>
					<th>진행상태</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
			<c:if test="${pageDTO.count != 0 }">
			<c:forEach var="dto" items="${receiveList }" varStatus="status">
				<tr style="text-align:center; font-size: 0.9rem">
					<td><input type="checkbox" name="chbox" value="${dto.rec_schedule_cd}"></td>
					<td>${status.count + ((pageDTO.pageNum-1)*pageDTO.pageSize)}</td>
					<td>${dto.rec_schedule_cd }</td>
					<td>${dto.wh_cd } </td>
					<td>${dto.pchor_cd }</td>
					<td>${dto.product_cd_name }</td>
					<td>${dto.rec_count}</td>
					<td>${dto.rec_date }</td>
					<td>${dto.in_complete }</td>
					<td><input type="button" value="수정" onclick="updatePopup('${dto.rec_schedule_cd}');"></td>
				</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
		
	</form>
	
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/receive/recpage?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}">Prev</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/receive/recpage?pageNum=${i}&search=${pageDTO.search}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/receive/recpage?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}">Next</a>
</c:if>
	
<!-- 본문HTML 입력 끝-->
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->