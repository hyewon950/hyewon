<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴바</title>

<link rel="stylesheet" href="../../../resources/css/nav.css" />
    <!--fontawesome-->    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    
	</head>
	<body>
	
	<!-- 새로고침시 알려주는 창 (로그인성공/실패 알려줌) -->
	<c:if test="${!empty msg }">
		<script>
			alert("${msg }")
		</script>
	</c:if>
	
	
		<!-- Nav -->
	<nav id="nav">
		<ul>
			<li class="current"><a href="home.do">Home</a></li>

			<li><a href="campingList.do">캠핑장 예약</a>
				<ul>
					<li><a href="campingList.do">캠핑장 전체 리스트 보기</a></li>
               		<li><a href="campingSearchMap.do">지도로 찾기</a></li>
				</ul></li>
			<li><a href="ulist.do">중고거래</a></li>
			<c:url var="myclist" value="myclist.do"></c:url>
			<li><a href="${myclist }">나만의 캠핑</a></li>

			<c:url var="plist" value="plist.do" />
			<c:url var="rlist" value="rlist.do" />
			<c:url var="glist" value="glist.do" />
			<c:url var="flist" value="flist.do" />
			<li><a href="${plist }">커뮤니티</a>
				<ul>
					<li><a href="${plist}">용품 추천 게시판</a></li>
					<li><a href="${rlist}">레시피 게시판</a></li>
					<li><a href="${glist}">가이드 게시판</a></li>
					<li><a href="${flist}">자유 게시판</a></li>
				</ul></li>

			
			<c:if test="${ empty sessionScope.loginUser || loginUser.mKey ne 'Y' }">
				<li><a href="loginView.do">로그인</a>
					<ul>
						<li><a href="loginView.do">로그인</a></li>
						<li><a href="enrollView.do">회원가입</a></li>
					</ul></li>
			</c:if>

			<c:if test="${ sessionScope.loginUser.mKey eq 'Y' }">
				<li><a href="logout.do">로그아웃</a></li>


				<li><a href="myPageMemberSelectView.do">마이페이지</a>
               <ul>
                  <li><a href="MyReservationInfoView.do?mId=${sessionScope.loginUser.mId }">나의 예약 정보</a>
                  <ul>
                      <li><a href="myCheckInView.do?mId=${sessionScope.loginUser.mId }">체크인(예정) 캠핑장</a></li>
                      <li><a href="myCheckOutView.do?mId=${sessionScope.loginUser.mId }">체크아웃 캠핑장</a></li>
                  </ul> </li>
                  <li><a href="myUsedProductView.do?mId=${loginUser.mId }">나의 중고상품</a>
                     <ul>
                        <li><a href="myUsedProductView.do?mId=${loginUser.mId }">등록한 중고상품</a></li>
                     </ul></li>
                  <li><a href="myPageMemberSelectView.do">회원정보</a>
                     <ul>
                        <li><a href="memberModifyView.do">수정</a></li>
                        <li><a href="memberDeleteView.do">탈퇴</a></li>
                     </ul></li>
               </ul></li>

				<!-- 팝업으로 열기  (주소,팝업창이름,옵션) -->
				<li><a onclick="window.open('/chatRoomView.do?mId=${loginUser.mId}','채팅방','width=430,height=500,top=150,left=600,location=no,status=no,scrollbars=yes');"> 
						채팅 <i class="far fa-comment fa-2x"></i>
				</a></li>
			</c:if>


		</ul>
	</nav>



	<!-- Scripts -->
			<!-- <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> -->
    <script src="../../../resources/js/jquery.dropotron.min.js"></script>
        <script src="../../../resources/js/jquery.scrolly.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>

</body>
</html>