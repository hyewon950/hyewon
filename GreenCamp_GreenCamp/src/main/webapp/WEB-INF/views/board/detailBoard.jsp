<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>게시글 상세보기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="../../../../resources/css/nav.css" />
<style>
#main {
	background: #fff;
	border-top: solid 5px #b1ddab;
	/*        border-bottom: solid 5px #c1cac5;*/
	border-top-width: 35px;
	/*        border-bottom-width: 10px;*/
	padding: 6em 0 6em 0;
}

#header .myPage {
	position: relative;
	text-align: center;
	border-top: solid 5px #e7eae8;
	top: 0.65em;
}

#header .myPage div {
	background: #fff;
	position: relative;
	display: inline-block;
	padding: 0 1.5em 0 1.5em;
	top: -1.5em;
}

#header .myPage h1 {
	display: inline;
	color: #787777;
}

#btn1, #btn2 {
	position: relative;
	left: 1000px;
	bottom: 45px;
}

#btn3 {
	float: right;
	position: relative;
	left: 230px;
}

.row {
	height: 100px;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid #e3e6f0;
	border-radius: 0.35rem;
	box-sizing: border-box;
	height: auto;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
	padding: 1.25rem;
}

.container-card {
	padding: 30px 5px 50px 10px;
	border: 1px solid lightgray;
	margin: 18px 5px 7px 0px;
	box-sizing: border-box;
	position: relative;
	left: 150px
}

.card {
	margin: 18px 5px 7px 10px;
	/* padding: 1px 1px 2px 8px;*/
}

#comdate {
	text-decoration-color: lightgray;
}

.comdate {
	text-decoration: none;
	color: silver;
	pointer-events: none;
}

.card bg-light {
	box-sizing: border-box;
}

.search-input {
	position: relative;
	left: 50px;
	bottom: 132px;
	float: right;
	font-size: 20px;
	width: 120px;
	height: 125px;
}

#updatecomplete {
	position: relative;
	bottom: 55px;
	left: 80px;
	font-size: 20px;
	width: 120px;
	height: 125px;
}

.insertcomment {
	background-color: whitesmoke;
	padding: 20px;
	height: 250px;
}

textarea {
	margin: 0;
}

.btn-comment {
	float: right;
	width: 126px;
	height: 126px;
	background: #ddd;
	border: 0px solid;
	border-radius: 10px;
	color: #005792;
	font-weight: 600;
	font-family: sans-serif;
}

.btn-comment:hover {
	box-shadow: 1px 1px 3px 1px rgba(148, 148, 148, 1);
}
.btn-update {
    float: left;
    position: absolute;
    font-family: sans-serif;
    font-weight: 600;
    color: #005792;
    border: 0px solid;
    border-radius: 10px;
    background: #ddd;
    width: 60px;
}

.btn-update:hover {
	box-shadow: 1px 1px 3px 1px rgba(148, 148, 148, 1);
}

.btn-delete {
    float: left;
    position: absolute;
    left: 250px;
    font-family: sans-serif;
    font-weight: 600;
    color: #005792;
    border: 0px solid;
    border-radius: 10px;
    background: #ddd;
    width: 60px;
}

.btn-delete:hover {
	box-shadow: 1px 1px 3px 1px rgba(148, 148, 148, 1);
}


