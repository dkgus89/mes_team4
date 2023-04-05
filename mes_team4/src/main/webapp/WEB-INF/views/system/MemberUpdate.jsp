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
<script type="text/javascript">
$(document).ready(function(){
//	alert("준비");
//submit 버튼을 클릭했을때 폼태그 전송되어지면 이벤트 onsubmit()
// id="join" 폼태그 표시 => 전송
  
$('#update').submit(function(){
	
	if($('.emp_name').val()==""){
		alert("사원명을 입력하세요");
		$('.emp_name').focus();
		return false;
	}
  //class="pass"
  if($('.emp_pass').val()==""){
    	alert("현재비밀번호를 입력하세요");
		$('.emp_pass').focus();
		return false;
    }
  
  if($('.emp_pass').val() != ${systemDTO.emp_pass}){
    	alert("현재비밀번호 틀림");
		$('.emp_pass').focus();
		return false;
    }
    
  if($('.newemp_pass').val()==""){
    	alert("새 비밀번호를 입력하세요");
		$('.emp_pass').focus();
		return false;
    }
    
  if($('.newemp_pass2').val()==""){
    	alert("새 비밀번호를 확인해주세요");
		$('.emp_pass2').focus();
		return false;
    }
    
  if($('.newemp_pass').val() != $('.newemp_pass2').val()){
    	alert("새 비밀번호 일치하지 않음");
		$('.emp_pass2').focus();
		return false;
    }
    
  if($('.dept_cd').val()==""){
    	alert("부서를 체크하세요");
		return false;
    }
    
  if($('.grade_cd').val()==""){
    	alert("직급을 체크하세요");
		return false;
    }
    
  if($('.priv_cd').val()==""){
    	alert("권한을 체크하세요");
		return false;
    } 
  document.update.submit();
  setTimeout(function() {
	  	 opener.parent.location.reload();
	 	 window.close();
	  }, 1000);
});//
});

</script>
<!-- 자바스크립트 입력 끝-->

<div id="contents">
	<!-- 본문HTML 입력 시작-->
	
	
	<form action="${pageContext.request.contextPath }/system/memberupdatepro" name="update" id="update" method="post">
		
