<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 등록한 중고상품 보기 </title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
        .hero {
            padding: 6.25rem 0px !important;
            margin: 0px !important;
        }

        .cardbox {
            border-radius: 3px;
            margin-bottom: 20px;
            padding: 0px !important;
        }

        /* ------------------------------- */
        /* Cardbox Heading
---------------------------------- */
        .cardbox .cardbox-heading {
            padding: 16px;
            margin: 0;
        }

        .cardbox .btn-flat.btn-flat-icon {
            border-radius: 50%;
            font-size: 24px;
            height: 32px;
            width: 32px;
            padding: 0;
            overflow: hidden;
            color: #fff !important;
            background: #b5b6b6;

            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .cardbox .float-right .dropdown-menu {
            position: relative;
            left: 13px !important;
        }

        .cardbox .float-right a:hover {
            background: #f4f4f4 !important;
        }

        .cardbox .float-right a.dropdown-item {
            display: block;
            width: 100%;
            padding: 4px 0px 4px 10px;
            clear: both;
            font-weight: 400;
            font-family: 'Abhaya Libre', serif;
            font-size: 14px !important;
            color: #848484;
            text-align: inherit;
            white-space: nowrap;
            background: 0 0;
            border: 0;
        }

        /* ------------------------------- */
        /* Media Section
---------------------------------- */
        .media {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: start;
            align-items: flex-start;
        }

        .d-flex {
            display: -ms-flexbox !important;
            display: flex !important;
        }

        .media .mr-3 {
            margin-right: 1rem !important;
        }

        .media img {
            width: 48px !important;
            height: 48px !important;
            padding: 2px;
            border: 2px solid #f4f4f4;
        }

        .media-body {
            -ms-flex: 1;
            flex: 1;
            padding: .4rem !important;
        }

        .media-body p {
            font-family: 'Rokkitt', serif;
            font-weight: 500 !important;
            font-size: 14px;
            color: #88898a;
        }

        .media-body small span {
            font-family: 'Rokkitt', serif;
            font-size: 12px;
            color: #aaa;
            margin-right: 10px;
        }


        /* ------------------------------- */
        /* Cardbox Item
---------------------------------- */
        .cardbox .cardbox-item {
            position: relative;
            display: block;
        }

        .cardbox .cardbox-item img {}

        .img-responsive {
            display: block;
            max-width: 100%;
            height: auto;
        }

        .fw {
            width: 100% !important;
            height: auto;
        }


        /* ------------------------------- */
        /* Cardbox Base
---------------------------------- */
        .cardbox-base {
            border-bottom: 2px solid #f4f4f4;
        }

        .cardbox-base ul {
            margin: 10px 0px 10px 15px !important;
            padding: 10px !important;
            font-size: 0px;
            display: inline-block;
        }

        .cardbox-base li {
            list-style: none;
            margin: 0px 0px 0px -8px !important;
            padding: 0px 0px 0px 0px !important;
            display: inline-block;
        }

        .cardbox-base li a {
            margin: 0px !important;
            padding: 0px !important;
        }

        .cardbox-base li a i {
            position: relative;
            top: 4px;
            font-size: 16px;
            color: #8d8d8d;
            margin-right: 15px;
        }

        .cardbox-base li a span {
            font-family: 'Rokkitt', serif;
            font-size: 14px;
            color: #8d8d8d;
            margin-left: 20px;
            position: relative;
            top: 5px;
        }

        .cardbox-base li a em {
            font-family: 'Rokkitt', serif;
            font-size: 14px;
            color: #8d8d8d;
            position: relative;
            top: 3px;
        }

        .cardbox-base li a img {
            width: 25px;
            height: 25px;
            margin: 0px !important;
            border: 2px solid #fff;
        }

        img {

            background-size: auto;
        }


        .pagination {
            justify-content: center;
        }
    </style>

</head>
<body>

<!--  네비바들어가는 부분-->
 <jsp:include page="../common/menuBar.jsp"></jsp:include>
<!-- 네비끝 -->

<header id="header">
        <div class="myPage">
            <div>
                <h1>${loginUser.mName }님 마이페이지</h1>
            </div>
        </div>
    </header>


    <!-- Main -->
    <section id="main">
        <div class="container">
            <div class="row">
            
            <!-- 마이페이지 네비바 -->
                 <jsp:include page="myPageNav.jsp"></jsp:include>
                 
                <!-- 중고거래 등록한 상품 내용 -->
               	<div class="col-9 col-12-medium imp-medium">
                    <div class="content">

                        <!-- Content -->

                        <article class="box page-content" id="usedEnroll">

                            <header id="contentHead">
                                <b>중고거래</b>
                                <span>등록한 상품</span>
                                <br><br>

                            </header>



                            <section>
                                <div class="container">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                
                                                <th>
                                                    글제목
                                                </th>
                                                <th>
                                                    가격
                                                </th>
                                                <th>
                                                     판매완료 여부
                                                </th>
                                                <th>
                                                    작성일
                                                </th>

                                            </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach var="list" items="${usedList }">
                                            <tr>
                                                <td>
                                                   <a href="udetail.do?usedNo=${list.usedNo }"> ${list.usedTitle }</a>
                                                </td>
                                                <td>
                                                    ${list.usedPrice }
                                                </td>
                                                
                                                <c:if test="${list.usedYn eq 'Y'}">
                                                <td>
                                                     판매완료
                                                </td>
                                                </c:if>
                                                
                                                <c:if test="${list.usedYn eq 'N'}">
                                                <td>
                                                     판매중
                                                </td>
                                                </c:if>
                                                
                                                <td>
                                                    ${list.usedCreateDate }
                                                </td>
                                            </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </section>

                        </article>
                        
                <br><br><br><br><br>
               	
               <!-- 중고거래 등록한 상품 내용 끝 -->
              
            </div>
        </div>
    </section>
    
    
</body>
</html>