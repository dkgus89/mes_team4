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
	$(document).ready(function(){
//	 	alert("준비");
			if($('#line_cd').val()==""){
				alert("라인코드를 선택하세요");
				$('#line_cd').focus();
				return false;
			}
			if($('#line_name').val()==""){
				alert("라인명를 입력하세요");
				$('#line_name').focus();
				return false;
			}
			if($('#line_process').val()==""){
				alert("공정을 입력하세요");
				$('#line_process').focus();
				return false;
			}
	
	window.opener.name = "parentPage";
	document.LineUpdate.target="parentPage";
	document.LineUpdate.action="${pageContext.request.contextPath}/line/lineupdatepro";
	document.LineUpdate.submit();
	self.close();
	});
}
function rst(){
document.LineUpdate.reset();
}
</script>


</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">생산설비 수정 </h2><br>
<!-- 	<div class="wrap2"> -->
	<button class="button2" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>	  
<!-- 	 </div><br> -->
	 <br><br>
	 
	 
	<form name="LineUpdate" method="post">
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>라인코드</th>
					<th>라인명</th>
					<th>공정</th>
					<th>가동상태</th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
				<tr><td><input type="text" name="line_cd" id="line_cd" value="${LineDTO.line_cd}"></td>
					<td><input type="text" name="line_name" id="line_name" value="${LineDTO.line_name}"></td>
					<td><input type="text" name="line_process" id="line_process" value="${LineDTO.line_process}"></td>
						
						<c:if test="${LineDTO.line_status==1}"><td><select name="line_status">
							<option value="1" selected>가동중</option>
							<option value="2">대기중</option>
							<option value="3">고장</option>
      					</select></td>
      					</c:if>
    					<c:if test="${LineDTO.line_status==2}"><td><select name="line_status">
							<option value="1">가동중</option>
							<option value="2" selected>대기중</option>
							<option value="3">고장</option>
      					</select></td>
      					</c:if>
    					<c:if test="${LineDTO.line_status==3}"><td><select name="line_status">
							<option value="1">가동중</option>
							<option value="2">대기중</option>
							<option value="3" selected>고장</option>
      					</select></td>
      					</c:if>    					
					<td><input type="text" name="remarks" value="${LineDTO.remarks}"></td>
				</tr>

			</tbody>
		</table>
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
