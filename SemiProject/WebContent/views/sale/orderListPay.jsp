<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 주문/결제</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="../../css/allCss.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"rel="stylesheet" >
<!--    다음 주소 api    -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//다음 주소 api
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("roadAddress").value = roadAddr;
						document.getElementById("jibunAddress").value = data.jibunAddress;

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}

	/* 결제 방식 */
	function showBankbook() {
		var bankBook = document.getElementById("bankBook");
		if (bankBook.checked) {
			document.getElementById("bankBookBox").style.display = "block";
			document.getElementById("cardBox").style.display = "none";
			document.getElementById("transferBox").style.display = "none";
		}
	}

	function showCard() {
		var card = document.getElementById("card");
		if (card.checked) {
			document.getElementById("bankBookBox").style.display = "none";
			document.getElementById("cardBox").style.display = "block";
			document.getElementById("transferBox").style.display = "none";
		}
	}

	function showTransfer() {
		var transfer = document.getElementById("transfer");
		if (transfer.checked) {
			document.getElementById("bankBookBox").style.display = "none";
			document.getElementById("cardBox").style.display = "none";
			document.getElementById("transferBox").style.display = "block";
		}
	}
	
	//총합계구하기
	$(function() {
				var orderSum = document.getElementById("orderSum");
				orderSum.value = 0;

				for (var i = 1; i <= '${fn:length(orderList)}'; i++) {
					var sumList = parseInt(document.getElementById("sumList"
							+ i).innerHTML);

					orderSum.value += sumList;

				}
				orderSum.innerHTML = orderSum.value;

				//서블릿 값 넘길때
				var buyNoSum = "";
				
				for (var i = 1; i <= '${fn:length(orderList)}'; i++) {
					var buyNo = $("#buyNo" + i).val();
					buyNoSum += buyNo + ",";

				}
				
				$("#formId").attr("action", "/orderCompleted?buyNo="+buyNoSum);

			})
	

</script>

<style>
body{
 font-family: 'Nanum Gothic', sans-serif;
}
.head {
	font-size: 30px;
	color: deepskyblue;
}

.line {
	border: 0.5px solid lightgray;
	background: lightgray;
}

.userInfo ul li {
	list-style: none;
	height: 40px;
}

.userInfo label {
	float: left;
	width: 100px;
}

.paySystem label {
	width: 100px;
}

.box {
	display: none;
}

.box li {
	list-style: none;
}

.box label {
	width: 70px;
}

.sumAmount {
	font-size: 30px;
	float: right;
}

.sumAmount b {
	color: cornflowerblue;
}

.submitBtn {
	margin-top: 70px;
	margin-left: 40%;
	font-size: 18px;
}
    #bankBookBox {
        display: block;
    }
</style>
</head>

<body>
	<header>
		<jsp:include page="/views/extra/header.jsp"/>
	</header>

	<section>
		<div class="container">
			<span class="head"> 주문 / 결제 </span> <br>
			<form action="#" method="post" id="formId">
				<div class="line"></div>
				<br>
				<br>

				<div class="orderList table-responsive" style="text-align: center">
					<table class="table">
						<thead>
							<tr style="background: #d9ead8;">
								<th style="text-align: center">상품정보</th>
								<th style="text-align: center">판매자</th>
								<th style="text-align: center">수량</th>
								<th style="text-align: center">배송비</th>
								<th style="text-align: center">주문 금액</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${orderList }" var="order" varStatus="i">
								<tr>
									<td><img src="img/${order.imgName }" width="100px;"
										height="100px;"><br> ${order.prdName }</td>
									<td>${order.prdBrand }</td>
									<td>${order.buyAmount }</td>
									<td>2,500</td>
									<td>${order.prdPrice }* ${order.buyAmount } + 배송비(2500) =
										<b id="sumList${i.count }">${order.sumPrice + 2500 }</b>
									</td>

								</tr>
								<input type="hidden" name="buyNo" id="buyNo${i.count }"
									value="${order.buyNo }">
							</c:forEach>
						</tbody>

					</table>
				</div>



				<br>
				<div class="line"></div>

				<div class="userInfo">
					<h4>- 주문자 정보</h4>
					<br>
					<ul>
						<li><label for="name">수령인 </label> <input type="text"
							id="name" name="name" placeholder="${memberOne.mName }"></li>
						<li><label for="phone">휴대폰 </label> <input type="text"
							id="phone" name="phone" placeholder="0${memberOne.mPhone }"></li>
						<li><label for="postcode">우편번호 </label> <input type="text"
							id="postcode" placeholder="${memberOne.mAddress1 }"> <input type="button"
							onclick="execDaumPostcode()" class="button"
							value="우편번호 찾기"></li>
						<li><label for="roadAddress">도로명 주소 </label> <input
							type="text" id="roadAddress" placeholder="${memberOne.mAddress2 }" disabled></li>
						<li><label for="jibunAddress">지번 주소 </label> <input
							type="text" id="jibunAddress" placeholder="${memberOne.mAddress3 }" disabled></li>
						<span id="guide" style="color: #999; display: none"></span>
						<li><label for="detailAddress">상세 주소 </label> <input
							type="text" id="detailAddress" placeholder="${memberOne.mAddress4 }"></li>
					</ul>


				</div>

				<br>
				<div class="line"></div>

				<div class="paySystem">
					<h4>- 결제 방식</h4>
					<input type="radio" name="pay" id="bankBook"
						onclick="showBankbook();" checked> <label for="bankBook">무통장입금</label>
					<input type="radio" name="pay" id="card" onclick="showCard();">
					<label for="card">카드결제</label> <input type="radio" name="pay"
						id="transfer" onclick="showTransfer();"> <label
						for="transfer">계좌이체</label>
				</div>
				<br>

				<div id="bankBookBox" class="box">
					<ul>
						<li>예금주 : 팜스</li>
						<li>입금할 계좌번호 : 355-0601-9291-94(농협)</li>
					</ul>

				</div>

				<div id="cardBox" class="box">
					<ul>

						<li><label for="bank">은행 </label> <input type="text"
							id="bank" list="Banks" placeholder="은행 입력/선택"> <datalist
								id="Banks">
								<option value="신한"></option>
								<option value="농협"></option>
								<option value="우리"></option>
								<option value="하나"></option>
								<option value="기업"></option>
								<option value="국민"></option>
							</datalist></li>
						<li><label>카드번호</label> <input type="text" maxlength="4"
							size="4px;"> - <input type="text" maxlength="4"
							size="4px;"> - <input type="text" maxlength="4"
							size="4px;"> - <input type="text" maxlength="4"
							size="4px;"></li>

						<li><label>유효기간 </label> Month : <input type="text"
							maxlength="2" size="2px;"> &nbsp; Year : <input
							type="text" maxlength="2" size="2px;"></li>
					</ul>
				</div>



				<div id="transferBox" class="box">
					<label for="bank">은행 </label> <input type="text" id="bank"
						list="Banks" placeholder="은행 입력/선택">
					<datalist id="Banks">
						<option value="신한"></option>
						<option value="농협"></option>
						<option value="우리"></option>
						<option value="하나"></option>
						<option value="기업"></option>
						<option value="국민"></option>
					</datalist>
				</div>

				<span class="sumAmount">총 결제 금액 : &nbsp; <b id="orderSum">0</b>
					원
				</span> <input type="submit" class="button submitBtn"
					value="결제하기">


			</form>

		</div>

		<script>
			
		</script>

		<br>
		<br>
		<br>

	</section>

	<footer>
		<jsp:include page="/views/extra/footer.jsp"/>
	 </footer>
</html>