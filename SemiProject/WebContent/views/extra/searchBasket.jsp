<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="UTF-8" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Farms - MyPage</title>
<meta name="description" content="Blueprint: Slide and Push Menus" />
<meta name="keywords"
	content="sliding menu, pushing menu, navigation, responsive, menu, css, jquery" />
<meta name="author" content="Codrops" />
<link rel="stylesheet" type="text/css" href="../css/default.css" />
<link rel="stylesheet" type="text/css" href="../css/component.css" />
<link rel="stylesheet" href="../../css/allCss.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script src="../js/modernizr.custom.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
body {
	margin: 0px;
	padding: 0px;
	font-family: 'Nanum Gothic', sans-serif;
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

li a:hover:not (.active ) {
	background-color: #660099;
	color: white;
	text-decoration: none;
	border-radius: 10 px;
}

table {
	/* margin: auto; */
	text-align: center;
	width: 100%;
}

#ckbCss {
	padding: 50px;
}

.hrLine {
	background-color: lightgray;
	height: 2px;
}

/* 스크롤 css */
.overflow {
	overflow-x: hidden;
	overflow-y: auto;
}

.example-1 {
	position: relative;
	overflow-y: scroll;
	height: 400px;
}

.square::-webkit-scrollbar-track {
	border-radius: 0 !important;
}

.square::-webkit-scrollbar-thumb {
	border-radius: 0 !important;
}

.thin::-webkit-scrollbar {
	width: 6px;
}

.scrollbar-dusty-grass::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-dusty-grass::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-dusty-grass::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-linear-gradient(330deg, #d4fc79 0%, #96e6a1 100%);
	background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);
}
</style>
<script>
	//서블릿 이동
	function btn_click(str) {

		if ($("input").filter("input:checked").length > 0) {
			if (str == "delete") {
				console.log("삭제서블릿으로 가는 버튼");
				myForm.action = "/searchBasketDelete";
			} else if (str == "buy") {
				myForm.action = "/searchBasketBuy";
			}
		} else {
			alert("선택된 물품이 없습니다.");
		}

	}
</script>

</head>
<body class="cbp-spmenu-push">
	<%@ include file="SideMenuBar.jsp"%>

	<header>
		<%-- <jsp:include page="/views/extra/header.jsp"/> --%>

	</header>

	<div class="container">
		<div class="main" style="margin-top: 3%; margin-left: 240px;">

			<h3>
				<img src="img/Icon/장바구니아이콘.png" width="35px;" height="35px;">장바구니
				조회
			</h3>
			<hr class="hrLine">

			<form action="/searchBasket" method="post" name="myForm">
				<article
					class="example-1 square scrollbar-dusty-grass square thin"
					style="height: 300px;">
					<!-- overflow  -->
					<table>

						<c:forEach items="${basket }" var="basket" varStatus="i">
							<tr>
								<td><input type="checkbox" class="ckb" name="basketcheck"
									value="${basket.buyNo }"></td>
								<td width="30%;"><img src="img/${basket.imgName }"
									style="width: 120px; height: 120px;"><br>${basket.prdName }</td>
								<td width="20%;">수량 <br> <b
									id="sumAmountList${basket.buyNo }">${basket.buyAmount }</b></td>
								<td width="40%;">금액 <br> ${basket.prdPrice }*
									${basket.buyAmount } + 배송비(2500) = <b
									id="sumPriceList${basket.buyNo }">${basket.sumPrice + 2500 }
								</b> 원
								</td>
							</tr>

						</c:forEach>


					</table>
				</article>

				<br> <br>
				<hr class="hrLine">
				<!--<aticle>-->
				<table class="col">
					<tr class="row">
						<td class="col-md-2">
							<button type="button" class="button" id="allSelect"
								onclick="checkAll();">전체선택</button>
						</td>
						<td class="col-md-3"><h4>
								전체 수량 : <b id="sumAmount">0개</b>
							</h4></td>
						<td class="col-md-3">
							<h4>
								전체 금액 : <b id="sumPrice">0원</b>
							</h4>
						</td>
						<td class="col-md-2"><input type="submit"
							onclick="btn_click('delete');" value="선택제품 삭제" class="button">
						</td>
						<td class="col-md-2"><input type="submit"
							onclick="btn_click('buy');" value="구매" class="button"></td>
					</tr>
				</table>
			</form>
		</div>
		<script>
			var checkList = new Array(); //물품체크배열
			var all = true; //전체선택&취소

			//전체선택&취소 
			function checkAll() {
				checkList = []; //물품체크배열 비움

				if (all == true) {
					$(".ckb").prop("checked", true);
					document.getElementById("allSelect").innerHTML = "전체취소";
					$('input:checkbox[name=basketcheck]:checked').each(
							function() { // 체크된 체크박스의 value 값을 가지고 온다.
								checkList.push(this.value);
							});
					all = false;

				} else {
					$(".ckb").prop("checked", false);
					document.getElementById("allSelect").innerHTML = "전체선택";
					checkList = []; //물품체크배열 비움
					all = true;
				}

				//
				var sumPrice = document.getElementById("sumPrice");
				var sumAmount = document.getElementById("sumAmount");
				sumPrice.value = 0;
				sumAmount.value = 0;

				for (var i = 0; i < checkList.length; i++) {

					var sumPriceList = parseInt(document
							.getElementById("sumPriceList" + checkList[i]).innerHTML);
					var sumAmountList = parseInt(document
							.getElementById("sumAmountList" + checkList[i]).innerHTML);

					sumPrice.value += sumPriceList;
					sumAmount.value += sumAmountList;

				}
				sumPrice.innerHTML = sumPrice.value + " 원";
				sumAmount.innerHTML = sumAmount.value + " 개";

			}

			//장바구니 체크한 것 수량,합계
			$(".ckb").change(
					function() {
						checkList = [];

						$('input:checkbox[name=basketcheck]:checked').each(
								function() { // 체크된 체크박스의 value 값을 가지고 온다.
									checkList.push(this.value);
								});

						var sumPrice = document.getElementById("sumPrice");
						var sumAmount = document.getElementById("sumAmount");
						sumPrice.value = 0;
						sumAmount.value = 0;

						for (var i = 0; i < checkList.length; i++) {

							var sumPriceList = parseInt(document
									.getElementById("sumPriceList"
											+ checkList[i]).innerHTML);
							var sumAmountList = parseInt(document
									.getElementById("sumAmountList"
											+ checkList[i]).innerHTML);

							sumPrice.value += sumPriceList;
							sumAmount.value += sumAmountList;

						}
						sumPrice.innerHTML = sumPrice.value + " 원";
						sumAmount.innerHTML = sumAmount.value + " 개";

					});
		</script>
</body>
</html>