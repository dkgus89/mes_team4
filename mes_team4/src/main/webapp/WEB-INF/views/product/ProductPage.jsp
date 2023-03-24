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
	window.open("prodinsert","추가팝업","width=400,height=400,top=200,left=200");
}
function chdelete() {
	document.productList.action="${pageContext.request.contextPath}/product/productdelete";
	document.productList.submit();
}
</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>품목정보관리</h2><br>
	<div class="wrap2">
	  <button class="button2" onclick="showPopup();">추가</button>
	  <button class="button2" onclick="chdelete();">삭제</button>
	 </div><br>
	 <br>
	 
	 
	<form name="productList">
		<input type="hidden" value="">
		<table id="vendortable" class=" table table-striped">
		
			<thead>
				<tr style="text-align:center; font-size: 0.9rem">
					<th style="text-align:center">선택</th>
					<th style="text-align:center">제품구분</th>
					<th style="text-align:center">제품코드</th>
					<th style="text-align:center">제품명</th>
					<th style="text-align:center">거래처코드</th>
					<th style="text-align:center">규격</th>
					<th style="text-align:center">재고단위</th>
					<th style="text-align:center">적요</th>
					<th style="text-align:center">수정</th>
				</tr>
			</thead>

			<tbody>
					<c:forEach var="productDTO" items="${productList }">
				<tr style="text-align:center; font-size: 0.9rem">
				<td><input type="checkbox" name="chbox" value="${productDTO.product_cd_name}"></td>
					<td>${productDTO.product_dv }</td>
					<td>${productDTO.product_cd_name }</td>
					<td>${productDTO.product_name }</td>
					<td>${productDTO.business_cd }</td>
					<td>${productDTO.product_size }</td>
					<td>${productDTO.product_unit }</td>
					<td>${productDTO.remarks }</td>
					<td><button class="button2" onclick="updatePopup();">수정</td>
				</tr>
					</c:forEach>
			</tbody>
		</table>
	
	</form>
	
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/product/prodpage?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/product/prodpage?pageNum=${i}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/product/prodpage?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[10페이지 다음]</a>
</c:if>

<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->