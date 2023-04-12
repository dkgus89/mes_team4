<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<title>MEDI-FAC</title>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../main/Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>

	function insertPopup(){
    	window.open("whinsert","창고등록팝업","width=1300, height=250, top=200, left=200");
	}

	function updatePopup(cd){
    	window.open("${pageContext.request.contextPath}/wh/whupdate?wh_cd="+cd,"수정","width=1350, height=250, top=200, left=200");
	}
	
	
// 	체크
	function allCheck(){
		var ac = document.whlist.allcheck;
		var rc = document.whlist.rowcheck;
		if(ac.checked == true){
			for(i=0; i<rc.length; i++){
				rc[i].checked=true;}
		}else {
			for(i=0;i<rc.length;i++){
				rc[i].checked=false;}
		} }
	
// 	삭제
function deleteValue(){
	var url = "/wh/whdelete"; // controller로 보내고자 하는 url
	var valueArr = new Array();
	var whList = $("input[name='rowcheck']");
	for(var i=0; i<whList.length; i++){
		if(whList[i].checked){ //선택되어 있으면 배열에 값을 저장함 
			valueArr.push(whList[i].value);
		}
	}
	if(valueArr.length==0){
		alert("삭제할 글을 선택하여주세요");
	} else {
		var chk = confirm("정말 삭제하시겠습니까?");
		if(chk){
		$.ajax({
			url :'${pageContext.request.contextPath}/wh/whdelete', 		//전송url
			type : 'GET',	// post방식 ,,나는 겟하니까 돌아간다!!...
			traditional : true,
			data : {
				valueArr : valueArr // 보내고자하는 data 변수설정	
			},
			success : function(jdata){
				if(jdata = 1){
					alert("삭제하였습니다");
					location.replace("${pageContext.request.contextPath}/wh/whpage")
				} else {alert("삭제실패");}
			}
		});
	}else {
		alert("삭제 취소되었습니다.");}
	}
}
</script>
<!-- 자바스크립트 입력 끝-->
</head>

	<div id="innerContents">
<!-- 본문HTML 입력 시작-->
<c:set var = "priv" value = "${systemDTO2.emp_priv}"/>
<c:if test = "${!empty sessionScope.emp_no}">
      <c:choose>
<c:when test = "${fn:contains(priv, 'B')}">
	<h2 onclick="location.href='${pageContext.request.contextPath}/wh/whpage'">창고</h2><br>
	
<!-- 	검색창 -->
	<div class="wrap2">
	
	  <button class="button2" onclick="insertPopup();">등록</button>
	  <button class="button2"  onclick="deleteValue();">삭제</button>
	 </div><br>
	 <br>

    <div class="wrap2" id="table_search">
    <form action="${pageContext.request.contextPath}/wh/whpage" method="get">
      
       <select id="select" name="select" class="button2">
			<option value="">선택하세요</option>
			<option value="wh_name">이름</option>
			<option value="wh_addr">지역</option>
			<option value="wh_dv">창고유형</option>
		</select>
		
		<input type="text" name="search" class="input_box" placeholder="검색어를 입력하세요."/>
<!-- 	   검색버튼 -->
       <input type="submit" class="button2" value="검색" >
       
     </form>  
    </div><br>
    <br>
    <br>
	
	
	 
	<form name="whlist">
<!-- 		<input type="hidden" value=""> -->
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th><input type="checkbox" name="allcheck" onClick='allCheck()'></th>
					<th>번호</th>
					<th>창고코드</th>
					<th>창고명</th>
					<th>창고유형</th>
					<th>창고지역</th>
					<th>창고연락처</th>
					<th>창고사용여부</th>
					<th>적요</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
			<c:if test="${pageDTO.count != 0 }">
			<c:forEach var="whDTO" items="${whList }" varStatus="status">
				<tr>
					<td><input type="checkbox" id="checkbox" name="rowcheck" value="${whDTO.wh_cd }"></td>
					<td>${status.count + ((pageDTO.pageNum-1)*pageDTO.pageSize)}</td>
					<td>${whDTO.wh_cd}</td>
					<td>${whDTO.wh_name}</td>
					<td>${whDTO.wh_dv}</td>
					<td>${whDTO.wh_addr}</td>
					<td>${whDTO.wh_tel}</td>
					<td>${whDTO.wh_use}</td>
					<td>${whDTO.remarks}</td>
					<td>
					<button class="button2" onclick="updatePopup('${whDTO.wh_cd}');">수정</button>
					</td>
				</tr>
			</c:forEach>
			</c:if>			
			</tbody>

		</table>
		
	</form>

	<div id="pagingControl">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/wh/whpage?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/wh/whpage?pageNum=${i}&search=${pageDTO.search}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/wh/whpage?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}">[10페이지 다음]</a>
</c:if>
</div>

 </c:when>
   <c:otherwise>
      <script type="text/javascript">
      alert("권한이 없습니다.")
      history.back();
      </script>
   </c:otherwise>   
   </c:choose>
</c:if>	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->