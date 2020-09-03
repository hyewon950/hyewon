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
	<h1 align="center">22 번 게시글 수정하기</h1>
	<br>
	
	<form action="#" method="#" enctype="#">
		<input type="hidden" name="#" value="#">
		<input type="hidden" name="#" value="#">
		<input type="hidden" name="#" value="#">
		
		<table align="center" id="tb" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" name="#" value="게시글 제목입니다."></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly name="#" value="admin"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="#">게시글 샘플 입니다.</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="#" name="#">
						<br>현재 업로드한 파일 : <a href="#">sampleFile1.jpg</a>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="#" value="수정"> &nbsp;
					<a href="#">목록으로</a>
					<a href="#">이전페이지로</a>
				</td>
			</tr>
		</table>
	</form>
	<!-- bupdate.do 하러가자 -->
</body>
</html>