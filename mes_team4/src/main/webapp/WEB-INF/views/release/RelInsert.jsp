<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<script type="text/javascript">
function sub(){
document.insertform.action="${pageContext.request.contextPath}/wh/whinsertPro";
document.insertform.submit();
setTimeout(function() { 
	opener.parent.location.reload();
	window.close();
	}, 300);
}

function goSubmit(){
// 	window.opener.name="paretPage";
	document.insertform.target="parentPage";
	document.insertform.action="${pageContext.request.contextPath}/wh/whinsertPro";
	document.insertform.submit();
	self.close();
}

function rst(){
document.insertform.reset();
}
</script>


</head>
<body>

<div id="contents">	
<!-- 본문HTML 입력 시작-->
<h2 class="inserttitle">자재출고 등록</h2><br>

	
	<form action="${pageContext.request.contextPath}/wh/whinsertPro" name="insertform" method="post" >
	<div class="wrap2">
		<input type="submit" class="button2" value="등록" onclick="sub()">
		<input type="reset" class="button2" value="초기화" onclick="rst()">
	 </div><br>
	 <br>
	
	
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped" style="width:1000px;">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>출고일자</th>
					<th>출고품목명</th>
					<th>출고창고</th>
					<th>출고수량</th>
					<th>출고진행상태</th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>
					<select  name="wh_dv">
						<option value="">선택해주세요</option>
						<option value="완제품">완제품</option>
						<option value="원자재">원자재</option>
					</select>
					</td>
					<td><input type="text" name="wh_name"></td>
					<td>
						<select name="wh_use">
							<option value="사용">진행중</option>
							<option value="미사용">미사용</option>
						</select>
					</td>
					<td><input type="tel" name="wh_tel"></td>
					<td>
						<select name="wh_addr">
							<option value="" selected>지역을 선택하세요</option>
							<option value='서울'>서울</option>
				            <option value='부산'>부산</option>
				            <option value='대구'>대구</option>
				            <option value='인천'>인천</option>
				            <option value='광주'>광주</option>
				            <option value='대전'>대전</option>
				            <option value='울산'>울산</option>
				            <option value='강원'>강원</option>
				            <option value='경기'>경기</option>
				            <option value='경남'>경남</option>
				            <option value='경북'>경북</option>
				            <option value='전남'>전남</option>
				            <option value='전북'>전북</option>
				            <option value='제주'>제주</option>
				            <option value='충남'>충남</option>
				            <option value='충북'>충북</option>
						</select>
					</td>
					<td><input type="text"  class="remarks" name="remarks" size=40></td>
				</tr>
			</tbody>				
		</table>

	</form>
<!-- 본문HTML 입력 끝-->
</div>	
	
</body>
</html>
