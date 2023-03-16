<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>
	
	
</script>
<!-- 자바스크립트 입력 끝-->



<div id="container">
	<div id="sidebar1">
	 <ul class="menu">
	      <li>
	        <a href="#">시스템관리</a>
	        <ul class="submenu">
	          <li><a href="home2.jsp">사용자관리</a></li>
	          <li><a href="#">권한관리</a></li>
	          <li><a href="#">코드관리</a></li>
	          <li><a href="#">정보관리</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">기준정보관리</a>
	        <ul class="submenu">
	          <li><a href="#">품목정보관리</a></li>
	          <li><a href="#">소요량관리</a></li>
	          <li><a href="#">설비정보관리</a></li>
	          <li><a href="#">거래처정보관리</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">영업관리</a>
	        <ul class="submenu">
	          <li><a href="#">수주등록</a></li>
	          <li><a href="#">수주관리</a></li>
	          <li><a href="#">출하등록</a></li>
	          <li><a href="#">출하관리</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">생산관리</a>
	        <ul class="submenu">
	          <li><a href="#">생산계획</a></li>
	          <li><a href="#">작업지시현황</a></li>
	          <li><a href="#">실적등록</a></li>
	          <li><a href="#">생산실적현황</a></li>
	          <li><a href="#">submenu05</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">자재관리</a>
	        <ul class="submenu">
	          <li><a href="#">자재입고관리</a></li>
	          <li><a href="#">자재출고관리</a></li>
	          <li><a href="#">자재재고현황</a></li>
	          <li><a href="#">자재발주관리</a></li>
	          <li><a href="#">submenu05</a></li>
	        </ul>
	      </li>
	    </ul>
	</div>
	
	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<div id ="homebutton">

	
	  <button class="button3"><img src="${pageContext.request.contextPath}/resources/image/icon3.png"><br>사용자관리</button>
	  <button class="button3"><img src="${pageContext.request.contextPath}/resources/image/icon4.png"><br>수주현황</button><br>
	  <br>
	  <button class="button3"><img src="${pageContext.request.contextPath}/resources/image/icon2.png"><br>생산현황</button>
	  <button class="button3"><img src="${pageContext.request.contextPath}/resources/image/icon1.png"><br>자재현황</button>
	  
	</div>

	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="Footer.jsp" />
<!-- 푸터 들어가는 곳 -->