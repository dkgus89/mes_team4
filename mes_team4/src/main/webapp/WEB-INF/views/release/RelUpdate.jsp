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
document.getrel.action="${pageContext.request.contextPath}/rel/relupdatePro";
document.getrel.submit();
setTimeout(function() { 
	opener.parent.location.reload();
	window.close();
	}, 200);
}

function rst(){
document.getrel.reset();
}
</script>

</head>
<body>

<div id="contents">	
<!-- 본문HTML 입력 시작-->

<h2 class="updatetitle">자채출고 수정</h2><br>
	<div class="wrap2">
		<input type="submit" class="button2" value="수정" onclick="sub()">
		<input type="reset" class="button2" value="초기화">
	 </div><br>
	 <br>
	
	<form name="getrel" method="post" >
		<input type="hidden" value="${releaseDTO.rel_schedule_cd }" name="rel_schedule_cd">
	
		<table id="vendortable" class="table table-striped" style="width:1000px;">
			
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>거래처명</th>
					<th>창고</th>
					<th>출고품목명</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><select name ="business_cd" >
					<option value="${releaseDTO.business_cd } selected">${releaseDTO.business_cd }</option>
							<c:forEach var="dto" items="${binstMap}">
							<c:if test="${dto.business_cd != releaseDTO.business_cd }"></c:if>
							<option value="${dto.business_cd }">${dto.business_name}</option>
							</c:forEach>
						</select></td>
					<td>
						<select name ="wh_cd">
							<c:forEach var="dto" items="${winstMap}">
								<option value="${dto.wh_cd }">${dto.wh_name }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select name ="product_cd">
							<c:forEach var="dto" items="${pinstMap}">
								<option value="${dto.product_cd }">${dto.product_name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</tbody>	
			
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>출고일자</th>
					<th>출고수량</th>
					<th>적요</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="date" name="rel_date" value="${releaseDTO.rel_date}"></td>
					<td><input type="text" name="rel_count" placeholder="숫자만 입력하세요" value="${releaseDTO.rel_count}"></td>
					<td><input type="text"  class="remarks" name="remarks" size=40 value="${releaseDTO.remarks}"></td>
				</tr>
			</tbody>
			
		</table>
	</form>
<!-- 본문HTML 입력 끝-->
</div>	
	
</body>
</html>
