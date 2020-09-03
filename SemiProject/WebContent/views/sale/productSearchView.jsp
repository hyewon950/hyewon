<%@page import="sale.model.vo.Sale"%>
<%@page import="product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="sale.model.vo.*, product.model.vo.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품페이지 검색 결과</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> <!--검색 아이콘-->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
	text-decoration: none;
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

figure {
	position: relative;
}

figure img {
	display: block;
}

figure .overlay {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	overflow: hidden;
	width: 100%;
	height: 0;
	color: #fff;
	background: rgba(0, 0, 0, 0.6);
	-webkit-transition: .6s ease;
	transition: .6s ease;
}

figure .overlay .description {
	font-size: 20px;
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	text-align: center;
}

figure:hover .overlay {
	display: block;
	height: 100%;
}

ul {
	text-align: center;
}

li {
	list-style: none;
	/* 불릿없앰*/
	display: inline-table;
	/* 테이블스타일로배치*/
	padding: 10px;
	/* 안여백은각각10px로*/
	/* margin : 0, 100px; */
	margin-left: 25px;
}
/*베스트 스타일 끝 */
.head {
	font-size: 20px;
	color: #2c8e1f;
	font-weight: bold;
}

row {
	display: block;
}

#product {
	display: inline-block;
	margin: 15px;
	padding: 3px;
	border: solid 1px #E4E4E4;
	border-radius: 6px;
	background-color: #fff;
	height: 40px;
	width: 50%;
}

#search {
	height: 40px;
	background: #E4E4E4;
	opacity: 90%;
	display: inline-block;
}

#search:hover {
	background-color: skyblue;
}

#search.glyphicon-search {
	font-size: 20px;
}

#place {
	display: inline-block;
	margin: 15px;
	padding: 3px;
	border: solid 1px #E4E4E4;
	border-radius: 6px;
	background-color: #fff;
	height: 40px;
	width: 50%;
}

#price {
	display: inline-block;
}

#price input {
	margin: 15px;
	padding: 3px;
	border: solid 1px #E4E4E4;
	border-radius: 6px;
	background-color: #fff;
	height: 40px;
	width: 28%;
}

#price input::placeholder {
	text-align: right;
}

#productList {
	padding: 25px 10px;
}

#productList:hover {
	-ms-transform: scale(1.1);
 	-webkit-transform: scale(1.1);
 	transform: scale(1.1);
}

label {
	padding: 0 0 0 10px;
}
</style>
</head>

<body>
	<jsp:include page="/views/extra/header.jsp"/>

	<section>
		<div class="container">

			<c:choose>
				<c:when test="${prdClass == null }">
					<span class="head">농산물 전체보기</span>
				</c:when>
				<c:otherwise>
					<span class="head">${prdClass }류</span>
				</c:otherwise>
			</c:choose>

			<hr><br>

			<div class="card" id="searchArea">
				<!--1단-->
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<form action="/productSearch">
							<input type="hidden" name="searchOption" value="productName">
							<label for="product">상품</label> <input type="text" id="product"
								name="searchKey" placeholder=" 상품명을 입력하세요">
							<c:choose>
								<c:when test="${prdClass == null }"></c:when>
								<c:otherwise>
									<input type="hidden" name="prdClass" value="${prdClass}">
								</c:otherwise>
							</c:choose>
							<button class="btn btn-lg" id="search" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
							<!--<input type="submit" value="검색">-->
						</form>
					</div>

					<div class="col-sm-12 col-md-1">
						<!--공백-->
					</div>


					<div class="col-sm-12 col-md-5" id="placebox">
						<form action="/productSearch">
							<input type="hidden" name="searchOption" value="productPlace">
							<c:choose>
								<c:when test="${prdClass == null }"></c:when>
								<c:otherwise>
									<input type="hidden" name="prdClass" value="${prdClass}">
								</c:otherwise>
							</c:choose>
							<label for="place">재배지</label> <input type="text" id="place"
								list="placeList" name="searchKey" placeholder=" 재배지 선택">
							<datalist id="placeList">
								<option value="강원"></option>
								<option value="경기"></option>
								<option value="경상"></option>
								<option value="전라"></option>
								<option value="충청"></option>
							</datalist>
						</form>
					</div>
				</div>


				<!--2단-->
				<div class="row">
					<div class="col-md-8" id="price">
						<form action="/productSearch">
							<input type="hidden" name="searchOption" value="productPrice">
							<c:choose>
								<c:when test="${prdClass == null }"></c:when>
								<c:otherwise>
									<input type="hidden" name="prdClass" value="${prdClass}">
								</c:otherwise>
							</c:choose>
							<label for="price">가격</label> <input type="text" id="price1"
								name="searchKey1" placeholder="원 &nbsp;">
							<p style="display: inline-block">~</p>
							<input type="text" id="price2" name="searchKey2"
								placeholder="원 &nbsp;">
							<button class="btn btn-lg" id="search" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
					</div>
				</div>
				</form>
			</div>
			
			
			<!-- 베스트 상품 없음 -->


			<br><br>
			<!--모든 상품들-->
			<h3 style="text-align: center;"><b>검색결과</b></h3>
			<br><hr>
			<div class="row" align="center">
				<!--카드형식-->
				<c:forEach items="${pageData.pageList }" var="sale" varStatus="i">
					<div class="col-sm-6 col-md-3" id="productList">
						<a
							href="/productDetail?saleNo=${sale.saleNo}&prdClass=${sale.prdClass}">
							<div class="card" style="width: 23rem;">
								<img src="/img/${sale.saleImgName} " class="card-img-top"
									alt="...">
								<div class="card-body">
									<b class="card-title"> ${sale.prdName} </b><br>
									<p class="card-text">${sale.saleSubject}</p>
									<p class="card-text" style="color: #2c8e1f">${sale.prdPrice}원</p>
									<br>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>


			<br><br><hr><br><br>
			<div class="justify-content-center" style="text-align: center;">
				<ul class="pagination justify-content-center" style="clear: both;">
					${pageData.pageNavi}
				</ul>
			</div>

		</div>
	</section>

	<br><br>
	<div style="position: fixed; bottom: 10px; right: 10px;">
		<a href="#Header"><img src="img/Icon/up_button.png" title="위로 가기" style="width: 30px; height:30px"></a>
	</div>
	<jsp:include page="/views/extra/footer.jsp" />
</body>
</html>