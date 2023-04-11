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
<script type="text/javascript">
// 등록
function sub(){
	$(document).ready(function(){
		// submit 유효성 검사
		var telCheck=RegExp(/^[0-9]{9,11}$/);
		var rt = null;
		var result = confirm("게시글을 등록하시겠습니까?");
		if (result == true){ 
			$.ajax({ //ajax 시작
				type:"GET",
	 			url:'${pageContext.request.contextPath}/wh/whcheck',
	 			async: false,
	 			data:{'wh':$('#wh_name').val()},
	 			success:function(result){
	 				 if(result!=0) {
	 		              alert("이미 존재하는 창고이름입니다.");
	 		             $('#wh_name').focus();
	 		              rt=1;
	 		          }
	 			}
	 		}); //ajax 끝
			if(rt==1){
				return false;
			}	
			if($('#wh_dv').val()==""){
				alert("창고구분을 입력하세요");
				$('#wh_dv').focus();
				return false;
			}
			if($('#wh_name').val()==""){
				alert("창고이름을 입력하세요");
				$('#wh_name').focus();
				return false;
			}
			if($('#wh_use').val()==""){
				alert("창고사용여부를 입력하세요");
				$('#wh_use').focus();
				return false;
			}
			if($('#wh_tel').val()==""){
				alert("창고연락처를 입력하세요");
				$('#wh_tel').focus();
				return false;
			}
			if(!telCheck.test($('.wh_tel').val())){
	        	  alert("9~11자 숫자만 입력하세요");
	        	  $('.wh_tel').focus();
	        	  return false;
	          }
			if($('#wh_addr').val()==""){
				alert("창고지역을 입력하세요");
				$('#wh_addr').focus();
				return false;
			}
			
			window.opener.name = "parentPage";
			document.insertwh.target="parentPage";
			document.insertwh.action="${pageContext.request.contextPath}/wh/whinsertPro";
			document.insertwh.submit();
			self.close();
		} else {
			return false;
		}
	});
	
}

// 초기화
function rst(){
	// 초기화 유효성 검사
	var result = confirm("초기화 하시겠습니까?");
	if (result == true){    
		document.insertwh.reset();
	} else {
		return false;
	}
}
</script>


</head>
<body>

<div id="List_wrap">	
<!-- 본문HTML 입력 시작-->
<h2 class="inserttitle">창고 등록</h2><br>

	<div class="wrap2">
	  <button class="button2" onclick="sub()">등록</button>
	  <button class="button2" onclick="rst()">초기화</button>
	  <button class="button2" onclick="window.close();">닫기</button>
	 </div><br>
	 <br>
	
	<form id="move" action="${pageContext.request.contextPath}/wh/whinsertPro" name="insertwh" method="post" >
		<input type="hidden" value="">
		
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
					<td>
					<select  name="wh_dv" class="wh_dv" id="wh_dv">
						<option value="">선택해주세요</option>
						<option value="완제품">완제품</option>
						<option value="원자재">원자재</option>
					</select>
					</td>
					<td>
					<input type="text" name="wh_name" id="wh_name">
<!-- 					<input type="button" value="중복체크" class="dup" onclick="check()"><br> -->
<!-- 					<div class="divresult">창고이름 중복체크 결과</div><br></td> -->
					<td>
						<select name="wh_use" id="wh_use">
						<option value="">선택해주세요</option>
							<option value="사용">사용</option>
							<option value="미사용">미사용</option>
						</select>
					</td>
					<td><input type="tel" name="wh_tel" id="wh_tel" class="wh_tel" placeholder="숫자만 입력하세요"></td>
					<td>
						<select name="wh_addr" id="wh_addr" >
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