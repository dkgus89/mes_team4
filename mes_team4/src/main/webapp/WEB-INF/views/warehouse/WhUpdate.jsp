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
document.updateform.action="${pageContext.request.contextPath}/wh/whupdatePro";
document.updateform.submit();
setTimeout(function() { 
	opener.parent.location.reload();
	window.close();
	}, 200);
}

function rst(){
document.updateform.reset();
}
</script>

</head>
<body>

	
<!-- 본문HTML 입력 시작-->
<!-- <div id="contents"> -->
<!-- 	<h2 class="inserttitle">창고 수정</h2><br> -->
<!-- 	<div class="wrap2"> -->
<!-- 	  <button class="button2">수정</button> -->
<!-- 	  <button class="button2">초기화</button> -->
<!-- 	 </div><br>	 -->
	 
<%-- 	<form action="${pageContext.request.contextPath}/wh/whupdatePro" name="updateform" method="post"> --%>
 
<%-- 	 창고명 : <input type="text" name="wh_name" value="${whDTO.wh_name }"><br> --%>
<!-- 	 창고구분 : <label><input type="radio" name="wh_dv" value="0" checked="checked">완제품</label> -->
<!-- 	 		 <label><input type="radio" name="wh_dv" value="1">원자재</label><br> -->
<%-- 	 창고코드 : <input type="text" name="wh_cd" value="${whDTO.wh_cd }" readonly><br>		  --%>
<%-- 	 창고주소 : <input type="text" name="wh_addr" value="${whDTO.wh_addr }"><br> --%>
<%-- 	 창고연락처 : <input type="tel" name="wh_tel" value="${whDTO.wh_tel }"><br> --%>
<!-- 	 창고사용여부 : <label><input type="radio" name="wh_use" value="1" checked="checked">사용</label> -->
<!-- 	 		    <label><input type="radio" name="wh_use" value="0">미사용</label><br> -->
<%-- 	 적요 : <input type="text" name="remarks" value="${whDTO.remarks }" ><br> --%>
<!-- 	 </form> -->
	
<!-- </div> -->
	
	
<h2 class="inserttitle">창고 수정</h2><br>
	
	<form action="${pageContext.request.contextPath}/wh/whupdatePro" name="updateform" method="post" >
	
	<div class="wrap2">
		<input type="submit" class="button2" value="수정">
		<input type="reset" class="button2" value="초기화">
	 </div><br>
	 <br>
	
		<input type="hidden" value="">
		<table id="vendortable" class="table table-striped" style="width:1000px;">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>창고구분</th>
					<th>창고코드</th>
					<th>창고지역</th>
					
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>
					
					<select id="select1"  name="wh_dv" onchange="itemChange()">
						<option value="">선택해주세요</option>
						<option value="완제품">완제품</option>
						<option value="원자재">원자재</option>
					</select>
					</td>
					
					<td><input type="text" name="wh_cd"></td>
					
					<td>
					<select id="select2"  name="wh_addr">
						<option value="">구분을 선택하세요</option>
					</select>
					</td>
					
				</tr>
			</tbody>
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					
					<th>창고연락처</th>
					<th>창고사용여부</th>
					<th>적요</th>
					
					</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="wh_tel"></td>
					
					<td>
					<select name="wh_use">
						<option value="사용">사용</option>
						<option value="미사용">미사용</option>
					</select>
					</td>
					
					<td><input type="text"  class="address" name="remarks" size=40></td>
					
				</tr>
			</tbody>
		</table>

	</form>
<!-- 본문HTML 입력 끝-->
	
	
</body>
</html>
