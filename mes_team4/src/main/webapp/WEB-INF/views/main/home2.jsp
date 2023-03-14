<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css2/ex15.html</title>
<!-- 	교재 p.277 실습  -->
<style type="text/css">
	#container {
		width : 1260px;
		margin : 20px auto;

	}
	
	#header {
		margin : 20px auto;
		padding : 20px;
		width: 1260px; height: 120px;
		background-color:#F6F6F6;
	}
	
	#sidebar1 {
		width: 250px; height: 600px;
		float : left;	
	}

	#contents {
	
		margin : 20px 20px;
		width : 940px; height: 600px;
		background-color: white;
		float : left;
		border-style : solid 0.5px;
		border-color: #E4E4E4;
		
	}
	
	#footer {
		margin : 20px auto;
		padding : 20px;
		width: 1260px; height : 100px;
		background-color:#F6F6F6;
		clear : left;
	}
	
	.main {
		margin : 40px auto;
		text-align: center;
		color : #787878;	
	}
	
	.footertext {
		margin : 40px auto;
		text-align: center;
		color : #787878;	
	}
	
 	*{
 		padding:0;margin:0
 	} 
 	
	li{list-style:none}
	
	a{font-size:16px;
	}
	
	.menu {
	  width: 250px;
	  overflow: hidden;
	  margin: 20px auto;
	}
	
	.menu > li {
	width: 100%;
 	text-align: center;
 	line-height: 40px;
	background-color: #F6F6F6; 
	}
	
	.menu a {
	  color: #545454;
	  text-decoration: none;
	}
	
	.submenu > li {
	  line-height: 50px;
	  background-color:#D2D2D2;
	}
	
	.submenu {
	  height: 0; /*ul의 높이를 안보이게 처리*/
	  overflow: hidden;
	}
	
	.menu > li:hover {
	  background-color:#C0C0C0;
	  transition-duration: 2s;
	}
	
	.menu > li:hover .submenu {

	  transition-duration: 1s;
	  }
	  
	  .wrap {
/* 	  height: 100%; */
 	  display: flex; 
	  flex-direction: row-reverse;
	  align-items: ;
/* 	  justify-content: center; */
	}

	.button {
	  width: 120px;
	  height: 45px;
 	  font-family: 'Roboto', sans-serif; 
	  font-size: 12px;
	  text-transform: uppercase;
	  letter-spacing: 2.5px;
	  font-weight: 500;
	  color: #000;
	  background-color: #fff;
	  border: none;
	  border-radius: 20px;
	  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
 	  transition: all 0.3s ease 0s; 
	  cursor: pointer;
	  outline: none;
	  }
	
	.button:hover {
	  background-color: #E4E4E4;
/* 	  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4); */
	  color: #fff;
	  transform: translateY(-7px);
	}
	
	.wrap2 {
/* 	  height: 100%; */
 	  display: flex; 
	  flex-direction: row-reverse;
	  align-items: ;
	}

	.button2 {
	  width: 80px;
	  height: 35px;
 	  font-family: 'Roboto', sans-serif; 
	  font-size: 13px;
	  text-transform: uppercase;
	  letter-spacing: 2.0px;
	  font-weight: 500;
	  color: #000;
	  background-color: #F6F6F6;
	  border: none;
	  border-radius: 8px;
	  box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.1);
 	  transition: all 0.3s ease 0s; 
	  cursor: pointer;
	  outline: none;
	  }
	
	.button2:hover {
	  background-color: #E4E4E4;
	  color: #fff;
	}
	
	
	
	body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
	}
	table {
	  border-collapse: separate;
	  border-spacing: 0;
	  width: 100%;
	}
	th,
	td {
	  padding: 6px 15px;
	}
	th {
	  background: #42444e;
	  color: #fff;
	  text-align: left;
	}
	tr:first-child th:first-child {
	  border-top-left-radius: 6px;
	}
	tr:first-child th:last-child {
	  border-top-right-radius: 6px;
	}
	td {
	  border-right: 1px solid #c6c9cc;
	  border-bottom: 1px solid #c6c9cc;
	}
	td:first-child {
	  border-left: 1px solid #c6c9cc;
	}
	tr:nth-child(even) td {
	  background: #eaeaed;
	}
	tr:last-child td:first-child {
	  border-bottom-left-radius: 6px;
	}
	tr:last-child td:last-child {
	  border-bottom-right-radius: 6px;
	}
