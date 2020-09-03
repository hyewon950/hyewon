<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
    <%@ page import="java.net.URLDecoder" %>
 <%--    <%
    Member member = (Member) session.getAttribute("member");
    request.setCharacterEncoding("utf-8");
    %> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
        
        

        .container {
            position: absolute;
            top:40%;
            text-align: center;
        }
        a{
            color: white;
        }
        
    </style>
<title>Insert title here</title>
</head>
<body>
<header>
        <h1 class="logo">Farm's</h1>
    </header>
    <div class="row" id="wrapper">
        <div id="sidebar" class="col-md-2">
            <ul style="border: 1px solid #dfe1e5; border-radius: 10px;">
                <li><a href="/myInfo?mId=${sessionScope.member.mId}">회원정보 조회</a></li>
				<li><a href="/views/extra/memberModify.jsp">회원정보 수정</a></li>
				<li><a href="ReviewWriter.jsp">리뷰작성</a></li>
				<li><a href="/views/extra/searchBasket.jsp">장바구니 조회</a></li>
				<li><a href="/views/extra/searchBuy.jsp">구매내역 조회</a></li>
				<li><a href="/views/extra/MemberDelete.jsp">회원탈퇴</a></li>
            </ul>
        </div>
        <section class="col-md-10">
            <div class="container col-12">
                <div id="memberId">
                    <h4>회원님의 아이디는 <%-- <%=member.getmId() %> --%>${pageScope.member.mId} 입니다.
                    <!-- 회원아이디 뜨는곳-->
                    </h4>
                </div><br><br><br><br><br>
                <button class="btn btn-secondary btn-sm" type="submit"><a href="/main.jsp" style="text-decoration:none;"><%-- <%session.invalidate(); %> --%>메인 페이지로 이동</a></button>
            </div>

        </section>
    </div>
</body>
</html>