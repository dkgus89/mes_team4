<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<!-- 자바스크립트 입력 시작-->
<script>



</script>
<!-- 자바스크립트 입력 끝-->


	<div id="contents">
<!-- 본문HTML 입력 시작-->
	<h2>거래처명</h2><br>
	
	
    <div class="search">
    <form action="${pageContext.request.contextPath}/rel/pnlist" method="get">
       <input type="text" name="search" class="button2">
       <input type="submit" class="button2" value="검색" >
     </form>  
    </div>
	 
	<form name="productlist">		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>품목명</th>
					<th>선택</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="productDTO" items="${pnameList }">
				<tr>
					<td>${productDTO.product_name}</td>
					<td>
					<button class="button2">선택</button>
					</td>
				</tr>
			</c:forEach>			
			</tbody>

		</table>
		
	</form>


<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/rel/pnlist?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/rel/pnlist?pageNum=${i}&search=${pageDTO.search}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/rel/pnlist?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}">[10페이지 다음]</a>
</c:if>
	
<!-- 본문HTML 입력 끝-->
</div>
	
</body>
</html>