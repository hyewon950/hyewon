<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "notice.model.vo.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	Notice notice = (Notice)request.getAttribute("content");
	ArrayList<NoticeComment> comments=notice.getComments();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>상세 내용</title>
</head>
<body>

	<h2>제목: ${content.subject}</h2>
	<h6>글번호: ${content.noticeNo}
	/ 글쓴이: ${content.userId}
	/ 작성일: ${content.regDate}
	</h6>
	<h3>${content.contents}</h3>
	
	<a href="/noticeModify?noticeNo=${content.noticeNo}">수정</a>
	<a href="/notice">목록</a>
	<a href="/noticeDelete?noticeNo=${content.noticeNo}" onclick="return question();">삭제</a>
	
	<form action="/noticeCommentWrite" method="post">
	comment:<input type="text" name="comment" placeholder="댓글을 작성해 보세요">
	<input type="hidden" name="noticeNo" value="${content.noticeNo}">
	<input type="submit" value="작성">
	
	</form>
	
	
	<table>
		<tr><th>댓글</th><th>아이디</th><th>날짜</th></tr>
		<c:forEach items="${content.comments}" var="comment">   
		<!--  items 속성은 반복할 값들이 있는 배열과 리스트명입니다.  var속성은 forEach문 안에서 사용할 배열의 변수명입니다.
		 부가적으로 varStatus속성은 인덱스를 사용할 수 있는 변수명입니다. -->
			<tr>
			<td>${comment.content}</td>
			<td>${comment.userId}</td>
			<td>${comment.regDate}</td>
				
			<td>
				<a href="#" onclick="showModifyComment(this,       
				'${comment.content}',
				'${comment.userId}',
				'${comment.regDate}');">수정</a>
				&nbsp;
				<a href="/deleteComment?commentNo=${comment.commentNo}&noticeNo=${content.noticeNo}" onclick="return question();">삭제</a>
												<!--   &noticeNo   &표시를통해 추가해줌  -->
			</td>
		</tr>
		
		<tr style="display:none;">
			<td>
			<input type="text" size="40" id="modifyMent" value ="${comment.content}">
			</td>
			<td>
				<a href="javascript:void(0)" onclick="modifyComment(this,'${comment.commentNo}');">수정완료</a>
				<a href="#" onclick='modifyCancel(this)'>취소</a>
				</td>
		</tr>
		</c:forEach>
	
		
		
		
		
		
		
		
		
		
		
		<%-- <%for(NoticeComment comment :comments){ %>
		<tr>
			<td><%=comment.getContent() %></td>
			<td><%=comment.getUserId() %></td>
			<td><%=comment.getRegDate() %></td>
			
			<td>
				<a href="#" onclick="showModifyComment(this,       
				'<%=comment.getContent() %>',
				'<%=comment.getUserId() %>',
				'<%=comment.getRegDate() %>');">수정</a>
				&nbsp;
				<a href="/deleteComment?commentNo=<%=comment.getCommentNo() %>&noticeNo=<%=notice.getNoticeNo()%>" onclick="">삭제
												<!--   &noticeNo   &표시를통해 추가해줌  -->
			</td>
		</tr>
		<tr style="display:none;">
			<td>
			<input type="text" size="40" id="modifyMent" value="<%=comment.getContent() %>">
			</td>
			<td>
				<a href="javascript:void(0)" onclick="modifyComment(this,'<%=comment.getCommentNo()%>');">수정완료</a>
				<a href="#" onclick='modifyCancel(this)'>취소</a>
				</td>
		</tr>
		<%} %> --%>
	</table>
		<form action="/modifyComment" id="modifyForm" method="post">
		<input type="hidden" id="modComment" name="modComment"> 
		<input type="hidden" id="modNoticeNo" name="modNoticeNo" value="${content.noticeNo}" >
		<input type="hidden" id="modCommentNo" name="modCommentNo" >
		</form>

	
	<script>
		function question(){
	 		var noticeNo='${content.noticeNo}';
			console.log(noticeNo);
		 
			var result = window.confirm("정말로 삭제 하시겠습니까?");
			if(result){ 
				return true;
			}else{
				return false;
			}
		}
		function showModifyComment(obj, comment, userId, regDate){
			console.log(obj);
			$(obj).parents("tr").next().show();
			$(obj).parents("tr").hide();
		}
		
		function modifyCancel(obj){
			$(obj).parents("tr").prev().show();  //jquery객체화  prev() : 선택된 요소의 같은 레벨(형제)들 중 선택된 요소 이전의 한 개 요소 리턴<br>
			$(obj).parents("tr").hide();
		}
		
		
		function modifyComment(obj, commentNo) {
			var comment=$(obj).parent().prev().find("input").val();
			$("#modCommentNo").val(commentNo);
			$("#modComment").val(comment);
			$("#modNoticeNo").val($("#modNoticeNo").val());
			$("#modifyForm").submit();
		}
		
		
		
		
		
		
		
		
		
	</script>
	
	
	
	
	
	
	
</body>
</html>