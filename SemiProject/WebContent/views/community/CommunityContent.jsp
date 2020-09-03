<%@page import="community.model.vo.Community"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/allCss.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
        ul{
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
        img{
            width: 100%;
            height: 100%;
        }
        .button{
        	width: 100px;
        	height: 30px;
        	letter-spacing: 2px;
        }
    </style>
</head>

<body>
	<jsp:include page="/views/extra/header.jsp"/>
    <header>
    </header>
    <section>
        <div class="container">
            <h3>${content.postKinds }</h3>
            <hr>
            <h2>${content.postSubject }</h2>
			<p style="color:darkgray; font-size:13px;"><b>글번호 : ${content.postNo } 
			작성자 : ${content.postWriter }
			작성일 : ${content.postRegDate}
			조회수 : ${content.postViews}</b></p>
            <hr>
            <article>
            <c:if test="${content.postKinds ne '공지사항'}" >
                <h3>갤러리</h3>
                <div style="justify-content: center;">
                    <ul>
                    <c:forEach items="${images }" var="images" varStatus="index">
                    	<li>
                    	<c:choose>
                    	<c:when test="${empty images.cookImgName}">
                    	<div style="width:200px;height:200px;display:none;"><img src="/img/logo.png"></div></c:when>
                    	<c:when test="${not empty images.cookImgName}">
                    	<div style="width:200px;height:200px;"><img src="/img/${images.cookImgName}"></div>
                    	</c:when>
                    	</c:choose>
                    	</li>
                    </c:forEach>
                    </ul>
                </div>
                </c:if> 
            </article>
               <hr>
            
            <article>
                <p>${content.postContent }</p>
            </article>
         
            
            <hr>
            <div class="button_wrapper">
           	 	<c:if test="${not empty sessionScope.member.mId and sessionScope.member.mId == content.postWriter}">
                <button class = "button"><a href="/modifyCommunity?postNo=${content.postNo }&postWriter=${content.postWriter}">글수정</a></button>
                <button class = "button" onclick="deleteCommunityCheck();"><form id="deleteCommunity" action="/deleteCommunity?">글삭제
                <input type="hidden" name="postKinds" value="${content.postKinds }">
                <input type="hidden" name="postNo" value = "${content.postNo}">
                <input type="hidden" name="postWriter" value="${content.postWriter}">
                </form></button>
                </c:if>
            </div>
            <hr>
            <div class="comment" style="margin-top:10px;">
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
                        <th id="content_regDate" colspan="2">작성일</th>
                    </tr>
                </thead>
                <tbody id = "ments">
                    <c:forEach items ="${content.comment }" var = "comment" varStatus = "i">
                   <tbody id = 'ment_wrapper'>
                    <tr>
                        <td id="content_sub"><pre>${comment.mentContent }</pre></td>
                        <td id="content_writer">${comment.mentWriter }</td>
                        <td id="content_writer">${comment.mentRegDate }</td>
                        <td id="content_contoller">
                        	<c:if test="${sessionScope.member.mId == comment.mentWriter }">
                        		<button class="button" onclick="showModifyComment(this);">댓글수정</button>
                            	<button class="button" onclick="questionCommentDelete(this,'${comment.mentNo}');">댓글삭제</button>
                        	</c:if>
                        </td>
                    </tr>
                    <tr style="display: none;">
						<td> <textarea rows="3" style="float:left; width:80%; margin-left: 80px;" id="modifyMent" >${comment.mentContent}</textarea></td>
						<td id="content_writer">${comment.mentWriter }</td>
                        <td id="content_writer">${comment.mentRegDate }</td>
						<td id="content_contoller"><button class="button" onclick="modifyComment(this,'${comment.mentNo}');">수정완료</button>
							<button class="button" onclick="modifyCancel(this);">취소</button>
						</td>
					</tr>
					    </tbody>
                    </c:forEach>
                   
                </tbody>
            </table>
        </div>

    </section>
    <footer>
    </footer>
    <form action="/modifyComment" method="post" id="modifyForm">
    	<input type="hidden" name="mentContent" id ="mentContent">
    	<input type="hidden" name="mentNo" id = "mentNo" >
    	<input type="hidden" name="postNo" id = "postNo" value="${content.postNo}">
    	<input type="hidden" name="postKinds" id = "postKinds" value="${content.postKinds }">
    </form>
    <form action="/deleteComment" method="post" id="deleteMentForm">
    	<input type="hidden" name="mentNo" id = "deleteMentNo" >
    	<input type="hidden" name="postNo" id = "postNo" value="${content.postNo}">
    	<input type="hidden" name="postKinds" id = "postKinds" value="${content.postKinds }">
    </form>
    <script>
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
            	result += "<td id='content_writer'>"+inputRegDate+"</td>";
            	result += "<td id='content_contoller'><button class='button' onclick='modifyComment(this,"+mentNo+");'>수정완료</button>";
            	result += "&nbsp;<button class='button' onclick='modifyCancel(this);'>취소</button></td></tr></tbody>";
            	$("table").append(result);
				alert("댓글이 등록되었습니다.");
				$("#inputMentContent").val("");
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
					
					result += "<button class='button'  style='margin-right:4px;' onclick='showModifyComment(this);'>댓글수정</button>";
					result += "<button class='button' onclick='questionCommentDelete(this,"+mentNo+");'>댓글삭제</button></td></tr>";
					result += "</tr><tr style='display: none;'>";
					result += "<td><textarea rows='3' style='float:left; width:80%; margin-left: 80px;' id='modifyMent' >"+inputContent+"</textarea></td>";
					result += "<td id='content_writer'>"+inputWriter+"</td>";
	            	result += "<td id='content_writer'>"+inputRegDate+"</td>";
	            	result += "<td id='content_contoller'><button class='button' onclick='modifyComment(this,"+mentNo+");'>수정완료</button>";
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
		function deleteCommunityCheck(){
			var result = window.confirm("정말 게시글을 삭제하시겠습니까?");
			if(result){
				$("#deleteCommunity").submit();
			} else {
				return;
			}
		}
    </script>
    <jsp:include page="/views/extra/footer.jsp" />
</body>
</html>