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
document.insertform.action="${pageContext.request.contextPath}/rel/relinsertPro";
document.insertform.submit();
setTimeout(function() { 
	opener.parent.location.reload();
	window.close();
	}, 300);
}

function goSubmit(){
// 	window.opener.name="paretPage";
	document.insertform.target="parentPage";
	document.insertform.action="${pageContext.request.contextPath}/rel/relinsertPro";
	document.insertform.submit();
	self.close();
}

function rst(){
document.insertform.reset();
}

// // 수량 버튼 조작
// function count(type)  {
//   // 결과를 표시할 element
//   const resultElement = document.getElementById('result');
  
//   // 현재 화면에 표시된 값
//   let number = resultElement.innerText;
  
//   // 더하기/빼기
//   if(type === 'plus') {
//     number = parseInt(number) + 1;
//   }else if(type === 'minus')  {
// 	  if(number > 0){
// 		  number = parseInt(number) - 1;
// 	  }
//   }
//   // 결과 출력
//   resultElement.innerText = number;
// }


// 거래처 리스트 팝업
function bnopenPop(){
	var popup = window.open('${pageContext.request.contextPath}/rel/bnlist', '거래처명리스트 팝업', 'width=500, height=500, top=200, left=200,scrollbars=yes');
}

// 사원명 리스트 팝업
function enopenPop(){
    var popup = window.open('${pageContext.request.contextPath}/rel/enlist', '사원명리스트 팝업', 'width=500, height=500, top=200, left=200,scrollbars=yes');
}

// 창고 리스트 팝업
function wnopenPop(){
    var popup = window.open('${pageContext.request.contextPath}/rel/wnlist', '창고명리스트 팝업', 'width=500, height=500, top=200, left=200,scrollbars=yes');
}

// 품목명 리스트 팝업
function pnopenPop(){
    var popup = window.open('${pageContext.request.contextPath}/rel/pnlist', '품목명리스트 팝업', 'width=500, height=500, top=200, left=200,scrollbars=yes');
}

</script>


</head>
<body>

<div id="contents">	
<!-- 본문HTML 입력 시작-->
<h2 class="inserttitle">자재출고 등록</h2><br>

	<form action="${pageContext.request.contextPath}/rel/relinsertPro" name="insertform" method="post" >
	<div class="wrap2">
		<input type="submit" class="button2" value="등록" onclick="sub()">
		<input type="reset" class="button2" value="초기화" onclick="rst()">
	 </div><br>
	 <br>
		<table id="vendortable" class="table table-striped" style="width:1000px;">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>거래처명</th>
					<th>담당자</th>
					<th>창고코드</th>
					<th>출고품목명</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
<!-- 					<input type="text" name="business_name" id="bInput"><input type="button" onclick="bnopenPop()" id="bnList" value="조회"></td> -->
					<td><select name ="business_name">
							<c:forEach var="dto" items="${instMap}">
							<option value="${dto.business_name }">${dto.business_name }</option>
							</c:forEach>
						</select></td>
					<td><input type="text" name="emp_name" id="eInput"><input type="button" onclick="enopenPop()" id="enList" value="조회"></td>
					<td><input type="text" name="emp_name" id="wInput"><input type="button" onclick="wnopenPop()" id="wnList" value="조회"></td>
					<td><input type="text" name="product_name" id="pInput"><input type="button" onclick="pnopenPop()" id="pnList" value="조회"></td>
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
					<td><input type="date" name="rel_date"></td>
					<td>
<!-- 						<input type="button" onclick='count("minus")' value="-"> -->
<!-- 							<div id="result" name="rel_count"></div> -->
<!-- 						<input type="button" onclick='count("plus")' value="+"> -->
							<input type="text" name="rel_count" placeholder="숫자만 입력하세요">
						
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
