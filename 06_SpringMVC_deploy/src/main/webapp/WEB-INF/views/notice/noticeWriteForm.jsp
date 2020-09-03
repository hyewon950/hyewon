<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>
		<c:import url="../common/menuBar.jsp" />
		
		<br style="clear:both">
		
		<h1 align="center">공지글 작성하기</h1>
		
		<br><br>
		
	<form action="ninsert.kh" method="post" enctype="Multipart/form-data">
		<table align="center" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="nTitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="nWriter" value="${loginUser.userId }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50" name="nContent"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">&nbsp; &nbsp;
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>


	<c:forEach var="n" items="${list }">
		<tr>
			<td align="center">${ n.nId }</td>
			<!-- 로그인 상태에서만 상세보기 가능 -->
			<!-- 로그인 상태가 아닌 경우 공지사항 제목만 출력 -->
			<td>
				<c:if test="${ !empty loginUser }">
					<c:url var="ndetail" value="ndetail.kh" >
						<c:param name="nId" value="${n.nId }" /> <!-- 쿼리스트링 -->
					</c:url>
					<a href="#">${n.nTitle }</a>
				</c:if>
				<c:if test="${empty loginUser }">
					${n.nTitle }
				</c:if>
			</td>
			<td align="center">${n.nWriter }</td>
			<td align="center">${n.nCreateDate }</td>
			<td align="center">
				<c:if test="${!empty n.filePath }">
					ⓞ${n.filePath }
				</c:if>
				<c:if test="${ empty n.filePath }">
					&nbsp;
				</c:if>
			</td>
		</tr>
	</c:forEach>
			<c:if test="${ loginUser.userId eq notice.nWriter }">
				<tr>
					<td colspan="2" align="center">
						<a href="#">수정페이지로 이동</a>&nbsp; &nbsp;
						<a href="#">삭제하기</a>
					</td>
				</tr>
			</c:if>
		</table>

		
		<p align="center">
			<c:url var="home" value="home.kh"/>
			<a href="${ home }">시작페이지로 이동</a>&nbsp;
			<c:url var="nlist" value="nlist.kh"/>
			<a href="${ nlist }">목록 전체보기</a>
		</p>

		
</body>
</html>