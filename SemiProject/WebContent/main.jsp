<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<title>내 손 안의 농장, Farm's</title>
<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
}

a {
	color: black;
}

a:hover {
	color: black;
	text-decoration: none;
}

a:viste {
	color: black;
}

.row {
	margin: 5px;
	padding: 5px;
}

li {
	list-style: none;
	/* 불릿없앰*/
	display: inline-table;
	/* 테이블스타일로배치*/
	padding: 10px 20px;
	/* 안여백은각각10px로*/
}

.container li:hover{
	-ms-transform: scale(1.1);
 	-webkit-transform: scale(1.1);
 	transform: scale(1.1);
}

#subject {
	/* color : #FACC2E; */
	text-align: center;
	padding: 50px 0;
}

div.card-body {
	background-color: F8F8F8;
}

b.card-title {
	padding: 50px 0;
	text-align: center;
	font-size: 16px;
}

/* #textBox {
    		background: lightgray;
    		width: 300px;
    		height : 200px;
    } */
</style>
</head>

<body>
	<jsp:include page="/views/extra/header.jsp"/>

<!-- 	<br><br><br> -->
	<!--  Best 상품 이미지 캐러셀 -->
	<div id="bestProduct" class="carousel slide carousel-fade"ndata-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<a href="/productDetail?saleNo=2&prdClass=%EC%B1%84%EC%86%8C">
					<img src="/img/corn_big3.jpg" class="d-block w-100" alt="옥수수">
				</a>
			</div>
			<div class="carousel-item">
				<a href="/productDetail?saleNo=9&prdClass=%EA%B3%BC%EC%9D%BC">
					<img src="/img/tomato_big3.jpg" class="d-block w-100" alt=토마토">
				</a>
			</div>
			<div class="carousel-item">
				<a href="/productDetail?saleNo=8&prdClass=%EC%B1%84%EC%86%8C">
					<img src="/img/potato_big3.jpg" class="d-block w-100" alt="...">
				</a>
			</div>
		</div>
		<a class="carousel-control-prev" href="#bestProduct" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a> 
		<a class="carousel-control-next" href="#bestProduct" role="button" data-slide="next"> 
			<span class="carousel-control-next-icon" aria-hidden="true"></span> 
			<span class="sr-only">Next</span>
		</a>
	</div>
	
	<div class="container">
		<section>

			<br>
			<h3 id="subject"><b>베스트 스토리</b></h3>
			<div style="justify-content: center;">
				<ul>
					<li>
						<a href="/communityContent?postNo=${communityStoryList[0].postNo }&postKinds=${communityStoryList[0].postKinds}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty bestStoryImage[0].getCookImgName()}">
										<img src="/img/logo_bg.jpg" alt="상품 이미지 없음" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty bestStoryImage[0].getCookImgName()}">
										<img src="/img/${bestStoryImage[0].getCookImgName()}" width="300px" height="300px" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"><c:out value="${communityStoryList[0].postSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="/communityContent?postNo=${communityStoryList[1].postNo }&postKinds=${communityStoryList[1].postKinds}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty bestStoryImage[1].getCookImgName()}">
										<img src="/img/logo_bg.jpg" alt="상품 이미지 없음" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty bestStoryImage[1].getCookImgName()}">
										<img src="/img/${bestStoryImage[1].getCookImgName()}" width="100%" height="100%" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"><c:out value="${communityStoryList[1].postSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="/communityContent?postNo=${communityStoryList[2].postNo }&postKinds=${communityStoryList[2].postKinds}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty bestStoryImage[2].getCookImgName()}">
										<img src="/img/logo_bg.jpg" alt="상품 이미지 없음" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty bestStoryImage[2].getCookImgName()}">
										<img src="/img/${bestStoryImage[2].getCookImgName()}" width="100%" height="100%" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"><c:out value="${communityStoryList[2].postSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div><br>
		</section>
	</div> <!--  컨테이너 끝 수정함 -->

	<!-- <br><hr> -->

	<section>
		<div style="justify-content: center; background-color: #f7f7f7">
			<div class="container">
				<h3 id="subject"><b>베스트 레시피</b></h3>
				<ul>
					<li>
						<a href="/communityContent?postNo=${communityRecipeList[0].postNo }&postKinds=${communityRecipeList[0].postKinds}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty bestRecipeImage[0].getCookImgName()}">
										<img src="/img/logo_bg.jpg" alt="상품 이미지 없음" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty bestRecipeImage[0].getCookImgName()}">
										<img src="/img/${bestRecipeImage[0].getCookImgName()}" width="300px" height="300px" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"><c:out value="${communityRecipeList[0].postSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="/communityContent?postNo=${communityRecipeList[1].postNo }&postKinds=${communityRecipeList[1].postKinds}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty bestRecipeImage[1].getCookImgName()}">
										<img src="/img/logo_bg.jpg" alt="상품 이미지 없음" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty bestRecipeImage[1].getCookImgName()}">
										<img src="/img/${bestRecipeImage[1].getCookImgName()}" width="300px" height="300px" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"><c:out value="${communityRecipeList[1].postSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="/communityContent?postNo=${communityRecipeList[2].postNo }&postKinds=${communityRecipeList[2].postKinds}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty bestRecipeImage[2].getCookImgName()}">
										<img src="/img/logo_bg.jpg" alt="상품 이미지 없음" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty bestRecipeImage[2].getCookImgName()}">
										<img src="/img/${bestRecipeImage[2].getCookImgName()}" width="300px" height="300px" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"><c:out value="${communityRecipeList[2].postSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div><br><br>
		</div>
	</section>

	<!-- <br><hr> -->
	<div class="container">
		<section>
			<h3 id="subject"><b>베스트 농산물</b></h3>
			<div style="justify-content: center;">
				<ul>
					<li>
						<a href="/productDetail?saleNo=${saleList[0].saleNo}&prdClass=${saleList[0].prdClass}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty bestImage[0].getSaleImgName()}">
										<img src="/img/logo_bg.jpg" class="d-block w-100" alt="상품 이미지 없음" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty bestImage[0].getSaleImgName()}">
										<img src="/img/${bestImage[0].getSaleImgName() }" width="300px" height="300px" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"> <c:out value="${saleList[0].saleSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
					<li>
					<a href="/productDetail?saleNo=${saleList[1].saleNo}&prdClass=${saleList[1].prdClass}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty bestImage[1].getSaleImgName()}">
										<img src="/img/logo_bg.jpg" class="d-block w-100" alt="상품 이미지 없음" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty bestImage[1].getSaleImgName()}">
										<img src="/img/${bestImage[1].getSaleImgName() }" width="300px" height="300px" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"> <c:out value="${saleList[1].saleSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="/productDetail?saleNo=${saleList[2].saleNo}&prdClass=${saleList[2].prdClass}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty bestImage[2].getSaleImgName()}">
										<img src="/img/logo_bg.jpg" class="d-block w-100" alt="상품 이미지 없음" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty bestImage[2].getSaleImgName()}">
										<img src="/img/${bestImage[2].getSaleImgName() }" width="300px" height="300px" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"> <c:out value="${saleList[2].saleSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div><br><br>
		</section>
	</div>


	<!-- <br><hr> -->
	<section>
		<div style="justify-content: center; background-color: #f7f7f7">
			<div class="container">
				<h3 id="subject"><b>새로 입고된 상품</b></h3>
				<ul>
					<li>
						<a href="/productDetail?saleNo=${recentSale[0].saleNo}&prdClass=${recentSale[0].prdClass}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty saleNewImage[0].getSaleImgName()}">
										<img src="/img/logo.png" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty saleNewImage[0].getSaleImgName()}">
										<img src="/img/${saleNewImage[0].getSaleImgName() }" width="300px" height="300px" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"><c:out value="${recentSale[0].saleSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="/productDetail?saleNo=${recentSale[1].saleNo}&prdClass=${recentSale[1].prdClass}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty saleNewImage[1].getSaleImgName()}">
										<img src="/img/logo.png" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty saleNewImage[1].getSaleImgName()}">
										<img src="/img/${saleNewImage[1].getSaleImgName() }" width="300px" height="300px" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"><c:out value="${recentSale[1].saleSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
					<li>
					<a href="/productDetail?saleNo=${recentSale[2].saleNo}&prdClass=${recentSale[0].prdClass}">
							<div class="card" style="width: 300px;">
								<c:choose>
									<c:when test="${empty saleNewImage[2].getSaleImgName()}">
										<img src="/img/logo.png" width="300px" height="300px" style="float: left">
									</c:when>
									<c:when test="${not empty saleNewImage[2].getSaleImgName()}">
										<img src="/img/${saleNewImage[2].getSaleImgName() }" width="300px" height="300px" style="float: left">
									</c:when>
								</c:choose>
								<div class="card-body">
									<center>
										<b class="card-title"><c:out value="${recentSale[2].saleSubject}" /></b>
									</center>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div><br><br>
		</div>
	</section>

	<div style="position: fixed; bottom: 10px; right: 10px;">
		<a href="#Header"><img src="img/Icon/up_button.png" title="위로 가기" style="width: 30px; height:30px"></a>
	</div>
	<jsp:include page="/views/extra/footer.jsp" />
</body>
</html>