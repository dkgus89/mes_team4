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

<div id="contents">	
<!-- 본문HTML 입력 시작-->

<h2 class="updatetitle">창고 수정</h2><br>
	<div class="wrap2">
		<input type="submit" class="button2" value="수정" onclick="sub()">
		<input type="reset" class="button2" value="초기화">
	 </div><br>
	 <br>
	
	<form action="${pageContext.request.contextPath}/wh/whupdatePro" name="updateform" method="post" >
	<input type="hidden" value="${whDTO.wh_cd }" name="wh_cd">
	
		<table id="vendortable" class="table table-striped" style="width:1000px;">
			
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>창고구분</th>
					<th>창고이름</th>
					<th>창고사용여부</th>
					<th>창고연락처</th>
					<th>창고지역</th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
<%-- 				<c:if test="${whDTO.wh_dv=='완제품'}"> --%>
<!-- 					<td> -->
<!-- 					<select id="select1"  name="wh_dv"> -->
<!-- 						<option value="완제품" selected>완제품</option> -->
<!-- 						<option value="원자재">원자재</option> -->
<!-- 					</select> -->
<!-- 					</td> -->
<%-- 					</c:if> --%>
<%-- 					<c:if test="${whDTO.wh_dv=='원자재'}"> --%>
<!-- 					<td> -->
<!-- 					<select id="select1"  name="wh_dv"> -->
<!-- 						<option value="완제품" >완제품</option> -->
<!-- 						<option value="원자재" selected>원자재</option> -->
<!-- 					</select> -->
<!-- 					</td> -->
<%-- 					</c:if> --%>
					<td><input type="text" name="wh_dv" value="${whDTO.wh_dv }" readonly></td>
					<td><input type="text" name="wh_name" value="${whDTO.wh_name }"></td>
					<c:if test="${whDTO.wh_use=='사용'}">
					<td>
					<select name="wh_use">
							<option value="사용" selected>사용</option>
							<option value="미사용">미사용</option>
						
					</select>
					</td>
					</c:if>
					<c:if test="${whDTO.wh_use=='미사용'}">
					<td>
					<select name="wh_use">
							<option value="사용" >사용</option>
							<option value="미사용" selected>미사용</option>
					</select>
					</td>
					</c:if>
						
					<td><input type="tel" name="wh_tel" value="${whDTO.wh_tel }"></td>
					<c:if test ="${whDTO.wh_addr=='서울' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='부산' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='대구' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='인천' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='광주' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='대전' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='울산' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='강원' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='경기' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='경남' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='경북' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='전남' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='전북' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='제주' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='충남' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
				<c:if test ="${whDTO.wh_addr=='충북' }">
					<td><input type="text" name="wh_addr" value="${whDTO.wh_addr }" readonly></td>
				</c:if>
								
					<td><input type="text"  class="remarks" name="remarks" value="${whDTO.remarks }" size=40></td>
				</tr>
			</tbody>
			
		</table>
	</form>
<!-- 본문HTML 입력 끝-->
</div>	
	
</body>
</html>
