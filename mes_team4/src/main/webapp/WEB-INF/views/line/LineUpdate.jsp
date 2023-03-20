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
function fun1(){
	document.LineUpdate.action="${pageContext.request.contextPath}/line/lineupdatePro";
	document.LineUpdate.submit();
	setTimeout(function() { 
		opener.parent.location.reload();
		window.close();
		}, 100);
	}

</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

<h2> 생산설비 수정 </h2><br>
	<div class="wrap2">
	  
	 </div><br>
	 <br>
	 
	 
	<form name="LineUpdate" method="post">
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
					<td><input type="text" name="line_cd" value="${LineDTO.line_cd }"></td>
					<td><input type="text" name="line_name" value="${LineDTO.line_name }"></td>
					<td><input type="text" name="line_process" value="${LineDTO.line_process }"></td>
					<td><input type="text" name="line_sequence" value="${LineDTO.line_sequence }"></td>
					<td><input type="text" name="line_status" value="${LineDTO.line_status }"></td>
					<td><input type="text" name="remarks" value="${LineDTO.remarks }"></td>
				</tr>
				
			
			</tbody>
		</table>
				
		<div id="array"></div>
	
	<input type="submit" class="button2" onclick="fun1()" value="적용">
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->