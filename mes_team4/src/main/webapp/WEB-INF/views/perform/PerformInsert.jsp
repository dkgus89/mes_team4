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

	// jQuery 준비 => 대상.함수()
//  	$(document).ready(function(){
//  		alert("준비");
		//submit 버튼을 클릭했을때 전송되어지면 이벤트 onsubmit()
		// id="join" 폼태그 표시 => 전송
// 		$('#PI').submit(function(){
// 			alert("전송");
// 		// class="id" 표시 대상.함수()
// 			if($('#line_cd').val()==""){
// 				alert("라인코드를 입력하세요");
// 				$('#line_cd').focus();
// 				//대상 지정 * 전체, h1 태그, id=이름 #이름, class=이름 .
// // 				$('*').css('color','red');
// // 				$('form').css('color','blue');
// 				return false;
// 			}
// 		//class="pass"
// 			if($('.pass').val()==""){
// 				alert("비밀번호 입력하세요")
// 				$('.pass').focus();
// 				return false;
// 			}
// 			if($('.pass2').val()==""){
// 				alert("비밀번호2 입력하세요")
// 				$('.pass2').focus();
// 				return false;
// 			}
// 			if($('.pass').val() != $('.pass2').val()){
// 				alert("비밀번호 틀림");
// 				$('.pass2').focus();
// 				return false;		
// 			}
// 			if($('.name').val()==""){
// 				alert("이름 입력하세요")
// 				$('.name').focus();
// 				return false;
// 			}
// 			if($('.email').val()==""){
// 				alert("이메일 입력하세요")
// 				$('.email').focus();
// 				return false;
// 			}
// 			if($('.email').val() != $('.email2').val()){
// 				alert("이메일 틀림");
// 				$('.email2').focus();
// 				return false;		
// 			}
// 			if($('.email2').val()==""){
// 				alert("이메일2 입력하세요")
// 				$('.email2').focus();
// 				return false;
// 			}
//  		});
//  	});
function sub(){
	$(document).ready(function(){
// 	alert("준비");
		if($('#line_cd').val()==""){
			alert("라인코드를 입력하세요");
			$('#line_cd').focus();
			return false;
		}
		if($('#product_cd').val()==""){
			alert("품목코드를 입력하세요");
			$('#product_cd').focus();
			return false;
		}
		if($('#perform_date').val()==""){
			alert("실적일자를 입력하세요");
			$('#perform_date').focus();
			return false;
		}
		if($('#fair_prod').val()==""){
			alert("양품 수량을 입력하세요");
			$('#fair_prod').focus();
			return false;
		}
		if($('#defect_prod').val()==""){
			alert("불량 수량을 입력하세요");
			$('#defect_prod').focus();
			return false;
		}
		
	window.opener.name = "parentPage";
	document.PerformInsert.target="parentPage";
	document.PerformInsert.action="${pageContext.request.contextPath}/perform/performinsertpro";
	document.PerformInsert.submit();
	self.close();
	});
}
function rst(){
document.PerformInsert.reset();
}

$(document).ready(function () {
// 	alert($("#inst").val());
		$.ajax({
			url:'${pageContext.request.contextPath}/perform/callcd',
			data:{'ic':$("#inst").val()},
			success:function(result){
				  $('#line_cd').val(result);
			}
		});
		
		$.ajax({
			url:'${pageContext.request.contextPath}/perform/callcd2',
			data:{'ic':$("#inst").val()},
			success:function(result){
				  $('#product_cd').val(result);
			}
		});
		
		$("#inst").on("change", function(){
			$.ajax({
				url:'${pageContext.request.contextPath}/perform/callcd',
				data:{'ic':$("#inst").val()},
				success:function(result){
					  $('#line_cd').val(result);			
				}
			});
			
			$.ajax({
				url:'${pageContext.request.contextPath}/perform/callcd2',
				data:{'ic':$("#inst").val()},
				success:function(result){
					$('#product_cd').val(result);			
				}
			});			
		});
});
</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">생산실적 추가 </h2><br>
<!-- 	<div class="wrap2"> -->
<!-- 	<button class="button2" id="aj">ajax</button> -->
	<button class="button2" id="sub" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>
	
<!-- 	 </div><br> -->
	 <br><br>
	 
	 
	<form action="${pageContext.request.contextPath}/perform/performinsertpro" name="PerformInsert" id="PI" method="post">
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">					
					<th>작업지시코드</th>
					<th>라인코드</th>
					<th>품목코드</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><select name="instruction_code" id="inst">
							<c:forEach var="dto" items="${instMap}">					
								<option value="${dto.instruction_code}">${dto.instruction_code}</option>							
							</c:forEach>
      				</select></td>
    				<td><input type="text" name="line_cd" id="line_cd"></td>
    				<td><input type="text" name="product_cd" id="product_cd"></td>
    			</tr>

			</tbody>
		</table>
		
		<br>
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					
					<th>실적일자</th>
					<th>양품</th>
					<th>불량</th>
					<th>불량사유</th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="date" name="perform_date" id="perform_date" value=""></td>
    				<td><input type="text" name="fair_prod" id="fair_prod" value=""></td>
    				<td><input type="text" name="defect_prod" id="defect_prod" value=""></td>
    				<td><input type="text" name="defect_remarks" id="defect_remarks" value=""></td>
    				<td><input type="text" name="remarks" id="remarks" value=""></td>
    			</tr>

			</tbody>
		</table>
	
	</form>
	
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