<fieldset style="width:500px; height:570px; padding-left:20px; padding-right: 20px;">
<h2 style= "margin-top: 30px; margin-bottom: 15px; text-align: center" >사용자수정</h2>
					<input type="hidden" name="emp_no" class="emp_no" value="${systemDTO.emp_no}">
					<div>
					<label>사원명</label>
					<input type="text" name="emp_name" class="emp_name" style="width:150px;height:30px;font-size:18px;" value="${systemDTO.emp_name}" readonly><br><br>
					</div>
					<div>
					<label>현재비밀번호</label>
					<input type="password" name="emp_pass" class="emp_pass" style="width:150px;height:30px;font-size:18px;"><br><br>
					</div>
					<div>
					<label>새 비밀번호</label>
					<input type="password" name="newemp_pass" class="newemp_pass" style="width:150px;height:30px;font-size:18px;"><br><br>
					</div>
					<div>
					<label>새 비밀번호확인</label>
					<input type="password"  name="newemp_pass2" class="newemp_pass2" style="width:150px;height:30px;font-size:18px;"><br><br>
					</div>
					<label>부서</label><br>
					<div>
						<input type="radio" name="dept_cd" class="dept_cd" value="MDP001" ${systemDTO.dept_cd eq 'MDP001' ? 'checked':''}/> 영업부
						<input type="radio" name="dept_cd" class="dept_cd" value="MDP002" ${systemDTO.dept_cd eq 'MDP002' ? 'checked':''}/> 인사부
						<input type="radio" name="dept_cd" class="dept_cd" value="MDP003" ${systemDTO.dept_cd eq 'MDP003' ? 'checked':''}/> 생산부
						<input type="radio" name="dept_cd" class="dept_cd" value="MDP004" ${systemDTO.dept_cd eq 'MDP004' ? 'checked':''}/> 총무부
						<input type="radio" name="dept_cd" class="dept_cd" value="MDP005" ${systemDTO.dept_cd eq 'MDP005' ? 'checked':''}/> 기획부	
					</div><br>
					<label>직급</label><br>
					<div>
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD001" ${systemDTO.grade_cd eq 'MGD001' ? 'checked':''}/> 사원
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD002" ${systemDTO.grade_cd eq 'MGD002' ? 'checked':''}/> 주임
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD003" ${systemDTO.grade_cd eq 'MGD003' ? 'checked':''}/> 대리
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD004" ${systemDTO.grade_cd eq 'MGD004' ? 'checked':''}/> 과장
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD005" ${systemDTO.grade_cd eq 'MGD005' ? 'checked':''}/> 차장	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD006" ${systemDTO.grade_cd eq 'MGD006' ? 'checked':''}/> 부장<BR>	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD007" ${systemDTO.grade_cd eq 'MGD007' ? 'checked':''}/> 이사	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD008" ${systemDTO.grade_cd eq 'MGD008' ? 'checked':''}/> 상무	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD009" ${systemDTO.grade_cd eq 'MGD009' ? 'checked':''}/> 전무	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD010" ${systemDTO.grade_cd eq 'MGD010' ? 'checked':''}/> 부사장	
						<input type="radio" name="grade_cd" class="grade_cd" value="MGD011" ${systemDTO.grade_cd eq 'MGD011' ? 'checked':''}/> 사장
					</div><br>			
					<label>권한</label><br>
					<div>
						<input type="checkbox" class="priv_cd" name="priv_cd" value="A" ${systemDTO.priv_cd.contains("A") ? 'checked':''}/> 사원조회
						<input type="checkbox" class="priv_cd" name="priv_cd" value="B" ${systemDTO.priv_cd.contains("B") ? 'checked':''}/> 사원관리
						<input type="checkbox" class="priv_cd" name="priv_cd" value="C" ${systemDTO.priv_cd.contains("C") ? 'checked':''}/> 재고조회
						<input type="checkbox" class="priv_cd" name="priv_cd" value="D" ${systemDTO.priv_cd.contains("D") ? 'checked':''}/> 재고관리
						<input type="checkbox" class="priv_cd" name="priv_cd" value="E" ${systemDTO.priv_cd.contains("E") ? 'checked':''}/> 생산조회<BR>
						<input type="checkbox" class="priv_cd" name="priv_cd" value="F" ${systemDTO.priv_cd.contains("F") ? 'checked':''}/> 생산관리 
						<input type="checkbox" class="priv_cd" name="priv_cd" value="G" ${systemDTO.priv_cd.contains("G") ? 'checked':''}/> 수주조회 
						<input type="checkbox" class="priv_cd" name="priv_cd" value="H" ${systemDTO.priv_cd.contains("H") ? 'checked':''}/> 수주관리
						<input type="checkbox" class="priv_cd" name="priv_cd" value="I" ${systemDTO.priv_cd.contains("I") ? 'checked':''}/> 발주조회 
						<input type="checkbox" class="priv_cd" name="priv_cd" value="J" ${systemDTO.priv_cd.contains("J") ? 'checked':''}/> 발주관리 <BR>
						<input type="checkbox" class="priv_cd" name="priv_cd" value="K" ${systemDTO.priv_cd.contains("K") ? 'checked':''}/> 출하조회 
						<input type="checkbox" class="priv_cd" name="priv_cd" value="L" ${systemDTO.priv_cd.contains("L") ? 'checked':''}/> 출하관리 
						<input type="checkbox" class="priv_cd" name="priv_cd" value="M" ${systemDTO.priv_cd.contains("M") ? 'checked':''}/> 기준정보조회
						<input type="checkbox" class="priv_cd" name="priv_cd" value="N" ${systemDTO.priv_cd.contains("N") ? 'checked':''}/> 기준정보관리<BR>
						<input type="checkbox" class="priv_cd" name="priv_cd" value="O" ${systemDTO.priv_cd.contains("O") ? 'checked':''}/> 시스템관리 

					</div>

			</fieldset>
		
	</form>
<div style="text-align:center">
		<button class="button2" form="update" onclick="submit">사용자수정</button>
	  	<button class="button2" onclick="window.close()">창닫기</button>
	  	</div>

	<!-- 본문HTML 입력 끝-->
</div>


<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../main/Footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->