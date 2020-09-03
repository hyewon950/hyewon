<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	p {
	font-size: 2.1em;
	}
	
	b {
	color: red;
	}
	
	.memberBack {
	font-size: 1.3em;
	}
</style>


</head>
<body>

<!--  네비바들어가는 부분-->
 <jsp:include page="../common/menuBar.jsp"></jsp:include>
<!-- 네비끝 -->

<div style="text-align: center;">
    <br><br><br><br><br><br><br><br>
    <p>회원님은 <b>탈퇴를 하여 서비스를 이용 불가능</b>합니다. </p>
    <a class="memberBack" href="memberDeleteRevert.do?mId=${loginUser.mId }"> 회원으로 다시 돌리기</a>
    
    </div>

</body>
</html>