</style>


<script >

	$(document).ready(function(){
		$('#test').on('click', function() {
			var checkbox = $('input[id=checkbox]:checked');
			var tr = checkbox.parent().parent();
			var td = tr.children();
			var name = td.eq(1).children().val();
			var type = td.eq(2).children().val();
			var number = td.eq(3).children().val();
			
			var tdArray = [];
			
			checkbox.each(function(i){
				tr = checkbox.parent().parent().eq(i);
				
				td = tr.children();
				name = td.eq(1).children().val();
				type = td.eq(2).children().val();
				number = td.eq(3).children().val();
				
				tdArray.push(name);
				tdArray.push(type);
				tdArray.push(number);
			});
			
			$('#array').html(tdArray);
			console.log(tdArray[0]);
			});
});

</script>

</head>
<body>
<div id="container">
<div id ="head">

<div class="wrap">
  <button class="button">홈</button>
  <button class="button">로그인</button>
  <button class="button">마이페이지</button>
  <button class="button">로그아웃</button>
</div>

</div>

<div id="header">
<h1 class="main">의약품 생산 MES프로그램 </h1>
</div>

<div id="sidebar1">
 <ul class="menu">
      <li>
        <a href="#">시스템관리</a>
        <ul class="submenu">
          <li><a href="home2.jsp">사용자관리</a></li>
          <li><a href="#">권한관리</a></li>
          <li><a href="#">코드관리</a></li>
        </ul>
      </li>
      <li>
        <a href="#">기준정보관리</a>
        <ul class="submenu">
          <li><a href="#">작업자관리</a></li>
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
        <a href="#">MENU4</a>
        <ul class="submenu">
          <li><a href="#">submenu01</a></li>
          <li><a href="#">submenu02</a></li>
          <li><a href="#">submenu03</a></li>
          <li><a href="#">submenu04</a></li>
          <li><a href="#">submenu05</a></li>
        </ul>
      </li>
      <li>
        <a href="#">MENU5</a>
        <ul class="submenu">
          <li><a href="#">submenu01</a></li>
          <li><a href="#">submenu02</a></li>
          <li><a href="#">submenu03</a></li>
          <li><a href="#">submenu04</a></li>
          <li><a href="#">submenu05</a></li>
        </ul>
      </li>
    </ul>
</div>


<div id="contents">
<h2>어떤메뉴인지 출력할 곳 : input없이 출력형식의 데이터만 있을경우 사용할 페이지</h2><br>
<div class="wrap2">
  <button class="button2">추가</button>
  <button class="button2">수정</button>
  <button class="button2">저장</button>
  <button class="button2">삭제</button>
  
 </div><br>
 <br>
 
 
<form method="post">
	<input type="hidden" value="">
	
	<table id="vendortable" class=" table table-striped" tabled-bordered"
		style="width : 100%; cellspacing : 0">
		<thead>
			<tr style="text-align: center; font-size: 0.9rem">
				<th>선택</th>
				<th>거래처명</th>
				<th>거래처유형</th>
				<th>사업자번호</th>
				<th>비고</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td><input type="checkbox" id="checkbox"></td>
				<td><input type="text" value="test1-1"></td>
				<td><input type="text" value="test1-2"></td>
				<td><input type="text" value="test1-3"></td>
				<td><input type="text" value="test1-4"></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="checkbox"></td>
				<td><input type="text" value="test2-1"></td>
				<td><input type="text" value="test2-2"></td>
				<td><input type="text" value="test2-3"></td>
				<td><input type="text" value="test2-4"></td>
			</tr>	
				<tr>
				<td><input type="checkbox" id="checkbox"></td>
				<td><input type="text" value="test3-1"></td>
				<td><input type="text" value="test3-2"></td>
				<td><input type="text" value="test3-3"></td>
				<td><input type="text" value="test3-4"></td>
			</tr>
		
		</tbody>
	</table>
	<button type="button" id="test">테스트</button>
	
	<div id="array"></div>


</form>



</div>



<div id="footer">
<h3 class="footertext">footer 내용 4조4조4조  </h3>
</div>


</div>
</body>
</html>