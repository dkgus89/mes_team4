<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script>
function DeliverUpdate(rel_count){
	
	opener.setChildValue2(rel_count);

	window.close();
	
}

</script>
</head>
<!-- 자바스크립트 입력 끝-->


	<div id="innerContents">
<!-- 본문HTML 입력 시작-->
	<h2>출고관리</h2><br>
	
	
    <div class="search">
    <form action="${pageContext.request.contextPath}/rel/relpage" method="get">
       <select name="select" class="button2">
       		<option value="wh_name">창고명</option>
       		<option value="product_name">출고품목명</option>
       </select>
       <input type="text" name="search" class="button2">
       <input type="submit" class="button2" value="검색" >
     </form>  
    </div>

	
	<div class="wrap2">
	 </div><br>
	 <br>
	 
	<div>전체 ${pageDTO.count }건</div>
	<form name="rellist">
<!-- 		<input type="hidden" value=""> -->
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>출고코드</th>
					<th>출고창고</th>
					<th>출고품목명</th>
					<th>출고일자</th>
					<th>출고수량</th>
					<th>적요</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="dto" items="${relList }">
				<tr>
					<td>${dto.rel_schedule_cd}</td>
					<td>${dto.wh_name}</td>
					<td>${dto.product_name}</td>
					<td>${dto.rel_date}</td>
					<td>${dto.rel_count }</td>
					<td>${dto.remarks}</td>
					<td>
					<button class="button2" onclick="DeliverUpdate('${dto.rel_count}');">선택</button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
	</form>


<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/rel/relpage?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/rel/relpage?pageNum=${i}&search=${pageDTO.search}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/rel/relpage?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}">[10페이지 다음]</a>
</c:if>
<!-- 본문HTML 입력 끝-->
	</div>
<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../main/Footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->