</style>
</head>
<body>

	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	<br>
	<br>


	<header id="header">
		<div class="myPage">
			<div>
				<h1 id="BoardName">
					<c:out value='${boardType }'></c:out>
					게시글
				</h1>
			</div>
		</div>
	</header>
	<br>

	<section id="main">
		<div class="container"display:table-cell; vertical-align:middle;>

			<h2>
				<strong>${board.bTitle }</strong>
			</h2>
			<c:if test="${loginUser.mId eq board.mId}">
				<c:url var="moveUpdate" value="/moveUpdate.do">
					<c:param name="bNo" value="${board.bNo }" />
				</c:url>
				<a class="btn btn-info" id="btn1" href="${moveUpdate}">수정하기</a>

				<c:url var="deleteBoard" value="deleteBoardboard.do">
					<c:param name="bNo" value="${board.bNo }" />
					<c:param name="bType" value="${board.bType }" />
				</c:url>
				<a class="btn btn-secondary" id="btn2" href="${deleteBoard}">삭제하기</a>
			</c:if>
			<table class="table table-borderless" style="width: 600px">


				<tr>
					<th>작성자 :</th>
					<td>${board.mId }</td>
					<th>작성일 :</th>
					<td>${board.bDate }</td>
					<th>조회수 :</th>
					<td>${board.bViewCnt }</td>
					<th>추천수</th>
					<td><p id="likeCnt">${board.bLikeCnt }</p>
					<td><a id="likeBtn" onclick="like()"><img src="../../resources/css/board/Like.png" alt="추천하기"style="width:15px;height:15px;"></a></td>
				</tr>

			</table>
			
			<script>
			var bNo=${board.bNo};
			function like(){
				
				console.log(bNo);
				
			 $.ajax({
	              url : "upRecommend.do",
	              data: {"bNo":bNo},
	              type : "post",
	              success : function(data) { //data를 String으로 받아옴, 단순 결과값만 받아오는 거기때문에 String
	                 if(data != "fail") { //결과값이 success이면
	                	 $("#likeCnt").html(data);
	                 }
	              }
	           }); 
			}
			
			</script>
			<div>

				<c:forEach var="boardFile" items="${BoardFile }">
					<img
						src="/resources/${board.mId }/uploadFiles/${boardFile.fileName }"
						class="rounded" width="500" height="400">
				</c:forEach>
			</div>

			<br>
			<br>
			<h5>${board.bDetail }</h5>

			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<button type="button" class="btn btn-secondary" id="btn3">목록으로</button>
		</div>
		

				<script>
				
				
				if('${boardType}'=="용품"){
					$("#btn3").click(function(){
						location.href="plist.do";
						})
				}	
				else if('${boardType}'=="레시피"){
					$("#btn3").click(function(){
						location.href="rlist.do";
						})
				}
				else if('${boardType}'=="가이드"){
					$("#btn3").click(function(){
						location.href="glist.do";
						})
				}
				else if('${boardType}'=="자유"){
					$("#btn3").click(function(){
						location.href="flist.do";
						})
				}
				
				</script>
		<!-- 댓글테이블 -->
		<br>
		<br>

		<div class="row">
			<div class="col-sm-12">

				<c:forEach var="commentList" items="${commentList }">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">
								<b> ${commentList.commentWriter } </b> <span
									class="glyphicon glyphicon-time"> <a class="comdate">
										${commentList.commentDate }</a></span> <input type="hidden" name="commentNo" value="${commentList.commentNo }" />
										<button type="button" class="btn-update" style="text-size:1px;" onclick="modifyboard(this)">수정</button>
										<button type="button" class="btn-delete" style="text-size:1px;" onclick="deleteboard(this)">삭제</button>
							</h5>
							<p class="card-text">${commentList.comment }</p>
						</div>
					</div>
				</c:forEach>

				<hr>
				<!--댓글작성-->
				<div class="insertcomment">

					<div class="card-body">
						<div class="col-12">
							<textarea cols="200" rows="5" placeholder="댓글을 입력해주세요."
								id="rContent"></textarea>
						</div>
						<div class="col-12" style="float: right">
							<button type="submit" class="search-input btn-comment" value="등록"
								style="text-size: 1px;" id="commentButton" btype="${boardType }">등록</button>
							<!--<input type="submit" class="search-input" value="등록" style="text-size:1px;" >-->
						</div>

					</div>
				</div>
			</div>
		</div>

	</section>
	<script>
    $(function(){
        // 댓글 등록 ajax
        $("#commentButton").on("click", function() {
           
           var comment = $("#rContent").val(); // 댓글의 내용
           var bNo = ${board.bNo }; // 어느 게시글의 댓글인지 알려줌
           
           $.ajax({
              url : "addBoardComment.do",
              data : {comment:comment, bNo:bNo,},
              type : "post",
              success : function(data) { //data를 String으로 받아옴, 단순 결과값만 받아오는 거기때문에 String
                 if(data == "success") { //결과값이 success이면
                	 location.reload();
                 }
              }
           });
        });        
     });
    
	
    
    function deleteboard(obj) {
    	var commentNo = $(obj).closest('div.card-body').find("input[name=commentNo]").val();
    	commentNo = Number(commentNo);
    	
    	$.ajax({
    		url : "/deleteBoardComment.do",
			data : {commentNo : commentNo},
			type : "post",
			async: false,
			success : function(data) {
				if(data == "success") {
					$(obj).closest('div').css('transition', 'opacity 0.5s linear').css('opacity', '0');
					setTimeout(function() {
						$(obj).closest("div.card").remove();						
					},550);
				} else {
					alert("삭제 실패!!");
				}
			}, error : function(xhr, status, error) {
				alert("[ERROR] " + xhr.status + " " +  xhr.statusText);
			}
    	});
    }
    
    function modifyboard(obj) {
    	var text = $(obj).closest('div.card-body').find('p.card-text').html();
    	
    	$(obj).closest('div.card-body').find('p.card-text').css('display', 'none');
    	$(obj).closest('div.card-body').append('<textarea cols="200" rows="5" placeholder="댓글을 입력해주세요." name="fixText" style="margin:0;">'+text+'</textarea>');
     	$(obj).closest('div.card-body').append('<button type="button" class="btn-comment" style="text-size:1px;" name="updatecomplete" onclick="modifysave(this)">수정완료</button>');
    }
	
	function modifysave(obj) {
		var modifyComment = $(obj).closest('div.card-body').find("textarea[name=fixText]").val(); // 수정된 댓글 내용
		var commentNo = $(obj).closest('div.card-body').find("input[name=commentNo]").val(); // commentNo값
		commentNo = Number(commentNo);
		
		$.ajax({
			url: "/updateBoardComment.do",
			data: {modifyComment : modifyComment, commentNo : commentNo}, // 수정된 내용이랑 commentNo값 
			type: "post",
			async: false,
			success : function(data) { //data를 String으로 받아옴, 단순 결과값만 받아오는 거기때문에 String
				if(data == "success") { // 성공하면 밑에 내용 실행
					$(obj).closest('div.card-body').find("p.card-text").html(modifyComment).css("display", "block");
					$(obj).closest('div.card-body').find("textarea[name=fixText]").remove(); // input name이 fixText를 찾아서 제거한다(?)
					$(obj).closest('div.card-body').find("button[name=updatecomplete]").remove(); 
				} else {
					alert("수정 실패!!");
				}
			}, error : function(xhr, status, error) {
				alert("[ERROR] " + xhr.status + " " +  xhr.statusText);
			}
		});
	}
	</script>
</body>
</html>