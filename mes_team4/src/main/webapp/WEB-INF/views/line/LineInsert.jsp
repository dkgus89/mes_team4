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

	<h2> 생산설비 추가 </h2><br>
	<div class="wrap2">
	  
	 </div><br>
	 <br>
	 
	 
	<form action="${pageContext.request.contextPath}/line/lineinsertpro" method="post">
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>라인코드</th>
					<th>라인명</th>
					<th>공정</th>
					<th>정렬순서</th>
					<th>가동상태</th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="text" name="line_cd" value=""></td>
					<td><input type="text" name="line_name" value=""></td>
					<td><input type="text" name="line_process" value=""></td>
					<td><input type="text" name="line_sequence" value=""></td>
					<td><input type="text" name="line_status" value=""></td>
					<td><input type="text" name="remarks" value=""></td>
				</tr>
				
			
			</tbody>
		</table>
				
		<div id="array"></div>
	
	<input type="submit" class="button2" value="등록">
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->