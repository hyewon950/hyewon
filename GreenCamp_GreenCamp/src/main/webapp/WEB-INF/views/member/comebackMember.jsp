<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원으로 컴백~</title>
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
    <br><br><br><br><br><br><br><br>
    <p style="font-size: 2.1em;">${mId }님 돌아오신 걸 환영합니다.<br> 
    <b>앞으로 저희 Green Camp 많이 이용해주세요~</b>
     </p>
    
    </div>


</body>
</html>