<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../main/Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>

	function insertPopup(){
    	window.open("whinsert","창고등록팝업","width=1200, height=500, top=200, left=200");
	}

	function updatePopup(cd){
    	window.open("${pageContext.request.contextPath}/wh/whupdate?wh_cd="+cd,"수정","width=1300, height=500, top=200, left=200");
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

function itemChange(){
	var search2a = ["서울", "부산", "대구","인천", "광주", "대전","울산", "강원", "경기", "경남", "경북", "전남","전북", "제주", "충남", "충북"];
	var search2b = ["원자재","완제품"];
	
	$('#search2').empty();
	$('#search2').append("<option value=''>선택하세요</option>");
	
	var str = $('#select').val();
	if(str=="wh_addr"){    		
 		for(i=0; i<search2a.length; i++){

			$('#search2').append("<option value='"+search2a[i]+"'>"+search2a[i]+"</option>");
 		}
		}else if(str=="wh_dv"){
		for(i=0; i<search2b.length; i++){
			$('#search2').append("<option value='"+search2b[i]+"'>"+search2b[i]+"</option>");
 			}
		}
	}
	
$(function(){
    //직접입력 인풋박스 기존에는 숨어있다가
$("#search1").hide();

$("#select").change(function() {
              //직접입력을 누를 때 나타남
		if($("#select").val() == "wh_name") {
			$("#search1").show();
			$("#search2").hide();
		}  else {
			$("#search1").hide();
			$("#search2").show();
		}
	}) 
});


</script>
<!-- 자바스크립트 입력 끝-->


	<div id="innerContents">
<!-- 본문HTML 입력 시작-->
<c:set var = "priv" value = "${systemDTO2.emp_priv}"/>
<c:if test = "${!empty sessionScope.emp_no}">
      <c:choose>
<c:when test = "${fn:contains(priv, 'B')}">
	<h2>창고</h2><br>
	
<!-- 	검색창 -->
	<div class="wrap2">
	
	  <button class="button2" onclick="insertPopup();">등록</button>
	  <button class="button2"  onclick="deleteValue();">삭제</button>
	 </div><br>
	 <br>

    <div class="wrap2">
    <form action="${pageContext.request.contextPath}/wh/whpage" method="get">
      
       <select id="select" name="select" onchange="itemChange()" class="button2">
			<option value="">선택하세요</option>
			<option value="wh_name">이름</option>
			<option value="wh_addr">지역</option>
			<option value="wh_dv">창고유형</option>
		</select>

<!-- 		wh_name 선택했을때 -->
		<input type="text" id="search1" name="search" class="button2"/>
<!-- 		wh_addr, wh_dv선택했을때 --> 
		<select id="search2" name="search_option" class="button2">
			<option value="">구분을 선택하세요</option>
		</select>
		
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
			<c:forEach var="whDTO" items="${whList }">
				<tr>
					<td><input type="checkbox" id="checkbox" name="rowcheck" value="${whDTO.wh_cd }"></td>
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