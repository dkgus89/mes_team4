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
	window.open("prodinsert","추가팝업","width=1400, height=300, top=200, left=200");
}
function chdelete() {
	document.productList.action="${pageContext.request.contextPath}/product/proddelete";
	document.productList.submit();
}
function updatePopup(cd) {
	 window.open("${pageContext.request.contextPath}/product/produpdate?product_cd_name="+cd,"produpdate","width=1400, height=300, top=200, left=200");
}
</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>품목정보관리</h2><br>
	
	<div class="search">
		<form action="${pageContext.request.contextPath}/product/prodpage" method="get" >
			<select name="select" class="button2">
			<option value="" style="text-align:center">선택</option>
				<option value="product_dv">제품구분</option>
				<option value="product_cd_name">제품코드</option>
				<option value="product_name">제품명</option>
			</select>
			<input type="text" name="search" class="button2" >
			<input type="submit" class="button2" value="검색">
		</form>
	</div>
	
	<div class="wrap2">
	  <button class="button2" onclick="showPopup();">추가</button>
	  <button class="button2" onclick="chdelete();">삭제</button>
	 </div><br>
	 <br>
	 
	 
	<form name="productList">
		<input type="hidden" value="">
		<table id="vendortable" class=" table table-striped" style="width:1100px;">
		
			<thead>
				<tr style="text-align:center; font-size: 0.9rem">
					<th>선택</th>
					<th>번호</th>
					<th>품목코드</th>
					<th>제품구분</th>
					<th>제품코드</th>
					<th>제품명</th>
					<th>거래처코드</th>
					<th>거래처명</th>
					<th>재고단위</th>
					<th>적요</th>
					<th>수정</th>
				</tr>
			</thead>

			<tbody>
			<c:if test="${pageDTO.count != 0 }">
					<c:forEach var="productDTO" items="${productList }" varStatus="status">
				<tr style="text-align:center; font-size: 0.9rem">
					<td><input type="checkbox" name="chbox" value="${productDTO.product_cd_name}"></td>
					<td>${status.count + ((pageDTO.pageNum-1)*pageDTO.pageSize)}</td>
					<td>${productDTO.product_cd }</td>
					<td>${productDTO.product_dv }</td>
					<td>${productDTO.product_cd_name }</td>
					<td>${productDTO.product_name }</td>
					<td>${productDTO.business_cd }</td>
					<td>${productDTO.business_name }</td>
					<td>${productDTO.product_unit }</td>
					<td>${productDTO.remarks }</td>
					<td><input type="button" value="수정" onclick="updatePopup('${productDTO.product_cd_name}');"></td>
				</tr>
					</c:forEach>
			</c:if>
			</tbody>
		</table>
	
	</form>
	
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/product/prodpage?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}">Prev</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/product/prodpage?pageNum=${i}&search=${pageDTO.search}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/product/prodpage?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}">Next</a>
</c:if>

<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->