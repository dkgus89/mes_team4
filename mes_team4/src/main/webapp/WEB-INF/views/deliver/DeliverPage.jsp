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
    window.open("deliverpageinsert","팝업 테스트","width=1000, height=500, top=200, left=200");
}

</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>출하 관리 </h2><br>
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
					<th>수주번호</th>
					<th>SEQ</th>
					<th>수주일자</th>
					<th>납품예정일</th>
					<th>품번</th>
					<th>품명</th>
					<th>수주량</th> <br>
					<th>출하예정량</th>
					<th>과부족</th>
					<th>비고</th>
					<th>재고량</th>
					<th>출하량</th>
					<th>출하일자</th>
					<th>수주업체</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="checkbox" id="checkbox"></td>
					<td><input type="text" value="test1-1"></td>
					<td><input type="text" value="test1-2"></td>
					<td><input type="text" value="test1-3"></td>
					<td><input type="text" value="test1-4"></td>
					<td><input type="text" value="test1-5"></td>
					<td><input type="text" value="test1-6"></td>
					<td><input type="text" value="test1-7"></td>
					<td><input type="text" value="test1-8"></td>
					<td><input type="text" value="test1-9"></td>
					<td><input type="text" value="test1-10"></td>
					<td><input type="text" value="test1-11"></td>
					<td><input type="text" value="test1-12"></td>
					<td><input type="text" value="test1-13"></td>
					
				</tr>
				<tr>
					<td><input type="checkbox" id="checkbox"></td>
					<td><input type="text" value="test1-1"></td>
					<td><input type="text" value="test1-2"></td>
					<td><input type="text" value="test1-3"></td>
					<td><input type="text" value="test1-4"></td>
					<td><input type="text" value="test1-5"></td>
					<td><input type="text" value="test1-6"></td>
					<td><input type="text" value="test1-7"></td>
					<td><input type="text" value="test1-8"></td>
					<td><input type="text" value="test1-9"></td>
					<td><input type="text" value="test1-10"></td>
					<td><input type="text" value="test1-11"></td>
					<td><input type="text" value="test1-12"></td>
					<td><input type="text" value="test1-13"></td>
				</tr>	
					<tr>
					<td><input type="checkbox" id="checkbox"></td>
					<td><input type="text" value="test1-1"></td>
					<td><input type="text" value="test1-2"></td>
					<td><input type="text" value="test1-3"></td>
					<td><input type="text" value="test1-4"></td>
					<td><input type="text" value="test1-5"></td>
					<td><input type="text" value="test1-6"></td>
					<td><input type="text" value="test1-7"></td>
					<td><input type="text" value="test1-8"></td>
					<td><input type="text" value="test1-9"></td>
					<td><input type="text" value="test1-10"></td>
					<td><input type="text" value="test1-11"></td>
					<td><input type="text" value="test1-12"></td>
					<td><input type="text" value="test1-13"></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="checkbox"></td>
					<td><input type="text" value="test1-1"></td>
					<td><input type="text" value="test1-2"></td>
					<td><input type="text" value="test1-3"></td>
					<td><input type="text" value="test1-4"></td>
					<td><input type="text" value="test1-5"></td>
					<td><input type="text" value="test1-6"></td>
					<td><input type="text" value="test1-7"></td>
					<td><input type="text" value="test1-8"></td>
					<td><input type="text" value="test1-9"></td>
					<td><input type="text" value="test1-10"></td>
					<td><input type="text" value="test1-11"></td>
					<td><input type="text" value="test1-12"></td>
					<td><input type="text" value="test1-13"></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="checkbox"></td>
					<td><input type="text" value="test1-1"></td>
					<td><input type="text" value="test1-2"></td>
					<td><input type="text" value="test1-3"></td>
					<td><input type="text" value="test1-4"></td>
					<td><input type="text" value="test1-5"></td>
					<td><input type="text" value="test1-6"></td>
					<td><input type="text" value="test1-7"></td>
					<td><input type="text" value="test1-8"></td>
					<td><input type="text" value="test1-9"></td>
					<td><input type="text" value="test1-10"></td>
					<td><input type="text" value="test1-11"></td>
					<td><input type="text" value="test1-12"></td>
					<td><input type="text" value="test1-13"></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="checkbox"></td>
					<td><input type="text" value="test1-1"></td>
					<td><input type="text" value="test1-2"></td>
					<td><input type="text" value="test1-3"></td>
					<td><input type="text" value="test1-4"></td>
					<td><input type="text" value="test1-5"></td>
					<td><input type="text" value="test1-6"></td>
					<td><input type="text" value="test1-7"></td>
					<td><input type="text" value="test1-8"></td>
					<td><input type="text" value="test1-9"></td>
					<td><input type="text" value="test1-10"></td>
					<td><input type="text" value="test1-11"></td>
					<td><input type="text" value="test1-12"></td>
					<td><input type="text" value="test1-13"></td>
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