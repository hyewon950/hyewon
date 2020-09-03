<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 미확인</title>

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

</head>
<body>

<!--  네비바들어가는 부분-->
 <jsp:include page="../common/menuBar.jsp"></jsp:include>
<!-- 네비끝 -->

<div style="text-align: center;">
<h2>안녕하세요, ${loginUser.mName }님</h2>
    
    <!-- key값이 Y가 아닐 경우 -->
    <c:if test="${ loginUser.mKey ne 'Y' }">
    <h3>회원가입을 완료하실려면 먼저 이메일을 확인해 주세요! </h3>
    </c:if>
    
    </div>
</body>
</html>