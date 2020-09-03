<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	
	<link rel="stylesheet" href="../../css/allCss.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"rel="stylesheet" >
	
<title>주문 완료</title>

<style>
body{
 font-family: 'Nanum Gothic', sans-serif;
}

/* div {
	border: 1px solid black;
} */

hr {
	border: solid 1px lightgray;
}

.container {
	padding: 10px;
}

.button_wrapper {
	text-align: right;
}

th {
	width: 20%;
}


#name {
	color: cornflowerblue;
}

tbody>tr {
	justify-content: center;
	height: 200px;
}

/* table.table-bordered {
	border: 2px solid darkgray;
	margin-top: 20px;
}

table.table-bordered>thead>tr>th {
	border: 2px solid darkgray;
}

table.table-bordered>tbody>tr>td {
	border: 2px solid darkgray;
} */

.sumAmount {
	font-size: 30px;
	float: right;
}

.sumAmount b {
	color: cornflowerblue;
}
</style>

<script>
						$(function() {
							var orderSum = document.getElementById("orderSum");
							orderSum.value = 0;

							for (var i = 1; i <= '${fn:length(completedList)}'; i++) {
								var sumList = parseInt(document
										.getElementById("sumList" + i).innerHTML);

								orderSum.value += sumList;

							}
							orderSum.innerHTML = orderSum.value;

						})
					</script>
					
</head>

<body>
	<header> <jsp:include page="/views/extra/header.jsp"/> </header>
	<section>
		<div class="container" style="margin: auto">
			<hr>
			<div style="padding: 20px;">
				<p id="name" style="display: inline-block;">
					<b>${memberOne.mName }</b>
				</p>
				<p style="display: inline-block;">님의</p>
				<br> <span>
					<h3 style="display: inline-block;">주문이</h3>
				</span><span>
					<h3 style="display: inline-block; color: orange;">&nbsp;완료</h3>
					<h3 style="display: inline-block;">되었습니다.</h3>
				</span>
			</div>
			<hr>
			<p>주문정보 </p>
			<table class="table table-striped " style="text-align: center">
				<thead>
					<tr style="color: black; background: #d9ead8;">
						<th>상품정보</th>
						<th>판매자</th>
						<th>배송비</th>
						<th>수량</th>
						<th>주문금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${completedList }" var="order" varStatus="i">
						<tr>
							<td><img src="img/${order.imgName }" width="100px;"
								height="100px;"><br> ${order.prdName }</td>

							<td style="padding-top: 90px;"><b>${order.prdBrand }</b></td>
							<td style="padding-top: 90px;"><b>2,500원</b></td>
							<td style="padding-top: 90px;"><b>${order.buyAmount }</b></td>
							<td style="padding-top: 90px;">${order.prdPrice }*
								${order.buyAmount } + 배송비(2500) = <b id="sumList${i.count }">${order.sumPrice + 2500 }</b>
							</td>
						</tr>
					</c:forEach>

					<span class="sumAmount">총 결제 금액 : &nbsp; <b id="orderSum">0</b>
						원
					</span>
				</tbody>
			</table>
				<hr>
			<div style="text-align: center">
				<button class="button" onClick="location.href='index.jsp'">메인페이지</button>
			</div>
			<br><br><br>
		</div>
	</section>
	<footer> <jsp:include page="/views/extra/footer.jsp"/> </footer>
</body>
</html>