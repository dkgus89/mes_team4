<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../main/Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>
function showPopup(){
    window.open("${pageContext.request.contextPath}/inst/instinsert","instinsert","width=1400, height=350, top=200, left=200");
}
function showPopup2(cd){
    window.open("${pageContext.request.contextPath}/inst/instupdate?instruction_code="+cd,"instupdate","width=1100, height=350, top=200, left=200");
}
function showPopup3(ef){
    window.open("${pageContext.request.contextPath}/inst/instcontent?instruction_code="+ef,"instcontent","width=1100, height=800, top=200, left=200");
}

function chdelete(){
	// 삭제 유효성 검사
	var result = confirm("삭제하시겠습니까?");
	if (result == true){    
		document.instlist.action="${pageContext.request.contextPath}/inst/instdelete";
		document.instlist.submit();
	} else {
		return false;
	}
}
function allCheck(){
	
	var ac = document.instlist.allcheck;
	var rc = document.instlist.rowcheck;
	if(ac.checked == true){
		for(i=0; i<rc.length; i++){
			rc[i].checked=true;}
		rc.checked=true;
	}else {
		for(i=0;i<rc.length;i++){
			rc[i].checked=false;}
		rc.checked=false;
	} 
}
	
function changeIng(){
	var url = "/inst/changeIng"; // controller로 보내고자 하는 url
	var valueArr = new Array();
	var orderList = $("input[name='rowcheck']");
	for(var i=0; i<orderList.length; i++){
		if(orderList[i].checked){ //선택되어 있으면 배열에 값을 저장함 
			valueArr.push(orderList[i].value);
		}
	}
	if(valueArr.length==0){
		alert("작업현황 변경할 번호를 선택하여주세요");
	} else {
		var chk = confirm("생산대기 -> 생산중으로 변경하시겠습니까?");
		if(chk){
		$.ajax({
			url :'${pageContext.request.contextPath}/inst/changeIng', 		//전송url
			type : 'POST',	// post방식
			traditional : true,
			data : {
				valueArr : valueArr // 보내고자하는 data 변수설정	
			},
			success : function(jdata){
				if(jdata == '1'){
					alert("변경하였습니다");
					location.replace("${pageContext.request.contextPath}/inst/instmain")
				}
			}
			});
		}else {
			alert("삭제 취소되었습니다.");
		}
 }
	}
	
</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2> 작업지시현황 </h2><br>
	<div id="table_search">
			<form action="${pageContext.request.contextPath}/inst/instmain" method="get">
				<select name="select">
				<c:choose>						
						<c:when test="${pageDTO.select == 'instruction_code'.toString()}">
							<option value="instruction_code" selected>작업지시코드</option>
							<option value="line_cd">라인코드</option>
							<option value="product_cd_name">제품코드</option>
						</c:when>
						<c:when test="${pageDTO.select == 'line_cd'.toString()}">
							<option value="instruction_code">작업지시코드</option>
							<option value="line_cd" selected>라인코드</option>
							<option value="product_cd_name">제품코드</option>
						</c:when>

						<c:otherwise>
							<option value="instruction_code">작업지시코드</option>
							<option value="line_cd">라인코드</option>
							<option value="product_cd_name" selected>제품코드</option>
						</c:otherwise>
				</c:choose>
      			</select>
				<input type="text" name="search" class="input_box" value="${pageDTO.search}">
				<input type="submit" value="search" class="button2">
			</form>
	</div>
	<br>
	<div class="wrap2" style="float: left;">
		
	  <button class="button2" onclick="showPopup();">추가</button>
	  <button class="button2" onclick="chdelete();">삭제</button>
	   <button class="button2" onclick="changeIng();">작업전환:생산중</button>
	  <br>
	 </div><br>
	 <br>
	 <div>전체 ${pageDTO.count }건</div>
	 
	<form name="instlist">
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped" style="width:1000px">
			<thead>
				<tr style="text-align: center; font-size: 0.8rem">
					<th style="text-align: center;"><input type="checkbox" name="allcheck" onClick='allCheck()'></th>
					<th style="text-align: center; width: 25px;">번호</th>
					<th style="text-align: center;">수주코드</th>
					<th style="text-align: center;">작업지시코드</th>
					<th style="text-align: center;">제품코드명</th>
					<th style="text-align: center;">지시수량</th>		
					<th style="text-align: center;">라인코드</th>
					<th style="text-align: center;">생산지시일자</th>
					<th style="text-align: center;">작업지시상태</th>
					<th style="text-align: center;">상세확인</th>
					<th style="text-align: center;">수정</th>
				</tr>
			</thead>

			<tbody>
			<c:choose>
			<c:when test="${not empty instructionList}">
				<c:forEach var="dto" items="${instructionList}" varStatus="status">

				<tr style="text-align: center; font-size: 0.8rem">
				<td style="text-align: center;"><input type="checkbox" id="checkbox" name="rowcheck" value="${dto.instruction_code}"></td>
				<td style="text-align: center;">${status.count + ((pageDTO.pageNum-1)*pageDTO.pageSize)}</td>
				<td style="text-align: center;">${dto.order_cd}</td>
				<td style="text-align: center;">${dto.instruction_code}</td>
				<td style="text-align: center;">${dto.product_cd_name}</td>
    			<td style="text-align: center;">${dto.instruction_qt}</td>
    			<td style="text-align: center;">${dto.line_cd}</td>
    			<td style="text-align: center;">${dto.instruction_date}</td> 
    			<td style="text-align: center;">${dto.instruction_state}</td> 	
    			<td style="text-align: center;"><button class="button2" onclick="showPopup3('${dto.instruction_code}');">상세정보</button></td>		
    			<td style="text-align: center;"><button class="button2" onclick="showPopup2('${dto.instruction_code}');">수정</button></td>
    			</tr>
   			 
				</c:forEach>	
			</c:when>		
			<c:otherwise>
				<tr>
				<td colspan="15" style="text-align: center;">등록된 데이터가 없습니다.</td>
				</tr>
			</c:otherwise>
			</c:choose>	
			</tbody>
		</table>		
		<div id="array"></div>	
	</form>
	
<!-- 페이징 -->
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/inst/instmain?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&select=${pageDTO.select}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/inst/instmain?pageNum=${i}&search=${pageDTO.search}&select=${pageDTO.select}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/inst/instmain?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&select=${pageDTO.select}">[10페이지 다음]</a>
</c:if>	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->