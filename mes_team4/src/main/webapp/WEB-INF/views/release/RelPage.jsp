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

	function insertPopup(){
    	window.open("relinsert","창고등록팝업","width=1000, height=500, top=200, left=200");
	}

	function updatePopup(cd){
    	window.open("${pageContext.request.contextPath}/wh/whupdate?wh_cd="+cd,"수정","width=1000, height=500, top=200, left=200");
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
		}
	}
	
</script>
<!-- 자바스크립트 입력 끝-->


	<div id="contents">
<!-- 본문HTML 입력 시작-->
	<h2>창고</h2><br>
	
	
<!--     <div class="search"> -->
<%--     <form action="${pageContext.request.contextPath}/wh/whpage" method="get"> --%>
<!--        <select name="search_option" class="button2"> -->
<!--        		<option value="wh_name">이름</option> -->
<!--        		<option value="wh_addr">지역</option> -->
<!--        </select> -->
<!--        <input type="text" name="search" class="button2"> -->
<!--        <input type="submit" class="button2" value="검색" > -->
<!--      </form>   -->
<!--     </div> -->

	
	<div class="wrap2">
	
	  <button class="button2" onclick="insertPopup();">등록</button>
<!-- 	  <button class="button2" onclick="updatePopup();">수정</button> -->
	  <button class="button2"  onclick="deleteValue();">삭제</button>
<!-- 	  <button class="button2" onclick="searchPopup();">조회</button> -->
	  
	 </div><br>
	 <br>
	 
	 
	<form name="whlist">
<!-- 		<input type="hidden" value=""> -->
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th><input type="checkbox" name="allcheck" onClick='allCheck()'></th>
					<th>출고코드</th>
					<th>출고일자</th>
					<th>출고품목명</th>
					<th>출고창고</th>
					<th>출고수량</th>
					<th>출고진행상태</th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="whDTO" items="${whList }">
				<tr>
					<td><input type="checkbox" id="checkbox" name="rowcheck" value="${releaseDTO.rel_schedule_cd }"></td>
					<td>${releaseDTO.rel_schedule_cd}</td>
					<td>${releaseDTO.rel_date}</td>
					<td>${productDTO.product_name}</td>
					<td>${whDTO.wh_name}</td>
					<td></td>
					<td>${releaseDTO.out_complete}</td>
					<td>${releaseDTO.remarks}</td>
					<td>
					<button class="button2" onclick="updatePopup('${releaseDTO.rel_schedule_cd}');">수정</button>
					</td>
				</tr>
			</c:forEach>			
			</tbody>

		</table>
		
	</form>


<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/wh/whpage?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/wh/whpage?pageNum=${i}&search=${pageDTO.search}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/wh/whpage?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}">[10페이지 다음]</a>
</c:if>
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->