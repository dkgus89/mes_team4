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

	<h2>품목정보관리 </h2><br>
	<div class="wrap2">
	  <button class="button2">수정</button>
	  <button class="button2">저장</button>
	  <button class="button2">삭제</button>
	 </div><br>
	 <br>

<form action="${pageContext.request.contextPath}/product/prodinsertPro" method="post">
제품코드 : <input type="text" name="product_cd_name"><br>
제품명 : <input type="text" name="product_name"><br>
제품구분 : <label><input type="radio" name="product_dv" value="1" > 원자재</label>
		 <label><input type="radio" name="product_dv" value="2"> 완제품<br></label>
거래처코드 : <input type="text" name="business_cd"><br>
규격 : <input type="text" name="product_size"><br>
재고단위 : <input type="text" name="product_unit"><br>
적요 : <input type="text" name="remarks"><br>
<input type="submit" value="완료">
</form>

	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->