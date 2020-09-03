<%@ page language="java" contentType="text/html; charset=UTF-8"
	  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 수정</title>
	</head>
	<body>
	   <c:import url="../common/menuBar.jsp"/>
	   <br style="clear:both">
	   <h1 align="center">공지사항 수정 페이지</h1>
	   
	   <br><br>
	<form action="nupdate.kh" method="post" enctype="Multipart/form-data">
	   <input type="hidden" name="nId" value="${notice.nId }">
	   <input type="hidden" name="filePath" value="${notice.filePath }">
	   <table align="center" border="1" cellspacing="0">
	      <tr>
	         <td>제목</td>
	         <td><input type="text" size="50" name="nTitle" value="${notice.nTitle }"></td>
	      </tr>
	      <tr>
	         <td>작성자</td>
	         <td><input type="text" name="nWriter" value="${notice.nWriter }" readonly></td>
	      </tr>
	      <tr>
	         <td>내용</td>
	         <td>
	             <c:set var="nContent" value="${fn:replace(notice.nContent, '<br>', '') }"/> 
	            <textarea rows="7" cols="50" name="nContent">${notice.nContent }</textarea>
	         </td>
	      </tr>
	      <tr>
	         <td>첨부파일</td>
	         <td>
	            <input type="file" name="reloadFile">
	           <%--  <c:if test="${!empty notice.filePath}">
	               <a href="${contextPath }/resources/nuploadFiles/${notice.filePath}">
	                  ${notice.filePath }
	               </a>
	            </c:if> --%>
	         </td>
	      </tr>
	      <tr>
	         <td colspan="2" align="center">
	            <input type="submit" value="수정">&nbsp; &nbsp;
	            <input type="reset" value="취소">
	         </td>
	      </tr>
	   </table>
	</form>
	
	   
	   <p align="center">
	      <c:url var="home" value="home.kh"/>
	      <a href="${home }">home</a>&nbsp;
	      <c:url var="nlist" value="nlist.kh"/>
	      <a href="${nlist}">목록</a>
	<!--       웹에서 패킷이 전송될 때 그 패킷의 구조를 보면 header와 body로 나누어져있습니다
	      header에 다양한 정보가 포함되어있는데 예를들어 user-agent(브라우저)
	      referer(이전페이지) 들이 있습니다. -->
	      <c:url var="back" value="${header.referer }"/>
	      <a href="${back}">이전</a>
	   </p>
	   <br><br><br><br><br><br><br><br><br><br><br><br><br>
	</body>
	</html>