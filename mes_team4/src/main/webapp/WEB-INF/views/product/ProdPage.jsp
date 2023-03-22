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
	window.open("prodinsert","팝업테스트","width=500,height=500,top=200,left=200");
}
</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>품목정보관리</h2><br>
	<div class="wrap2">
	  <button class="button2" onclick="showPopup();">추가</button>
	  <button class="button2">수정</button>
	  <button class="button2">저장</button>
	  <button class="button2">삭제</button>
	 </div><br>
	 <br>
	 
	 
	<form method="post">
		<input type="hidden" value="">
		<table id="vendortable" class=" table table-striped">
		
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>제품코드</th>
					<th>제품명</th>
					<th>제품구분</th>
					<th>거래처코드</th>
					<th>규격</th>
					<th>재고단위</th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>${ProductDTO.product_cd }</td>
					<td>${ProductDTO.product_name }</td>
					<td>${ProductDTO.product_dv }</td>
					<td>${ProductDTO.business_cd }</td>
					<td>${ProductDTO.product_size }</td>
					<td>${ProductDTO.product_unit }</td>
					<td>${ProductDTO.product_remarks }</td>
				</tr>
			</tbody>
			
		</table>

	
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->