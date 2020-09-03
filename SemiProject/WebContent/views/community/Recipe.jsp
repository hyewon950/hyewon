<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	 <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet"> 
	 <link rel="stylesheet" href="../../css/allCss.css">
  <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<style>
a{
	
        	color : black;
        }
        a:hover{
        	color : black;
        	text-decoration: none;
        }
        a:viste{
        	color : black;
        }
pre {
	/* border: 1px solid black; */
	overflow : visible;
	font-family: 'Nanum Gothic', sans-serif;
}

hr {
	border: solid 1px lightgray;
}

.container {
	padding: 10px;
}

.container>h3 {
	color: darkturquoise;
}

.button_wrapper {
	text-align: right;
}

#content_no {
	width: 20%;
}

#content_sub {
	width: 65%;
}

 #content_writer {
            width: 10%;
        }
		#content_regDate {
            width: 10%;
        }
        #content_contoller {
            width: 15%;
        }

ul {
	margin-left: 30px;
}

li {
	list-style: none;
	/* 불릿없앰*/
	display: inline-table;
	/* 테이블스타일로배치*/
	padding: 10px;
	/* 안여백은각각10px로*/
}

img {
	width: 100%;
	height: 100%;
}
body{
        font-family: 'Nanum Gothic', sans-serif;
        }
        a{
        	color : black;
        }
        a:hover{
        	color : black;
        	text-decoration: none;
        }
        a:viste{
        	color : black;
        }
        
</style>
</head>

