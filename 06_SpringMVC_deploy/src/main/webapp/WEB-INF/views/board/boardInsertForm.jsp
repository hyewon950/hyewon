<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../common/menuBar.jsp"/>
	<h1 align="center">게시글 작성하기</h1>
	<br>
	
	<form action="#" method="#" enctype="#">
		
		<table align="center" id="tb">
			<tr>
				<td>제목</td>
				<td><input type="#" name="#"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="#" name="#" value="#"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="#"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="#" name="#"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="#" value="등록하기"> &nbsp;
					<a href="#">목록으로</a>
				</td>
			</tr>
		</table>
	</form>
	<!-- binsert.do 하러가자 -->
</body>
</html>