<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
		<c:import url="../common/menuBar.jsp" />
		
		<br style="clear:both">
		
		<h1 align="center">${notice.nId }번 글 상세 보기</h1>
		
		<br><br>
		
	
				
		<table align="center" width="450" border="1" cellspacing="0">
			<tr>
				<td width="80">번호</td>
				<td>${notice.nId }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${notice.nTitle }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${notice.nWriter }</td>
			</tr>
			<tr>
				<td>작성날짜</td>
				<td>${notice.nCreateDate }</td>
			</tr>
			<tr height="300">
				<td>내용</td>
				<td>${notice.nContent }</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><%-- ${notice.filePath } --%>
				<c:if test="${!empty notice.filePath}">
	               <a href="${contextPath }/resources/nuploadFiles/${notice.filePath}">
	                  ${notice.filePath }
	               </a>
	            </c:if>
				
				</td>
			</tr>
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
					<c:url var="nupdate" value="nupView.kh">
						<c:param name="nId" value="${notice.nId }"/></c:url>
						<!-- 쿼리 스트링을 보내주어야 컨트롤러의 메소드의 매개변수가 받아서 처리 가능 -->
						<c:url var="ndelete" value="ndelete.kh">
							<c:param name="nId" value="${notice.nId }"></c:param>
						</c:url>
						<a href="${nupdate}">수정페이지로 이동</a>&nbsp; &nbsp;
						<a href="${ndelete }">삭제하기</a>
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