<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!-- 헤더파일들어가는 곳 -->
<%-- <jsp:include page="../main/Header.jsp" /> --%>
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){
//	alert("준비");
//submit 버튼을 클릭했을때 폼태그 전송되어지면 이벤트 onsubmit()
// id="join" 폼태그 표시 => 전송
  
$('#insert').submit(function(){

	if($('.emp_name').val()==""){
		alert("사원명을 입력하세요");
		$('.emp_name').focus();
		return false;
	}
  //class="pass"
    if($('.emp_pass').val()==""){
    	alert("비밀번호를 입력하세요");
		$('.emp_pass').focus();
		return false;
    }
  
    if($('.emp_pass2').val()==""){
    	alert("비밀번호2 입력하세요");
		$('.emp_pass2').focus();
		return false;
    }
    
    if($('.emp_pass').val() != $('.emp_pass2').val()){
    	alert("비밀번호 틀림");
		$('.emp_pass2').focus();
		return false;
    }
    else{
  	  setTimeout(function(){
  	  opener.parent.location.reload();
  	  window.close();
  	  },500);
    }
});//
});
</script>
<!-- 자바스크립트 입력 끝-->

<div id="contents">
	<!-- 본문HTML 입력 시작-->
	
	
	<form action="${pageContext.request.contextPath }/system/memberinsertpro" name="insert" id="insert" method="post">
		
<fieldset style="width:520px; height:520px; padding-left:20px; padding-right: 20px;">
<h2 style= "margin-top: 30px; margin-bottom: 15px; text-align: center" >사용자추가</h2>
					<div>
					<label>사원명</label>
					<input type="text" name="emp_name" class="emp_name" style="width:150px;height:30px;font-size:18px;" autofocus="autofocus"><br><br>
					</div>
					<div>
					<label>비밀번호</label>
					<input type="password" name="emp_pass" class="emp_pass" style="width:150px;height:30px;font-size:18px;"><br><br>
					</div>
					<div>
					<label>비밀번호확인</label>
					<input type="password" name="emp_pass2" class="emp_pass2" style="width:150px;height:30px;font-size:18px;"><br><br>
					</div>
					<label>부서</label><br>
					<div>
						<input type="radio" name="dept_cd" class="dept_cd" value="MDP001" checked="checked"/> 영업부
						<input type="radio" name="dept_cd" class="dept_cd" value="MDP002" /> 인사부
						<input type="radio" name="dept_cd" class="dept_cd" value="MDP003" /> 생산부
						<input type="radio" name="dept_cd" class="dept_cd" value="MDP004" /> 총무부
						<input type="radio" name="dept_cd" class="dept_cd" value="MDP005" /> 기획부
					</div><br>
					<label>직급</label><br>
					<div>
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD001" checked="checked"/> 사원
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD002" /> 주임
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD003" /> 대리
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD004" /> 과장
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD005" /> 차장	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD006" /> 부장<BR>	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD007" /> 이사	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD008" /> 상무	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD009" /> 전무	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD010" /> 부사장	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD011" /> 사장
					</div><br>
					<label>권한</label><br>
					<div>
						<input type="checkbox" class="emp_priv" name="emp_priv" value="A" checked="checked"/> 시스템관리
						<input type="checkbox" class="emp_priv" name="emp_priv" value="B" /> 사원관리
						<input type="checkbox" class="emp_priv" name="emp_priv" value="C" /> 기준정보관리<BR>
						<input type="checkbox" class="emp_priv" name="emp_priv" value="D" /> 영업관리
						<input type="checkbox" class="emp_priv" name="emp_priv" value="E" /> 생산조회
						<input type="checkbox" class="emp_priv" name="emp_priv" value="F" /> 재고관리

					</div>
	
			</fieldset>
		
	</form>
<div style="margin-left: 170px">
		<button class="button2" form="insert" onclick="submit">사용자추가</button>
	  	<button class="button2" onclick="window.close()">창닫기</button>
	  	</div>

	<!-- 본문HTML 입력 끝-->
</div>


<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../main/Footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->