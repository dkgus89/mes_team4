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
function DeliverUpdate(business_cd,order_cd,product_cd_name, emp_no){
	
	opener.setChildValue(business_cd,order_cd,product_cd_name, emp_no);

	window.close();
	
}

</script>
</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>수주현황</h2>
	<h4>전체 ${pageDTO.count}건 / <span style="color:red">생산전 ${pageDTO.pcount}건</span> /  <span style="color:blue">생산완료 ${pageDTO.fcount}건</span></h4>
	
<!-- 	<div class="wrap2"> -->
<!-- 	  <button class="button2" onclick="showPopup();">추가</button> -->
<!-- 	  <button class="button2" onclick="deleteValue();">생산현황?</button> -->
<!-- 	  <button class="button2" onclick="deleteValue();">삭제</button> -->
<!-- 	 </div><br> -->
	 <br>
 
	<form method="get" name="myform">
<!-- 		<input type="hidden" value="">	 -->
	<table id="vendortable" class=" table table-striped" style="width:1000px;">
		<thead>
			<tr style="text-align: center; font-size: 0.9rem">
<!-- 			<th><input type="checkbox" name="allcheck" onClick='allCheck()'></th> -->
			<th>수주코드</th>
			<th>거래처</th>
			<th>제품코드</th>
			<th>주문량</th>
			<th>수주등록날짜</th>
			<th>출하예정날짜</th>
			<th>담당자</th>
			<th>진행상황</th>
			<th>선택</th>
			<th></th>
			</tr>
		</thead>	
			
			<tbody>
		<c:choose>
			<c:when test="${not empty orderList}">
			<c:forEach var="orderDTO" items="${orderList}">
			<tr>
<%-- 			<td><input type="checkbox" id="checkbox" name="rowcheck" value="${orderDTO.order_cd}"></td> --%>
			<td>${orderDTO.order_cd}</td>
			<td>${orderDTO.business_cd}</td>
			<td>${orderDTO.product_cd_name}</td>
			<td>${orderDTO.order_count}</td>
			<td>${orderDTO.order_date}</td>
			<td>${orderDTO.deliver_date}</td>
			<td>${orderDTO.emp_no}</td>
			
			<c:choose>
			<c:when test="${orderDTO.con eq '생산전'}"><td><span style="color:red">${orderDTO.con}</span></td> </c:when>
			<c:when test="${orderDTO.con eq '생산완료'}"><td><span style="color:blue">${orderDTO.con}</span></td></c:when>
			<c:otherwise> ... </c:otherwise>
			</c:choose>
    			<td><button class="button2" onclick="DeliverUpdate('${orderDTO.business_cd}','${orderDTO.order_cd}','${orderDTO.product_cd_name}','${orderDTO.emp_no}');">선택</button></td>
    			
   			 
				</c:forEach>
			</c:when>
			</c:choose>
			
			</tbody>
		</table>
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
