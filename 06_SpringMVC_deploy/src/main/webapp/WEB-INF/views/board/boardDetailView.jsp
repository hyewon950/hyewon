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
	<h1 align="center">게시글 상세보기</h1>
	<br>
		
	<table align="center" id="tb" cellpadding="10" cellspacing="0" border="1" width="500">
		<tr align="center" valign="middle">
			<th colspan="2">${board.bId } 번 글 상세보기</th>
		</tr>
		<tr>
			<td height="15" width="70">제목</td>
			<td>${board.bTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${board.bWriter }</td>
		</tr>		
		<tr height="300">
			<td>내용</td>
			<td>${board.bContent }</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<c:if test="${ !empty board.originalFileName }">
					<a href="${contextPath }/resources/buploadFiles/${board.renameFileName }" download>${board.originalFileName }</a>
				</c:if>
			</td>
		</tr>

		<tr>
		<td colspan="2" align="center">
			<c:url var="blist" value="blist.kh">
				<c:param name="page" value="${currentPage }"/>
			</c:url>
			<c:if test="${ loginUser.userId eq board.bWriter }">
				<a href="#">수정하기</a> &nbsp;
				<a href="#">삭제하기</a> &nbsp;
			</c:if>
			<a href="${blist }">목록으로</a>
		</td>

		</tr>
	</table>
	<br>
	<br>
	
	<!-- 댓글 등록  -->
	<table align="center" width="500" border="1" cellspacing="0">
		<tr>
			<td><textarea cols="55" rows="3" id="rContent"></textarea></td>
			<td>
				<button id="rSubmit">등록하기</button>
			</td>
		</tr>
	</table>
	
	
	<!-- 댓글 목록  -->
	<table id="rtb" align="center" width="500" border="1" cellspacing="0">
		<thead>
			<tr>
				<td colspan="2"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	
	
	<script>
		$(function(){
			// 초기 페이지 로딩 시 댓글 불러오기
			getReplyList();
			// ajax polling
			// 타 회원이 댓글들을 작성했을 수 있으니 지속적으로 댓글 불러오기
			setInterval(function() {
				getReplyList();
			}, 10000);

			
		});
		
		// 댓글 등록 ajax
		$("#rSubmit").on("click", function() {
			
			var rContent = $("#rContent").val(); // 댓글의 내용
			var refBid = ${board.bId }; // 어느 게시글의 댓글인지 알려줌
			
			$.ajax({
				url : "addReply.kh",
				data : {rContent:rContent, refBid:refBid},
				type : "post",
				success : function(data) {  //data를 String 으로 받아옴
					if(data == "success") {
						getReplyList();
						$("#rContent").val("");
					}
				}
			});
		});
	C
		
		
		// 댓글 리스트 불러오는 ajax 함수
		function getReplyList(){
			var bId=${board.bId};
			$.ajax({
				url:"rList.kh",
				data:{bId : bId},
				dataType:"json",
				success:function(data){//응답이 오는 데이터는 json형태
					$tableBody=$("#rtb tbody");
					$tableBody.html("");
					
					var $tr;
					var $rWriter;
					var $rContent;
					var $rCreateDate;

					$("#rCount").text("댓글 (" + data.length+")");
					if( data.length > 0 ) {
						for ( var i in data ) {
							$tr = $("<tr>");
							$rWriter = $("<td width='100'>").text(data[i].rWriter);
							$rContent = $("<td>").text(decodeURIComponent(data[i].rContent.replace(/\+/g, " ")));
							$rCreateDate = $("<td width='100'>").text(data[i].rCreateDate);
							
							$tr.append($rWriter);
							$tr.append($rContent);
							$tr.append($rCreateDate);
							$tableBody.append($tr);
						}
					}else {
						$tr = $("<tr>");
						$rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
						
						$tr.append($rContent);
						$tableBody.append($tr);
					}


					}
				
			});
		}
		
		
	</script>
</body>
</html>