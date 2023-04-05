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
// function input1(order_cd,product_cd){
// 	opener.setChildValue(order_cd,product_cd);
// 	window.close();
// }

function input1(order_cd, product_name, order_count, rproduct_name, consumption, deliver_date){
	$(document).ready(function(){ //Jquery 시작
	// 선택 유효성 검사		
		var rt = null;
		$.ajax({ //ajax 시작
			type:"GET",
 			url:'${pageContext.request.contextPath}/inst/ordercheck',
 			async: false,
 			data:{'order':order_cd},
 			success:function(result){
//  				 if(result!=0) {
 				 if(result==0) {
 		              alert("이전에 이미 선택되었던 수주입니다.");
 		              rt=1;
 		          }
 			}
 		}); //ajax 끝
		if(rt==1){
			return false;
		}else{
	     	  // 유효성 검사 통과시 선택 진행
			  var result = confirm("이 행을 선택 하시겠습니까?");
			  if (result == true){
			  	  opener.setChildValue(order_cd, product_name, order_count, rproduct_name, consumption, deliver_date);
				  window.close();
			  } else {
			  return false;
			  }
		}
	}); //Jquery 끝
}


</script>
</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">수주현황</h2><br>
	<div class="wrap2">
	  
	 </div><br>
	 <br>
	 
	 
	<form name="instlist" method="get">
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped" style="width:1000px;">
		<thead>
			<tr style="text-align: center; font-size: 0.9rem">
<!-- 			<th><input type="checkbox" name="allcheck" onClick='allCheck()'></th> -->
			<th> </th>
			<th>수주코드</th>
			<th>거래처</th>
			<th>제품코드</th>
			<th>주문량</th>
			<th>수주등록날짜</th>
			<th>출하예정날짜</th>
			<th>담당자</th>
			<th>진행상황</th>
			<th></th>
			</tr>
		</thead>	

		<tbody>
		<c:choose>
			<c:when test="${not empty orderListMap}">
			<c:forEach var="dto" items="${orderListMap}" varStatus="sts">
			<tr>
<%-- 			<td><input type="checkbox" id="checkbox" name="rowcheck" value="${orderDTO.order_cd}"></td> --%>
			<td>${pageDTO.startRow+1 + sts.index}</td>
			<td>${dto.order_cd}</td>
			<td>${dto.business_cd}</td>
			<td>${dto.product_cd}</td>
			<td>${dto.order_count}</td>
			<td>${dto.order_date}</td>
			<td>${dto.deliver_date}</td>
			<td>${dto.emp_no}</td>
			
			<c:choose>
			<c:when test="${dto.con eq '생산전'}"><td><span style="color:red">${dto.con}</span></td> </c:when>
			<c:when test="${dto.con eq '생산완료'}"><td><span style="color:blue">${dto.con}</span></td></c:when>
			<c:otherwise> ... </c:otherwise>
			</c:choose>
			
			<td><button class="button2" onClick="input1('${dto.order_cd}','${dto.product_name}','${dto.order_count}','${dto.rproduct_name}','${dto.consumption}','${dto.deliver_date}');">선택</button></td>
			</tr>
			</c:forEach>
			</c:when>
         
        <c:otherwise>
            <tr>
            <td colspan="10" style="text-align: center;">등록된 데이터가 없습니다.</td>
            </tr>
        </c:otherwise>	
		</c:choose>
		</tbody>
			
	</table>	
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
