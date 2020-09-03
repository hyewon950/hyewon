<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/menubar-style.css" 
type="text/css">
</head>
<body>
	<c:if test="${!empty msg }">
		<script>alert("${msg }")</script>
	</c:if>
	<!-- 로그인 후에 디비에 가져온 값을 세션에 저장 -->
	<div class="loginArea" align="right">
		<c:if test="${ empty sessionScope.loginUser }">
			<form action="login.kh" method="post">
			<table id="loginTable" style="text-align:center;">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId"></td>
					<td rowspan="2">
					<input type="submit" value="로그인">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="password">
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<a href="enrollView.kh">회원가입</a>
						<a href="#">아이디/비밀번호 찾기</a>
					</td>
				</tr>
			</table>
		</form>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
			<h3 align="right">
				${ loginUser.userName } 님 환영합니다!
				<button onclick="location.href='myinfo.kh'">정보수정</button>
				<button onclick="location.href='logout.kh'">로그아웃</button>
			</h3>
		</c:if>
	</div>
	<c:url var="nlist" value="nlist.kh"/>
	 <c:url var="blist" value="blist.kh"/>
	<div class="menubar">
		<div class="nav">
			<div class="menu"><a href="home.kh">HOME</a></div>
			<div class="menu"><a href="${nlist }">공지사항</a></div>
			<div class="menu"><a href="${blist }">게시판</a></div>
			<div class="menu"><a href="#">etc</a></div>
		</div>
	</div>
</body>
</html>