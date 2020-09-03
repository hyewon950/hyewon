<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="WEB-INF/views/main/main.jsp"/>
	<h3>${loginUser.userId}님환영합니다.</h3>
</body>
</html>