<body>
<jsp:include page="/views/extra/header.jsp"/>
	<header> </header>
	<section>
		<div class="container" style="margin: auto">
			<h3>레시피게시판</h3>
			<hr>
			<h2>${content.postSubject }</h2>
			<p style="color:darkgray; font-size:13px;"><b>글번호 : ${content.postNo } 
			작성자 : ${content.postWriter }
			작성일 : ${content.postRegDate}
			조회수 : ${content.postViews}</b></p>
			<hr>
			<section>
				<div class="row" style="margin: auto; height: 300px;">
					<div class="col-4" id="imgArea">
					<c:choose>
						<c:when test="${not empty image }">
						<img src="/img/${image.cookImgName}">
						</c:when>
						<c:otherwise>
						<img src="/img/logo.png">
						</c:otherwise>
					</c:choose>
						
					</div>
					<div class="col-8" style="padding: 30px;">
						<div>
							<h4>요리설명</h4>
							<br>
							<h5><pre>${content.postContent }</pre></h5>
						</div>
						<div style="margin-top: 30px;">
							<h6>재료</h6>
							<pre>${step[0].cookContents }</pre>
						</div>
					</div>
				</div>

			</section>
			<br>
			<hr style="clear: left;">

			<article>
				<div>
				<c:forEach items ="${step}" var = "step" varStatus = "i" >
					<c:if test="${i.index >0 }" >
					<div style="padding: 30px">
						<h3>단계${i.index }</h3>
						<h5><pre>${step.cookContents }</pre></h5>
					</div>
					</c:if>
					
				</c:forEach>
				
			</article>


			<div class="button_wrapper">
				<c:if test="${not empty sessionScope.member.mId and sessionScope.member.mId == content.postWriter}">
				<button class="button"><a href="/modifyRecipe?postNo=${content.postNo}">글수정</a></button>
				<button class="button" onclick="deleteRecipe();">글삭제</button>
				</c:if>
			</div>
			<hr>
			<div class="comment" style="margin-top: 10px;">
				<textarea rows="3" style="float:left; width:80%; margin-left: 80px;" name = "mentContent" id = "inputMentContent"></textarea>
       				<input type="hidden" name="postKinds" id = "postKinds" value="${content.postKinds }">
                    <input type="hidden" value = "${content.postNo}" name = "postNo" id = "inputMentNo">
                    <input class="button" type="button" value="등록하기" style="margin:5px;" id="writeComment">
			</div>
			<br>
			<hr>
			<table class="table">
				<thead>
					<tr>

						<th id="content_sub">글 내용</th>
						<th id="content_writer">작성자</th>
						<th id="content_writer" colspan="2">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${content.comment }" var="comment" varStatus="i">
					<tbody>
						<tr>
							<td id="content_sub"><pre>${comment.mentContent }</pre></td>
							<td id="content_writer">${comment.mentWriter }</td>
							<td id="content_regDate">${comment.mentRegDate }</td>
							<td id="content_contoller"><c:if
									test="${sessionScope.member.mId == comment.mentWriter }">
									<button class="button"
										onclick="showModifyComment(this);">댓글수정</button>
									<button class="button" onclick="questionCommentDelete(this,'${comment.mentNo}');">댓글삭제</button>
								</c:if></td>
						</tr>
						<tr style="display: none;">
							<td><textarea rows="3"
									style="float: left; width: 80%; margin-left: 80px;"
									id="modifyMent">${comment.mentContent}</textarea></td>
							<td id="content_writer">${comment.mentWriter }</td>
							<td id="content_writer">${comment.mentRegDate }</td>
							<td><button class="button"
									onclick="modifyComment(this,'${comment.mentNo}');">수정완료</button>
								<button class="button" onclick="modifyCancel(this);">취소</button></td>
						</tr>
						</tbody>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</section>
	<footer> </footer>
	<form action="/modifyComment" method="post" id="modifyForm">
		<input type="hidden" name="mentContent" id="mentContent"> <input
			type="hidden" name="mentNo" id="mentNo"> <input
			type="hidden" name="postNo" id="postNo" value="${content.postNo}">
			<input type="hidden" name="postKinds" id = "postKinds" value="${content.postKinds}">
	</form>
	<form action="/deleteComment" method="post" id="deleteMentForm">
		<input type="hidden" name="mentNo" id="deleteMentNo"> <input
			type="hidden" name="postNo" id="postNo" value="${content.postNo}">
			<input type="hidden" name="postKinds" id = "postKinds" value="${content.postKinds}">
	</form>
	<form action="/deleteRecipe" method="post" id="deleteRecipeForm">
		<input type="hidden" name="filePath" id="filePath" value ="${image.cookImgPath }"> 
		<input type="hidden" name="postNo" id="postNo" value="${content.postNo}">
	</form>
	<script type="text/javascript">
		function deleteRecipe(){
			var result = window.confirm("정말 게시글을 삭제하시겠습니까?");
			if(result){
				$("#deleteRecipeForm").submit();
			} else {
				return;
			}
		}
		 $("#writeComment").click(function() {
		    	var mentContent = $("#inputMentContent").val();
				var postNo = $("#inputMentNo").val();
				$.ajax({
					url:"/writeComment",
					type:"post",
					data:{
						mentContent:mentContent,
						postNo:postNo
					},
					success:function(data){
						var inputContent = decodeURIComponent(data.content);
						var inputWriter = decodeURIComponent(data.writer);
						var inputRegDate = decodeURIComponent(data.regDate);
						var mentNo = data.mentNo;
						var result = "<tbody id = 'ment_wrapper'><tr><td id='content_sub'><pre>"+inputContent+"</pre></td>";
						result += "<td id='content_writer'>"+inputWriter+"</td>";
						result += "<td id='content_writer'>"+inputRegDate+"</td>";
						result += "<td id='content_contoller'>";
						
						result += "<button class='button' style='margin-right:4px;' onclick='showModifyComment(this);'>댓글수정</button>";
						result += "<button class='button' onclick='questionCommentDelete(this,"+mentNo+");'>댓글삭제</button></td></tr>";
						result += "</tr><tr style='display: none;'>";
						result += "<td><textarea rows='3' style='float:left; width:80%; margin-left: 80px;' id='modifyMent' >"+inputContent+"</textarea></td>";
						result += "<td id='content_writer'>"+inputWriter+"</td>";
		            	result += "<td id='content_regDate'>"+inputRegDate+"</td>";
		            	result += "<td><button class='button' onclick='modifyComment(this,"+mentNo+");'>수정완료</button>";
		            	result += "&nbsp;<button class='button' onclick='modifyCancel(this);'>취소</button></td></tr></tbody>";
		            	$("table").append(result);
		            	alert("댓글이 등록되었습니다.");
					},
					error:function(data){
						console.log("댓글등록 실패");
						alert("로그인 후 댓글등록이 가능합니다.");
						location.href="/views/extra/loginPage.jsp";
					}
				});
			});

		    function questionCommentDelete(obj,mentNo){
				var result = window.confirm("정말로 댓글삭제를 하시겠습니까?");
				if(result){
					$.ajax({
						url:"/deleteComment",
						type:"post",
						data:{
							mentNo:mentNo
						},
						success:function(data){
							
			            	$(obj).parents("tbody").eq(0).remove();
			            	alert("댓글이 삭제되었습니다.");
						},
						error:function(data){
							console.log("댓글삭제 실패");
						}
					});
				}else{
					console.log("취소");
				}
			}
		function showModifyComment(obj) {
			console.log(obj);
			$(obj).parents("tr").next().show();
			$(obj).parents("tr").hide();
		}
		function modifyCancel(obj) {
			console.log(obj);
			$(obj).parents("tr").prev().show();
			$(obj).parents("tr").hide();
		}
		function modifyComment(obj, commentNo) {
			var comment = $(obj).parent().prevAll().eq(2).children("textarea").val();
			$.ajax({
				url:"/modifyComment",
				type:"post",
				data:{
					mentContent:comment,
					mentNo:commentNo
				},
				success:function(data){
					console.log("성공?");
					var inputContent = decodeURIComponent(data.content);
					var inputWriter = decodeURIComponent(data.writer);
					var inputRegDate = decodeURIComponent(data.regDate);
					var mentNo = data.mentNo;
					var result = "<tr><td id='content_sub'><pre>"+inputContent+"</pre></td>";
					result += "<td id='content_writer'>"+inputWriter+"</td>";
					result += "<td id='content_writer'>"+inputRegDate+"</td>";
					result += "<td id='content_contoller'>";
					
					result += "<button class='button' style='margin-right:4px;' onclick='showModifyComment(this);'>댓글수정</button>";
					result += "<button class='button' onclick='questionCommentDelete(this,"+mentNo+");'>댓글삭제</button></td></tr>";
					result += "</tr><tr style='display: none;'>";
					result += "<td><textarea rows='3' style='float:left; width:80%; margin-left: 80px;' id='modifyMent' >"+inputContent+"</textarea></td>";
					result += "<td id='content_writer'>"+inputWriter+"</td>";
	            	result += "<td id='content_regDate'>"+inputRegDate+"</td>";
	            	result += "<td><button class='button' onclick='modifyComment(this,"+mentNo+");'>수정완료</button>";
	            	result += "&nbsp;<button class='button' onclick='modifyCancel(this);'>취소</button></td></tr>";
	            	console.log($(obj).parents("tbody").eq(0));
	            	$(obj).parents("tbody").eq(0).html(result);
	            	modifyCancel(obj);
	            	alert("댓글이 수정되었습니다.");
				},
				error:function(data){
					console.log("댓글등록 실패");
				}
			});
			
		}
	</script>
</body>
</html>