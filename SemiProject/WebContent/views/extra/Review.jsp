<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

#wrapper {
	width: 1200px;
	padding: 10px;
	position: absolute;
	top: 130px;
	left: 50%;
	margin-left: -538px;
}

#sidebar {
	width: 220px;
	float: left;
	padding: 10px;
}

#contents {
	border: 1px solid #dfe1e5;
	border-radius: 10px;
	width: 920px;
	height: 500px;
	float: left;
	padding: 10px;
	margin-left: 10px;
	margin-top: 1%;
}

.logo {
	font-size: 50px;
	/*text-shadow: 0 0 10px #666;*/
	color: #01DFA5;
	margin-top: 20px;
	margin-left: 100px;
	text-align: left;
	/*text-transform: capitalize;*/
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 200px;
	background-color: #01DFA5;
	line-height: 5em;
	text-align: center;
}

li a {
	display: block;
	color: #000;
	padding: 8px 16px;
	text-decoration: none;
}

li a.active {
	background-color: #660099;
	color: white;
}

li






 






a












:hover












:not






 






(
.active






 






)
{
background-color












:






 






#660099












;
color












:






 






white












;
text-decoration












:






 






none












;
border-radius












:






 






10
px












;
}
#carouselExampleControls {
	background-color: gray;
}

.pagination li a:hover {
	background-color: white;
	color: black;
	border-radius: 0px;
}

#test {
	height: 200px;
}

.info {
	width: 300px;
	height: 35px;
}
</style>
</head>
<body>
	<header>
		<h1 class="logo">Farm's</h1>
	</header>

	<div id="wrapper">
		<div id="sidebar">
			<ul style="border: 1px solid #dfe1e5; border-radius: 10px;">
				<li><a href="/myInfo?mId=${sessionScope.member.mId}">회원정보 조회</a></li>
				<li><a href="/views/extra/memberModify.jsp">회원정보 수정</a></li>
				<li><a href="ReviewWriter.jsp">리뷰작성</a></li>
				<li><a href="/views/extra/searchBasket.jsp">장바구니 조회</a></li>
				<li><a href="/views/extra/searchBuy.jsp">구매내역 조회</a></li>
				<li><a href="/views/extra/MemberDelete.jsp">회원탈퇴</a></li>
			</ul>
		</div>
		<form action="#" method="post" id="infoForm">
			<div id="contents">
				<div style="margin-left: 10%; margin-top: 3%;">
					내가 작성한 리뷰
					<table style="border: 1px solid; width: 730px;">
						<!-- C태그 이용해서 데이터 가져와서 for문 돌릴예정 -->
						<tr>
							<td><a href="#">게시글 제목 1번</a></td>
							<td><a href="#">게시글 제목 6번</a></td>
						</tr>
						<tr>
							<td><a href="#">게시글 제목 2번</a></td>
							<td><a href="#">게시글 제목 7번</a></td>
						</tr>
						<tr>
							<td><a href="#">게시글 제목 3번</a></td>
							<td><a href="#">게시글 제목 8번</a></td>
						</tr>
						<tr>
							<td><a href="#">게시글 제목 4번</a></td>
							<td><a href="#">게시글 제목 9번</a></td>
						</tr>
						<tr>
							<td><a href="#">게시글 제목 5번</a></td>
							<td><a href="#">게시글 제목 10번</a></td>
						</tr>
					</table>
					<nav>
						<ul class="pagination"
							style="background-color: white; width: 240px; margin-left: 30%;">
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
					구매한 제품 리뷰 작성
					<div id="carouselExampleControls" class="carousel slide"
					
						data-ride="carousel"
						style="width: 700px; height: 160px padding: 30;">

						<div class="carousel-inner">
							<div class="carousel-item active" id="test"
								style="padding: 30; height: 160px">
								<img src="img/${sList[0].saleImgName }" width="700" height ="160">
							</div>
							<c:forEach items="${sList }" var="sale" varStatus="i">
								<c:if test="${i.index != 0 }">
									<div class="carousel-item id=" test" style="padding: 30">
										<img src="img/${sale.saleImgName }" width="700"  height ="160">
									</div>
								</c:if>
							</c:forEach>


						</div>
						<a class="carousel-control-prev" href="#carouselExampleControls"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExampleControls"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>

				</div>
		</form>
	</div>
</html>