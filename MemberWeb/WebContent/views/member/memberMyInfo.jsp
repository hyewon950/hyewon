<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보</title>
</head>
<body>
	<form action = "/mUpdate" method = "post">
		아이디: <input type="text" name="userId" id="userId" value="${memberOne.userId}"><br>
		패스워드: <input type="password" name="userPwd" id="userPwd"><br>
		패스워드 확인: <input type="password" name="userPwdRe" id="userPwdRe"><br>
		이름: <input type="text" name="userName" id="userName" value="${memberOne.userName}" readonly><br>
		나이: <input type="text" name="age" value=" ${memberOne.getAge()}" readonly><br>
		이메일: <input type="text" name="email" id="email" value=" ${memberOne.email}"><br>
		휴대폰: <input type="text" name="phone" id="phone" value="${memberOne.phone}"><br>
		주소: <input type="text" name="address" id="address" value="${memberOne.address}"><br>
		성별: 
		<c:if test="${memberOne.gender eq 'M' }">
			<input type="radio" name="gender" value="M" checked>남자
			<input type="radio" name="gender" value="F" >여자
		</c:if>
		<c:if test="${memberOne.gender ne 'M' }">
			<input type="radio" name="gender" value="M" >남자
			<input type="radio" name="gender" value="F" checked>여자
		</c:if>
		
		<%-- <% if(member.getGender().equals("M")){ %>
		<input type="radio" name="gender" value="M" checked>남자
		<input type="radio" name="gender" value="F" >여자
		<% } else { %>
		<input type="radio" name="gender" value="M" >남자
		<input type="radio" name="gender" value="F" checked>여자
		<% } %> --%>
		
		<br>
		취미: <input type="text" name="hobby" value="${memberOne.hobby}"><br>
		<input type="submit" value="정보수정">
		<input type="reset" value="취소">
	</form>
	<script>
		function question(){
			var result = window.alert("정말로 회원탈퇴를 하시겠습니까?");
			if(result){
				return true;
			}else{
				return false;
			}
		}
	</script>
	<a href="/index.jsp">메인페이지로 이동하기</a>
	<a href="/mdelete" id="mdel" onclick="return question();">회원 탈퇴하기</a>
</body>
</html>