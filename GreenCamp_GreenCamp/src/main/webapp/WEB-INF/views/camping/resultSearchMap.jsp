<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE HTML>

<html>
	<head>
		<title>지도로 검색</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

		<!--메뉴바 푸터 메인 css  -->
		<link rel="stylesheet" href="../../../resources/css/camping/assets/css/main.css" />
<!-- 		<link rel="stylesheet" href="../../../resources/css/footer.css" /> -->
		
		
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 		<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script> 
	
		
		<style>
            #searchMap{
                margin: 10px;
                padding: 10px 10px;
            }
            
        </style>
		
		
	</head>
	
	
	<body class="is-preload">

		<div id="page-wrapper">

	<!-- Nav -->
			
			<jsp:include page="../common/menuBar.jsp"></jsp:include>


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
        		
        		
       	<!-- ---------------------메인시작----------Main -->
				<section id="main">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

								<!-- Blog -->
									<section class="box blog">
									
										<h2 class="major"><span><img src="../../resources/css/camping/images/campingicon.png" alt="..." style="width:80px;height:80px;margin: -25px 10px 0px 0px;" >지도로 검색하기</span></h2>
										
										<div>
											<div class="row">
												<div class="col-12 col-12-medium">
													<div class="content">
														<!-- Featured Post -->
															<article class="box post">
																<header style="text-align:center;" >
																	<p>원하시는 지역을 선택하세요</p>
																</header>
														
								<!--img 캐러셀-->	
									<jsp:include page="mapprac1.jsp"></jsp:include> 		
							
															</article>

													</div>
												</div>
											
											</div>
										</div>
									</section>
                               </div>
						</div>
                    </div>
            </section>
      


			<!-- Footer -->
				<jsp:include page="../common/footer.jsp"></jsp:include>
		</div>

		<!-- <!-- Scripts -->
	
           <script type="text/javascript">
           
           $(document).ready(function(e){
  					  $('.search-panel .dropdown-menu').find('a').click(function(e) {
						e.preventDefault();
							var param = $(this).attr("href").replace("#","");
							var concept = $(this).text();
							$('.search-panel span#search_concept').text(concept);
								$('.input-group #search_param').val(param);
								});
						
				
					});
           </script>

           
           
           
           
           
           
            

	</body>
</html>