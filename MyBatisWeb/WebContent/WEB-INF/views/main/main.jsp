<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/> <!--..은 상위 폴더로 이동한다는 것임(상대경로)  -->
	<div align="center">
		<img src="${pageContext.request.contextPath }/resources/images/mybatis.PNG">
	</div>

</body>
</html>