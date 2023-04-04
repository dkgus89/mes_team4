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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script>
function input1(instruction_code,line_cd,product_cd,instruction_qt){
	$(document).ready(function(){
	// 선택 유효성 검사
		
		var rt = null;
		$.ajax({
			type:"GET",
 			url:'${pageContext.request.contextPath}/perform/instcheck',
 			async: false,
 			data:{'inst':instruction_code},
 			success:function(result){
//	 				if(result=="중복"){
//	 					self.close();
//	 				}
//	 				$('#line_cd').val(result);
 				 if(result!=0) {
 		              alert("이전에 이미 선택되었던 작업지시입니다.");
 		              rt=1;
 		          }
 			}
 		});
		if(rt==1){
			return false;
		}else{
			  var result = confirm("이 행을 선택 하시겠습니까?");
			  if (result == true){
			  	  opener.setChildValue(instruction_code,line_cd,product_cd,instruction_qt);
				  window.close();
			  } else {
			  return false;
			  }
		}
	});
}

</script>
</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">작업지시현황 </h2><br>
	<div class="wrap2">
	  
	 </div><br>
	 <br>
	 
	 
	<form name="instlist" method="get">
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>수주코드</th>
					<th>작업지시코드</th>
					<th>품목코드</th>
					<th>지시수량</th>
					<th>소요량1</th>
					<th>소요량2</th>
					<th>라인코드</th>
					<th>생산지시일자</th>
					<th>작업지시상태</th>
					<th>선택</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var ="instructionDTO" items="${instructionList}">
					<tr><td>${instructionDTO.order_cd}</td>
						<td>${instructionDTO.instruction_code}</td>
						<td>${instructionDTO.product_cd}</td>
						<td>${instructionDTO.instruction_qt}</td>
						<td>"${instructionDTO.rpname1} : " + "${instructionDTO.consumption1}" </td>
						<td>"${instructionDTO.rpname2} : " + "${instructionDTO.consumption2}" </td>
						<td>${instructionDTO.line_cd}</td>
						<td>${instructionDTO.instruction_date}</td>
						<td>${instructionDTO.instruction_state}</td>
						<td><button class="button2" onClick="input1('${instructionDTO.instruction_code}','${instructionDTO.line_cd}','${instructionDTO.product_cd}','${instructionDTO.instruction_qt}');">선택</button></td>
				</c:forEach>

			</tbody>
		</table>
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
