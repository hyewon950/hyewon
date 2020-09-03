<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="UTF-8" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Farms - MyPage</title>
		<meta name="description" content="Blueprint: Slide and Push Menus" />
		<meta name="keywords" content="sliding menu, pushing menu, navigation, responsive, menu, css, jquery" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" type="text/css" href="../css/default.css" />
		<link rel="stylesheet" type="text/css" href="../css/component.css" />
		<script src="../js/modernizr.custom.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<style>
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

        li a:hover:not(.active) {
            background-color: #660099;
            color: white;
            text-decoration: none;
            border-radius: 10px;
        }

        /* div {
            border: 1px solid black;
        }*/

        img {
            width: 100%;
            height: 100%;
            border: 1;
            padding: 5%;
        }

        .overflow {
            overflow-x: hidden;
            overflow-y: auto;
        }

        table {
            margin: auto;
            text-align: center;
        }
    </style>
	</head>
	<body class="cbp-spmenu-push">
		<%@ include file="SideMenuBar.jsp" %>
		<div class="container">
			<div class="main" style="margin-top: 3%">
				<h2>구매내역</h2><br>
				<article class="overflow" style="height:400px;">
                    <div>
                        <table class="col" >
                            <tr class="row">
                            	<td class="col-md-1"></td>
                                <td class="col-md-2">
                                    <img src="/img/pap.jpg" style="width: 120px; height: 120px;">
                                </td>
                                <td class="col-md-2" style="line-height:100px;">상품명 : 표고버섯</td>
                                <td class="col-md-2" style="line-height:100px;">수량 : 60000</td>
                                <td class="col-md-2" style="line-height:100px;">금액 : 6000000원</td>
                                <td class="col-md-2" style="line-height:100px;">
                                    <button class="btn btn-secondary btn-sm" type="submit">리뷰 작성하러가기</button>
                                </td>
                                <td class="col-md-1">
                             </tr>
                             <tr class="row">
                            	<td class="col-md-1"></td>
                                <td class="col-md-2">
                                    <img src="/img/pap.jpg" style="width: 120px; height: 120px;">
                                </td>
                                <td class="col-md-2" style="line-height:100px;">상품명 : 표고버섯</td>
                                <td class="col-md-2" style="line-height:100px;">수량 : 60000</td>
                                <td class="col-md-2" style="line-height:100px;">금액 : 6000000원</td>
                                <td class="col-md-2" style="line-height:100px;">
                                    <button class="btn btn-secondary btn-sm" type="submit">리뷰 작성하러가기</button>
                                </td>
                                <td class="col-md-1">
                             </tr>
                             <tr class="row">
                            	<td class="col-md-1"></td>
                                <td class="col-md-2">
                                    <img src="/img/pap.jpg" style="width: 120px; height: 120px;">
                                </td>
                                <td class="col-md-2" style="line-height:100px;">상품명 : 표고버섯</td>
                                <td class="col-md-2" style="line-height:100px;">수량 : 60000</td>
                                <td class="col-md-2" style="line-height:100px;">금액 : 6000000원</td>
                                <td class="col-md-2" style="line-height:100px;">
                                    <button class="btn btn-secondary btn-sm" type="submit">리뷰 작성하러가기</button>
                                </td>
                                <td class="col-md-1">
                             </tr>
                             <tr class="row">
                            	<td class="col-md-1"></td>
                                <td class="col-md-2">
                                    <img src="/img/pap.jpg" style="width: 120px; height: 120px;">
                                </td>
                                <td class="col-md-2" style="line-height:100px;">상품명 : 표고버섯</td>
                                <td class="col-md-2" style="line-height:100px;">수량 : 60000</td>
                                <td class="col-md-2" style="line-height:100px;">금액 : 6000000원</td>
                                <td class="col-md-2" style="line-height:100px;">
                                    <button class="btn btn-secondary btn-sm" type="submit">리뷰 작성하러가기</button>
                                </td>
                                <td class="col-md-1">
                             </tr>
                             <tr class="row">
                            	<td class="col-md-1"></td>
                                <td class="col-md-2">
                                    <img src="/img/pap.jpg" style="width: 120px; height: 120px;">
                                </td>
                                <td class="col-md-2" style="line-height:100px;">상품명 : 표고버섯</td>
                                <td class="col-md-2" style="line-height:100px;">수량 : 60000</td>
                                <td class="col-md-2" style="line-height:100px;">금액 : 6000000원</td>
                                <td class="col-md-2" style="line-height:100px;">
                                    <button class="btn btn-secondary btn-sm" type="submit">리뷰 작성하러가기</button>
                                </td>
                                <td class="col-md-1">
                             </tr>
                                <c:forEach items="${myList}" var="order" varStatus="i">
                                	<tr>
	                                <td class="col-md-1">
	                                </td>
	                                <td class="col-md-2">
	                                    <img src="/img/${order.imgName }">
	                                </td>
	                                <td class="col-md-2" style="line-height:100px;">상품명 : ${order.prdName }</td>
	                                <td class="col-md-2" style="line-height:100px;">수량 : ${order.buyAmount }</td>
	                                <td class="col-md-2" style="line-height:100px;">금액 : ${order.prdPrice * order.buyAmount }원</td>
	                                <td class="col-md-2" style="line-height:100px;">
	                                    <button class="btn btn-secondary btn-sm" onclick="location.href='/productDetail?saleNo=${order.saleNo}'">리뷰 작성하러가기</button>
	                                </td>
	                                <td class="col-md-1">
	                                </tr>
                                </c:forEach>
                        </table>
                    </div>
                </article><br><br>
			</div>
		</div>
	</body>
</html>





















