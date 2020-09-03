<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <!DOCTYPE HTML>

<html>
	<head>
		<title>searchPage</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		
		<!--메뉴바 푸터 메인 css  -->
		<link rel="stylesheet" href="../../resources/css/myCampcss/assets/css/myCampMain.css" />
		<link rel="stylesheet" href="../../../resources/css/camping/assets/css/main.css" />
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	
		<style>
          
          table a{
         font-color: black;
          } 
           
            td a:hover, a:focus {
		    color: #a4c2de;
		    text-decoration: none;
		    }
		    
		    
		    font a:link {text-decoration:none; }
		    
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
							<p><p>Green camp</p></p>
						</div>
						
					</div>
					
				</header>
			
			<!--  검색바-->
			<jsp:include page="campingsearch.jsp"></jsp:include>
						 		
						 
						 		
						 		
			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row">
						

							<div class="col-12 col-12-medium">
								<div class="content">

									<!-- Content -->
									<article class="box page-content">
											<br><br>
											<header>
											 <img src="../../resources/css/camping/images/campingicon.png" alt="..." style="width:80px;height:80px;" ><h2>전국 캠핑장 조회</h2>
												<p></p>
												<ul class="meta">
													<li ><h3>"'${content }'"검색 결과</h3></li>
													<li class="icon fa-comments">총 ${count} 개의 검색 결과가 있습니다.</li>
													
												</ul>
											</header>
					<!-- Boxes -->
					<br><br>
						<div class="thumbnails">

							<c:forEach var="c" items="${list }">
							
											<div class="box">
														<c:if test="${c.cNo eq '1863'}">
															<a href="myCampDetail.html" class="image fit"> <img src="../../resources/css/camping/assets/css/images/10.jpg" alt="..." style="width:100%;height:300px;" ></a>
												       	</c:if>
												       	
														<c:if test="${c.cNo ne '1863'}">
														<a href="myCampDetail.html" class="image fit">  <img src="../../resources/css/camping/assets/css/images/${c.cImg}.jpg" alt="..." style="width:100%;height:300px;" ></a>
														</c:if>
														
												<div class="inner">
													<h3>${c.cName}</h3>
													<p style="color:black;">${c.clocal}</p>
												
													<c:url var="before" value="campingDetail.do">
														<c:param name="cNo" value="${c.cNo}" />
														<c:param name="page" value="${pi.currentPage}" />
													</c:url>
														
				                                   <c:if test="${!empty  c.cTime }">
				                                    <p style="color:black;">${c.cTime}</p>
				                                    </c:if>
				                                     
                                     
											<!--하나의 정보 box시작  -->
												<ul class="meta" style=" height: 45px; padding-top: 12px;"> <!--background-color:whitesmoke;css넣을지  -->
																			
													 	<c:set var="con" value="${c.cConUtil }" /> 
													 	<c:set var="cet" value="${c.cEtc }" /> 
											
													
													<c:if test="${fn:contains(con,'화장실')}">
												<li class="showUtil"><i class="fas fa-restroom fa-2x"></i></li>	
												</c:if>
											
											
												<c:if test="${fn:contains(con,' 전기')}">
												<li class="showUtil"><i class="fas fa-plug fa-2x"></i>	</li>	
												</c:if>
										
											
												<c:if test="${fn:contains(con,'수도')}">
												<li class="showUtil"><i class="fas fa-sink fa-2x"></i></li>	
												</c:if>
											
										
												<c:if test="${fn:contains(con, '샤워')}">
												<li class="showUtil"><i class="fas fa-shower fa-2x"></i></li>	
												</c:if>
											
												<c:if test="${fn:contains(con, '취사')}">
												<li class="showUtil"><i class="fas fa-burn fa-2x"></i></li>	
												</c:if>
												
												
												<c:if test="${fn:contains(con, '매점')}">
												<li class="showUtil"><i class="fas fa-shopping-cart fa-2x"></i></li>	
												</c:if>
												
												
												<c:if test="${fn:contains(con, '전망대')}">
												<li class="showUtil"><i class="fas fa-sbinoculars fa-2x"></i></li>	
												</c:if>
												
												
												<c:if test="${fn:contains(con, '수대')}">
												<li class="showUtil"><i class="fas fa-sink fa-2x"></i></li>	
												</c:if>
												
												<c:if test="${fn:contains(con, '광장')}">
												<li class="showUtil"><i class="fas fa-square-full fa-2x"></i></li>	
												</c:if>
												
												<c:if test="${fn:contains(con, '체험')}">
												<li class="showUtil"><i class="fas fa-dog fa-2x"></i></li>	
												</c:if>
												
												<c:if test="${fn:contains(con, '구장')}">
												<li class="showUtil"><i class="fas fa-volleyball-ball fa-2x"></i></li>	
												</c:if>
												
												
												<c:if test="${fn:contains(con, '바베큐')}">
												<li class="showUtil"><i class="fas fa-wine-glass-alt fa-2x"></i></li>	
												</c:if>
												
												<!-- C_ETCTL -->
												
												<c:if test="${fn:contains(cet, '카라반') or fn:contains(con, '카라반')}">
												<li class="showUtil"><i class="fas fa-caravan fa-2x"></i></li>	
												</c:if>
												
												<c:if test="${fn:contains(cet, '와이파이')or fn:contains(con, '와이파이')}">
												<li class="showUtil"><i class="fas fa-wifi fa-2x"></i></li>	
												</c:if>
												
												<c:if test="${fn:contains(cet, '수영장') or fn:contains(con, '수영장') }">
												<li class="showUtil"><i class="fas fa-swimming-pool fa-2x"></i></li>	
												</c:if>
												</ul>
				
												<a href="${before}" class="button fit" style="text-decoration:none;font-weight: 300;">상세보기</a>
									
									<!-- 좋아요 -->			
												<a class="header_ctr">
												<i class="far fa-thumbs-up"></i>
												좋아요
												<span>${c.cRecom}</span>
												</a>
												
												<a class="header_ctr">
												<i class="far fa-eye"></i>
												조회수
												<span>${c.cCount}</span>
												</a>
											</div>
													<!--하나의 정보 끝  -->
												
												</div>
							
							
							</c:forEach>
							

			
					<table >
				
						<tr align="center" height="20">
							<td colspan="6">
						<!-- [이전] -->
						<c:if test="${pi.currentPage <= 1 }">
							이전 &nbsp;
						</c:if>
						<c:if test="${pi. currentPage > 1 }">
							<c:url var="before" value="searchcamping.do">
								<c:param name="page" value="${pi.currentPage - 1 }" />
								<c:param name="cName" value="${cName}" />
								<c:param name="cAddr" value="${cAddr}" />
								<c:param name="content" value="${content}" />
							</c:url>
							<a href="${before }">이전</a> &nbsp;
						</c:if>
								<!--  String cName,String cAddr,String content-->
							
							
					
						<c:forEach var="p"  begin="${pi.startPage }" end="${pi.endPage }">
							<c:if test="${p eq pi.currentPage }">
							
								<font color="red" size="4"><b>${p }</b></font>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<c:url var="pagination" value="searchcamping.do">
									<c:param name="page" value="${p }" />
						 		<c:param name="cName" value="${cName}" />
									<c:param name="cAddr" value="${cAddr}" />
									<c:param name="content" value="${content}" /> 
								</c:url>
								<a href="${pagination }" style="text-decoration:none;">${p}</a> &nbsp;
							</c:if>
						</c:forEach>
				
					   <!-- [다음] -->
						<c:if test="${pi.currentPage >= pi.maxPage }">
							다음 &nbsp; 
						</c:if>
						<c:if test="${pi.currentPage < pi.maxPage }">
							<c:url var="after" value="searchcamping.do">
								<c:param name="page" value="${pi.currentPage + 1 }" />
								<c:param name="cName" value="${cName}" />
								<c:param name="cAddr" value="${cAddr}" />
								<c:param name="content" value="${content}" />
							</c:url>
							<a href="${after }">다음</a> &nbsp;
						</c:if>							
							
							
							</td>
							</tr>
								</table>
						 
						

						</div>
                                    </article>
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


			<script >
			var a = Math.floor(Math.random() * 10) + 1;

			${"#"}			
			</script>

	</body>
</html>