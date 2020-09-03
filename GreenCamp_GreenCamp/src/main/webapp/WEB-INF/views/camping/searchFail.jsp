<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE HTML>

<html>
	<head>
		<title>전국 캠핑장 목록</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--메뉴바 푸터 메인 css  -->
		<link rel="stylesheet" href="../../../resources/css/camping/assets/css/main.css" />
		<link rel="stylesheet" href="../../../resources/css/nav.css" />
		<link rel="stylesheet" href="../../../resources/css/footer.css" />
		<link rel="stylesheet" href="../../resources/css/myCampcss/assets/css/myCampMain.css" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<style>
          
          table a{
         font-color: black;
          }  
        
        </style>
	</head>
	<body class="is-preload">
	
	<!-- Nav -->
	
			<jsp:include page="../common/menuBar.jsp"></jsp:include>
	
	
	
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<h1><a href="index.html" id="logo"></a></h1>
							<p>Green camp</p>
						</div>
						
					</div>
					
				</header>
			
			<!--  검색바-->
			<jsp:include page="campingsearch.jsp"></jsp:include>
						 		
						 
						 		
						 		
			<!-- Main -->
				<section id="main">
					<div class="content1" style="height:900px;">
					<div class="container">
						<div class="row">
						

							<div class="col-12 col-12-medium" >
								<div class="content">

									<!-- Content -->
									<article class="box page-content" style="height: 800px;">
											<br><br>
											<header>
											 <img src="../../resources/css/camping/images/campingicon.png" alt="..." style="width:80px;height:80px;" ><h2>전국 캠핑장 조회</h2>
												<p></p>
												<ul class="meta">
									<font color="black" size="4"><h3><li>"${content }"   검색결과가 없습니다!.</li></h3></font>
									<br>
									<h4><li><a href="campingList.do"><i class="fas fa-undo fa-1x"> 메인 페이지로 돌아가기</i></a></li></h4>
												</ul>
												
											</header>
					<!-- Boxes -->
					<br><br>
						<div class="thumbnails">

							<c:forEach var="c" items="${list }">
							<div class="box">
								<a href="myCampDetail.html" class="image fit"><img src="../../resources/css/camping/images/${c.cImg}" alt="" /></a>
								
								<div class="inner">
									<h3>${c.cName}</h3>
									<p style="color:black;">${c.clocal}</p>
								
									<c:url var="before" value="campingDetail.do">
										<c:param name="cNo" value="${c.cNo}" />
										<c:param name="page" value="${pi.currentPage}" />
									</c:url>
										<a href="${before}" class="button fit">상세보기</a>
                                   <c:if test="${!empty  c.cTime }">
                                    <p style="color:black;">${c.cTime}</p>
                                    </c:if>
                                     <c:if test="${empty  c.cTime }">
                                       <p style="color:black;">${c.cEtc}</p>
                                     </c:if>
								</div>
								
							</div>
							</c:forEach>
									</div>
                                    </article>
							</div>
						</div>
					</div>
                    </div>
                    </div>
				</section>

			<!-- Footer -->
			<jsp:include page="../common/footer.jsp"></jsp:include>

		</div>

		<!-- Scripts -->
			<script src="../../../resources/css/camping/assets/js/jquery.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/jquery.dropotron.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/jquery.scrolly.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/browser.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/breakpoints.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/util.js"></script>
			<script src="../../../resources/css/camping/assets/js/main.js"></script>




	</body>
</html>