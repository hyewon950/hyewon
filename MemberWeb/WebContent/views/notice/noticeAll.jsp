<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.*, java.util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%
    	PageData pd = (PageData)request.getAttribute("pageData");
    	ArrayList<Notice> noticeList = pd.getPageList();
    	Member member = (Member)session.getAttribute("member");
    %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
</head>
<body>
	<center>

		<h1>공지사항</h1>
		<table border="1">
			<tr><th>글번호</th><th>글제목</th><th>글쓴이</th><th>작성일</th></tr>
			<c:forEach items="${pageData.pageList}" var="notice" varStatus="i">
			<tr>
				<td> <c:out value="${notice.noticeNo }"/></td>
				<td><a href="/noticeSelect?noticeNo=${notice.noticeNo }">${notice.subject }</a></td>
				<td>${notice.userId}</td>			
				<td>${notice.regDate}</td>	
			</tr>		
			</c:forEach>
				
			<tr>
				<td colspan = "3" align = "center">
					<form action="/noticeSearch" method="get">
						<input type="text" name="search">
						<input type="submit" value="검색">
					</form>
				</td>
			 <c:if test="${sessionScope.member !=null && member.userId=='admin'}">   
					<td align="right">
						<form action="/views/notice/noticeWrite.html" method="post"> 
					
						<input type="submit" value="글쓰기">
						</form>
					</td>
				</c:if>		
				
				<tr>
					<td colspan = "4" align = "center">
						${pageData.getPageNavi()}
					</td>
				</tr> 
			




		<%-- 	<% for(Notice notice:noticeList){ %>
			<tr>
				<td><%= notice.getNoticeNo() %></td>
				<td><a href="/noticeSelect?noticeNo=<%= notice.getNoticeNo() %>"><%= notice.getSubject() %></a></td>
				<td><%= notice.getUserId() %></td>
				<td><%= notice.getRegDate() %></td>
			</tr>
			<% } %>
			<tr>
				<td colspan = "3" align = "center">
					<form action="/noticeSearch" method="get">
						<input type="text" name="search">
						<input type="submit" value="검색">
					</form>
				</td>
				<%if(member !=null && member.getUserId().equals("admin")){ %>
				<td align="right">
					<form action="/views/notice/noticeWrite.html" method="post"> 
					<!-- <form action="/noticeWriteForm.html" method="post"> -->
						<input type="submit" value="글쓰기">
					</form>
				</td>
				<%} %>
			</tr>
			<tr>
				<td colspan = "4" align = "center">
					<%= pd.getPageNavi() %>
				</td>
			</tr> --%>
		</table>
	</center>
		<!-- currentPage: 현재 페이지 번호
		recordCountPerPage: 한 페이지에 출력할 게시물의 갯수
		recordTotalCount: 전체 게시물의 갯수
		start: 검색할 게시물 시작번호
		end: 검색할 게시물 끝번호-->
</body>
</html>