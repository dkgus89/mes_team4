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

</script>
<!-- 자바스크립트 입력 끝-->




	
	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>값 입력할 페이지 </h2><br>
	<div class="wrap2">
	  <button class="button2">등록</button>
	  <button class="button2">수정</button>
	  <button class="button2">삭제</button>
	  <button class="button2">조회</button>
	  
	 </div><br>
	 <br>
	 
	 
	<form method="post">
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>선택</th>
					<th>창고코드</th>
					<th>창고명</th>
					<th>창고구분</th>
					<th>창고주소</th>
					<th>창고연락처</th>
					<th>창고관리자</th>
					<th>창고사용여부</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="checkbox" id="checkbox"></td>
					<td>${WHDTO.wh_cd}</td>
					<td>${WHDTO.wh_name}</td>
					<td>${WHDTO.wh_dv}</td>
					<td>${WHDTO.wh_addr}</td>
					<td>${WHDTO.wh_tel}</td>
					<td>${WHDTO.emp_no}</td>
					<td>${WHDTO.wh_use}</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="checkbox"></td>
					<td><input type="text" value="test2-1"></td>
					<td><input type="text" value="test2-2"></td>
					<td><input type="text" value="test2-3"></td>
					<td><input type="text" value="test2-4"></td>
					<td><input type="text" value="test2-5"></td>
					<td><input type="text" value="test2-6"></td>
					<td><input type="text" value="test2-7"></td>
				</tr>	
				<tr>
					<td><input type="checkbox" id="checkbox"></td>
					<td><input type="text" value="test3-1"></td>
					<td><input type="text" value="test3-2"></td>
					<td><input type="text" value="test3-3"></td>
					<td><input type="text" value="test3-4"></td>
					<td><input type="text" value="test3-5"></td>
					<td><input type="text" value="test3-6"></td>
					<td><input type="text" value="test3-7"></td>
				</tr>
			
				
			
			</tbody>
		</table>
		<button type="button" id="test">테스트</button>
		
		<div id="array"></div>
	
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->