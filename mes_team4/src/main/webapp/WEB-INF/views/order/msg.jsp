<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
alert("수정이 불가합니다. \n작업지시상황을 확인해주세요.");
location.replace("${pageContext.request.contextPath}/order/ordermain");
</script>

</body>
</html>