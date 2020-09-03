<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mainPage</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
 <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
   crossorigin="anonymous"></script>
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> <!--검색 아이콘-->
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	/* font-family: 'Nanum Gothic', sans-serif; */
}

a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
	font-weight: bold;
}

.nav-item {
	margin: 5px ;
	/* margin-left: 30px;
   margin-right: 30px; */
}

#navBarMain {
	display: inline-block;
	background-color: #d9ead8;
	width: 100%;
	font-size: 15px;
	padding: 0;
}

#navMenu {
	text-align: center;
	padding: 10px 0;
}

#navMenu a {
	padding: 10px 0;
}

 #navSearch {
	/* padding-left: 90px;
	padding-right: 0; */
	display: inline-block;
} 

#logo {
	width: 200px;
	height: 200px;
}

#searchBar {
	padding-top: 5px;
	float: right;
}

 #searchOption {
	display: inline-block;
	margin: 0px;
	padding: 3px;
	border: solid 1px #E4E4E4;
	border-radius: 6px;
	background-color: #fff;
	height: 41px;
} 

 #searchInput {
	display: inline-block;
	margin: 0px;
	padding: 3px;
	border: solid 1px #E4E4E4;
	border-radius: 6px;
	background-color: #fff;
	height: 41px;
	width: 80%;
} 

#searchBtn {
	/* background-color: #2a9f1a; */
	height: 41px;
	position: relative;
	left: -45px;
}

#account {
	float : right;
	padding : 10px 100px;
}
</style>
</head>
<body>
   <header>
      <div class="row" id="Header">
         <div class="col-md-4"></div>
         <div class="col-md-4"><center><a href="/"><img id="logo" src="/img/logo_big.png" ></center></a></div>
         <div class="col-md-4">
            <div id="account" class="sc_login">
            <c:choose>
               <c:when test="${empty sessionScope.member.mId}">
               <div class="sub_area">
                  <div class="look_box">
                  <br><br>
                     <a href="/views/extra/loginPage.jsp" class="link_look"
                        data-clk="log_off.login">로그인</a><br> <a href="/views/extra/findID.jsp"
                        class="link_look" data-clk="log_off.searchid">아이디</a>/ <a href="/views/extra/findPW.jsp"
                        class="link_look" data-clk="log_off.searchpass">비밀번호찾기</a>
                  </div>
                  <a href="/views/extra/enrollPage.jsp" class="link_join"
                     data-clk="log_off.registration">회원가입</a>
               </div>
               </c:when>
               <c:otherwise><br><br>
               <%-- <%=member.getmName()%> --%>${sessionScope.member.mName}님 환영합니다.<br>
               <a href="/myInfo?mId=<%-- <%=member.getmId()%> --%>${sessionScope.member.mId}">마이페이지</a><br>
               <a href="/logout">로그아웃</a><br>
               </c:otherwise>
            </c:choose>
            </div>
         </div>
      </div>
   </header>

	<nav class="navbar navbar-expand-lg" id="navBarMain">
			<div class="row"  style="padding:0;">
				<div class="col-md-1"></div>
				<div class="col-md-6" id="navMenu" style="text-align: center; padding:15px 0;">
					<div class="col-md-2">
						<a class="nav-link dropdown-toggle" href="/productMain" data-toggle="dropdown"> 농산물 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="/productMain">농산물 전체</a> 
							<a class="dropdown-item" href="/productMain?prdClass=곡물">곡물류</a> 
							<a class="dropdown-item" href="/productMain?prdClass=채소">채소류</a>
							 <a class="dropdown-item" href="/productMain?prdClass=과일">과일류</a>
						</div>
					</div>
					<div class="col-md-2">
						<a class="nav-link" href="/communityMain?postKinds=스토리">스토리</a>
					</div>
					<div class="col-md-2">
						<a class="nav-link " href="/communityMain?postKinds=레시피">레시피</a>
					</div>
					<div class="col-md-2">
						<a class="nav-link" href="/communityMain?postKinds=공동구매">공동구매</a>
					</div>
					<div class="col-md-3">
						<a class="nav-link" href="/communityMain?postKinds=공지사항">공지 및 이벤트</a>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="col-md-4" style="align: center; padding:10px 0;">
				<div id="searchBar">
					<form id="searchForm" class="form-inline" action="/productSearch">
						<!-- inline여야 간격이 없이 메뉴처럼 나온다-->
						<select name="searchOption" id="searchOption" onclick="mainSearch(this.value)">
							<option value="productName">상품명</option>
							<option value="공지사항">공지사항</option>
							<option value="스토리">스토리</option>
							<option value="레시피">레시피</option>
							<option value="공동구매">공동구매</option>
						</select>
						<div style="display: inline-block;">
						<input id="searchInput" class="form-control" name="searchKey" type="text" placeholder="Search" style="border-style: solid">
						<!-- form-control 입력창 꾸며주는 클래스 -->
						<button class="btn btn" type="submit" id="searchBtn">
							<i class="glyphicon glyphicon-search"></i>
						</button>
						</div>
					</form>
				</div>
				</div>
				<div class="col-md-1"></div>
			</div>
	</nav>
   
<script>
	function mainSearch(searchOption) {
	   if(searchOption != 'productName'){
		   $("#searchForm").attr("action", "/searchCommunity2")
	   }else {
	      $("#searchForm").attr("action", "/productSearch")
	   }
	}
</script>
</body>
</html>