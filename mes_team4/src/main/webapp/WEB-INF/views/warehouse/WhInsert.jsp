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
<!-- 본문HTML 입력 시작 -->

    <form action="${pageContext.request.contextPath}/warehouse/insertPro" method="post">
	 창고코드 : <input type="text" name="id"><br>
	 창고명 : <input type="text" name="id"><br>
	 창고구분 : <input type="text" name="id"><br>
	 창고주소 : <input type="text" name="id"><br>
	 창고연락처 : <input type="text" name="id"><br>
	 창고관리자 : <input type="text" name="id"><br>
	 창고사용여부 : <input type="text" name="id"><br>
	 </form>
	 <div class="wrap2">
	 	<button class="button2">등록</button>
	 </div><br>

	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->