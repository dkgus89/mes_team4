<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../main/Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>

function DeliverInsert(){
    window.open("${pageContext.request.contextPath}/deliver/insert","출하 등록","width=1200, height=300, top=200, left=200");
}

function DeliverUpdate(deliver_cd){
//     window.open("${pageContext.request.contextPath}/deliver/update?deliver_cd=deliver_cd","출하 수정","width=1200, height=300, top=200, left=200");
    window.open("${pageContext.request.contextPath}/deliver/update?deliver_cd="+deliver_cd,"출하 수정","width=1200, height=300, top=200, left=200");
//     "&business_cd="+business_cd+"&product_cd="+product_cd,
}

function DeliverDelete1() {
	document.deliverlist.action="${pageContext.request.contextPath}/deliver/deliverdelete";
	document.deliverlist.submit();
}

function allcheck() {
	var ac = document.deliverlist.allcheck;
	var rc = document.deliverlist.rowcheck;
	if(ac.checked == true){
		for(i=0; i<rc.length; i++){
			rc[i].checked=ture;}
		}else {
			for(i=0; i<rc.length; i++){
				rc[i].checked=false;}
			rc.checked=false;
		}	
	}

</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>출하 관리 </h2><br>
	<div class="wrap2">
	  <button class="button2" onclick="DeliverInsert();">추가</button>
	  <button class="button2">저장</button>
	  <button class="button2" onclick="DeliverDelete1()">삭제</button>
	  
	 </div><br>
	 <br>
	 
	 
	<form name="deliverlist" >
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.8rem">
					<th><input type="checkbox" name="allcheck" onClick="allcheck()"></th>
					<th>번호</th>
<!-- 					//<th>선택</th> -->
					<th>출하코드</th>
					<th>거래처코드</th>
					<th>품목코드</th>
					<th>수주코드</th>
					<th>출하일자</th>
					<th>출하량</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>		
				
				
<!-- 				<tr> -->
<!-- 					<td><input type="checkbox" id="checkbox"></td> -->
<!-- 					<td><input type="text" value="test1-1"></td> -->
<!-- 					<td><input type="text" value="test1-2"></td> -->
<!-- 					<td><input type="text" value="test1-3"></td> -->
<!-- 					<td><input type="text" value="test1-4"></td> -->
<!-- 					<td><input type="text" value="test1-5"></td> -->
<!-- 					<td><input type="text" value="test1-6"></td> -->
<!-- 					<td><input type="text" value="test1-7" size="3"></td> -->
					
<!-- 				</tr> -->
				
				<c:forEach var="DeliverDTO" items="${deliverList}" varStatus="status">

				<tr style="text-align: center; font-size: 0.9rem">
				<td><input type="checkbox" id="checkbox" name="rowcheck" value="${DeliverDTO.deliver_cd}"></td> 
				<td>${status.count + ((pageDTO.pageNum -1) * pageDTO.pageSize) }</td>
				
					
    			<td>${DeliverDTO.deliver_cd}</td>
				<td>${DeliverDTO.business_cd}</td>
    			<td>${DeliverDTO.product_cd}</td>
    			<td>${DeliverDTO.order_cd}</td>
    			<td>${DeliverDTO.deliver_date}</td>
    			<td>${DeliverDTO.deliver_count}</td>
    			<td><button class="button2" onclick="DeliverUpdate('${DeliverDTO.deliver_cd}','${DeliverDTO.business_cd}','${DeliverDTO.product_cd}');">수정</button></td>
    			
   			 
				</c:forEach>
			
			</tbody>
		</table>
		<button type="button" id="test">테스트</button>
		
		<div id="array"></div>
		
	<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }deliver/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">[10페이지 이전]	</a>
	</c:if>
	
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/deliver/list?pageNum=${i}&search=${pageDTO.search}">${i }</a>
	
	</c:forEach>
	
	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }deliver/list?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">Next</a>
	</c:if>
	
	
	
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->