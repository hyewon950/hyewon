<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.login-area {
		height:100px;
	}
	.btn-login {
		height:50px;
	}
	.nav-area {
		background:gray;
		height:50px;
	}
	.menu {
		display:table-cell;
		width:250px;
		height:50px;
		text-align:center;
		vertical-align:middle;
		font-size:20px;
		background:gray;
		color:black;
	}
	.menu:hover {
		background:gold;
		cursor:pointer;
	}
</style>

</head>
<body>
	<h1 align="center">Welcome to MyBatis Web</h1>
	<br>
		<div class="login-area">
		<c:if test="${ empty sessionScope.loginUser }">
		<form action="/login.do" method="post">
			<table align="right">
				<tr>
					<td>아이디 : </td>
					<td><input type="text" name="userId"></td>
					<td rowspan="2">
						<button id="login-btn" class="btn btn-login">로그인</button>
					</td>
				</tr>
				<tr>
					<td>비밀번호 : </td>
					<td><input type="password" name="userPwd"></td>
				</tr>
				<tr>
					<td colspan="3">
						<a href="/memberRegister.do">회원가입</a> <!-- web-inf에있기 때문에 경로를 바로 사용할 수 없고 url 접근가능함 -->
						<a href="#">아이디/비밀번호 찾기</a>
					</td>
				</tr>
			</table>
		</form>
		</c:if>
		<c:if test="${ empty sessionScope.loginUser }"></c:if>
				<c:if test="${ !empty sessionScope.loginUser }">
					<table align="right">
						<tr>
							<td colspan="2"><h3>${ loginUser.userName } 님 환영합니다.</h3></td>
						</tr>
						<tr>
							<td><button onclick="location.href='/Logout'">로그아웃</button></td>
						</tr>
					</table>
		</c:if>

	</div>
		<div class="nav-area">
		<div class="menu" onclick="home()">HOME</div>
		<div class="menu" onclick="lecture()">강좌목록</div>
		<div class="menu" onclick="comingSoon()">게시판</div>
		<div class="menu" onclick="member()">멤버목록</div>
		<div class="menu" onclick="comingSoon()">etc.</div>
	</div>
	<script>
		function home() {
			location.href = "index.jsp";			
		}
		function lecture() {
			location.href = "lectureList.do";
		}

		function member() {
			location.href="memberList.do";
		}
		function comingSoon() {
			alert("comingSoon~!");
		}
	</script>

</body>
</html>