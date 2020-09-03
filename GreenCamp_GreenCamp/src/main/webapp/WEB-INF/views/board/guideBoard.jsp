<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>가이드 게시판</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="../../../../resources/css/nav.css" />



<style>
#searchtext {
	margin: 10px 20px;
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

thead {
	background: #b1ddab;
}

tr:nth-child(2n) {
	background-color: #f9f9fa
}

.form-inline, #btn1, #search {
	float: right;
}

#btn1 {
	background: #b1ddab;
}

#btn1:hover, #search:hover {
	background: #9dcc97;
}

.menu p {
	cursor: pointer;
	width: 70px;
}

.menu .hide {
	display: none;
}

.nav-tabs {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.nav-item>a:link, a:visited {
	display: block;
	font-weight: bold;
	color: black;
	background-color: #b1ddab;
	width: 475.7px;
	text-align: center;
	padding: 7px;
	text-decoration: none;
	text-transform: uppercase;
}

.nav-link:hover {
	background-color: #a6ecb6;
	font-size: 1.0em;
	color: white;
}

a {
	font-size: 1.0em;
}

i {
	margin: 0 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

#ViewCount {
	position: relative;
	left: -30px;
}

#boardbRecom {
	position: relative;
	left: 50px;
}
</style>
</head>
<body>
	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	<br>
	<br>
	<br>

	<header id="header">
		<div class="myPage">
			<div>
				<h1 id="BoardName">가이드 게시판</h1>
			</div>
		</div>
	</header>
	<br>


	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="plist.do">용품 추천 게시판</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="glist.do">가이드 게시판</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="rlist.do">레시피 게시판</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="flist.do">자유 게시판</a></li>
	</ul>
	<div class="container">
		<br> <br> <br>

		<div id="searchArea" align="center">
			<form class="form-inline text-center" id="test" action="bsearch.do"
				name="searchForm" method="get">
				<select id="searchCondition" name="searchCondition">
					<option value="all"
						<c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
					<option value="writer"
						<c:if test="${search.searchCondition == 'writer' }">selected</c:if>>작성자</option>
					<option value="title"
						<c:if test="${search.searchCondition == 'title' }">selected</c:if>>제목</option>
					<option value="category"
						<c:if test="${search.searchCondition == 'category' }">selected</c:if>>카테고리</option>
				</select> <input id="searchtext" type="text" name="searchValue"
					class="form-control mr-sm-2" value="${search.searchValue }">
				<input type="hidden" name="boardType" value="가이드" />
				<button id="search" class="btn btn-primary" type="submit">검색</button>
			</form>
		</div>
		<br> <br> <br>



		<table class="table rwd-table" style="text-align: center">
			<thead>
				<tr>
					<th>글번호</th>
					<th>카테고리</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${list }">
					<%-- <c:if test="${board.bType eq '가이드'}"> --%>
					<tr>
						<td>${board.bNo }</td>
						<td>${board.bType}</td>
						<td><c:url var="detail" value="detailBoard.do">
								<c:param name="bNo" value="${board.bNo }" />
								<c:param name="page" value="${pi.currentPage }" />
								<c:param name="boardType" value="가이드" />
							</c:url> <a href="${detail }">${board.bTitle }</a> <br>
								<a class="fas fa-eye" id="ViewCount">${board.bViewCnt }</a>
							<a class="fas fa-thumbs-up" id="boardbRecom">${board.bLikeCnt}</a>
							</td>
						<td>${board.mId }</td>
						<td>${board.bDate }</td>
					</tr>
					<%-- </c:if> --%>
				</c:forEach>
			</tbody>
			<!-- 페이징 처리 -->
			<tr align="center" height="20">
				<td colspan="6">
					<!-- [이전] --> <c:if test="${pi.currentPage <= 1 }">
						[이전] &nbsp;
						</c:if> <c:if test="${pi. currentPage > 1 }">
						<c:url var="before" value="glist.do">
							<c:param name="page" value="${pi.currentPage - 1 }" />
						</c:url>
						<a href="${before }">[이전]</a> &nbsp;
		
						</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
						end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<font color="red" size="4"><b>[${p }]</b></font>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="pagination" value="glist.do">
								<c:param name="page" value="${p }" />
							</c:url>
							<a href="${pagination }">${p }</a> &nbsp;
							</c:if>
					</c:forEach> <!-- [다음] --> <c:if test="${pi.currentPage >= pi.maxPage }"> [다음] &nbsp; </c:if>
					<c:if test="${pi. currentPage < pi.maxPage }">
						<c:url var="after" value="glist.do">
							<c:param name="page" value="${pi.currentPage + 1 }" />
						</c:url>
						<a href="${after }">[다음]</a> &nbsp;
						</c:if>
				</td>
			</tr>
		</table>


		<br>

		<c:url var="writeViewBoard" value="writeViewBoard.do">
			<c:param name="bType" value="${bType }" />
		</c:url>
		<a id="btn1" class="btn btn-primary btn-md" href="${writeViewBoard}">글쓰기</a>
	</div>
<br><br><br>
	<script>
			//페이지 로딩시 좋아요 개수 나타남
			$(function() {
				getRecommCount();
			});

			 //좋아요 갯수 가져오는
			function getRecommCount() {
				var bNo = $
				{
					board.bNo
				}
				;
				$.ajax({
					url : "boardlikecount.do",
					type : "POST",
					data : {
						bNo : bNo
					},
					success : function(data) { //data를 String 으로 받아옴
						$("#boardbRecom").html(data);
					}
				});
			}
		</script>


	</section>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>