<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>캠핑장 상세페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/camping/assets/css/main.css" />
		 <title>Bootstrap 4, from LayoutIt!</title>
     <!-- 합쳐지고 최소화된 최신 CSS -->
       			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- 부가적인 테마 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="resources/css/nav.css" />
    
    <style>
        
.card {
  position: relative;
  display: flex;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #fff;
  background-clip: border-box;
  border: 1px solid #e3e6f0;
  border-radius: 0.35rem;
   box-sizing : border-box;
    height: auto;
    
}



        .card-body {
          flex: 1 1 auto;
          min-height: 1px;
          padding: 1.25rem;
        }


        .container-card{
         
            padding: 20px 5px 50px 10px;
            border:1px solid lightgray;
            margin:18px 5px 7px 0px;
            box-sizing : border-box;
    
        
        }
        .card{
             margin:18px 5px 7px 10px;
          /* padding: 1px 1px 2px 8px;*/
        }
    
        #comdate{
            text-decoration-color: lightgray;
        }
        .comdate{
            text-decoration: none;
            color: silver;
            pointer-events: none;
        }
        .card bg-light{
             box-sizing : border-box;
        }
        
        .search-input {
         
          padding-top: 5px 5px 5px 5px;
          margin:5px;
          float: right;
            font-size: 1px;
           
         
        }
        .insertcomment{
            background-color:whitesmoke; 
            padding: 20px;
           
            height: 250px;
        }
        
        </style>
    
    
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<h1><a href="index.html" id="logo">TXT</a></h1>
							<p>A responsive site template by HTML5 UP</p>
						</div>
					</div>
				</header>

			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="index.html">Home</a></li>
						<li>
							<a href="#">캠핑장 예약</a>
							<ul>
								<li><a href="#">Lorem ipsum dolor</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li>
									<a href="#">Phasellus consequat</a>
									<ul>
										<li><a href="#">Lorem ipsum dolor</a></li>
										<li><a href="#">Phasellus consequat</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam dolore nisl</a></li>
									</ul>
								</li>
								<li><a href="#">Veroeros feugiat</a></li>
							</ul>
						</li>
						<li><a href="left-sidebar.html">중고거래</a></li>
						<li><a href="right-sidebar.html">나만의 캠핑</a></li>
						<li><a href="no-sidebar.html">커뮤니티</a></li>
					</ul>
				</nav>

			<!-- Banner -->
				<!--검색바-->
					<div id="searchBox">
					    <select>
                            <option>전체</option>
					        <option>캠핑장명</option>
					        <option>지역</option>
					     </select>
					         <input type="text" name="writee" placeholder="검색어를 입력하세요"/>
                          <input type="button" valign="bottom" value="검색"style="font-size:10px"> 


					</div>
			
			<!-- ---------------------메인시작----------Main -->
				<section id="main">
					<div class="container">
						<div class="row gtr-200">
							
							<div class="col-12">


								<!-- Blog -->
									<section class="box blog">
										<h2 class="major"><span>캠프 상세</span></h2>
										<div>
											<div class="row">
												<div class="col-9 col-12-medium">
													<div class="content">

														<!-- Featured Post -->
															<article class="box post">
																<header>
																	<h3>캠핑장이름</h3>
																	<p>캠핑장 짧은 소개</p>
																	<ul class="meta">
																		<li class="icon">조회수 </li>
																		<li class="icon fa-comments"><a href="#">댓글수</a></li>
																	</ul>
																</header>
														
								<!--img 캐러셀-->			
								        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                          <!-- Indicators -->
                                          <ol class="carousel-indicators">
                                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                          </ol>

                                          <!-- Wrapper for slides -->
                                          <div class="carousel-inner" role="listbox">
                                            <div class="item active">
                                              <img src="../../resources/css/camping/assets/css/images/캠핑장이미지.jpg" alt="...">

                                            </div>
                                            <div class="item">
                                              <img src="../../resources/css/camping/assets/css/images/캠핑장이미지1.jpg" alt="...">

                                            </div>
                                                <div class="item">
                                              <img src="../../resources/css/camping/assets/css/images/캠핑장이미지2.jpg" alt="...">

                                            </div>
                                            ...
                                          </div>

                                          <!-- Controls -->
                                          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                          </a>
                                          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                          </a>

                                        </div>



																
																
																<p>캠핑장 긴 소개 
																	Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in lectus. Praesent
																	semper mod quis eget mi. Etiam sed ante risus aliquam erat et volutpat. Praesent a
																	dapibus velit. Curabitur sed nisi nunc, accumsan vestibulum lectus. Lorem ipsum
																	dolor sit non aliquet sed, tempor et dolor. Praesent a dapibus velit. Curabitur
																	accumsan.
																</p>
																<a href="#" class="button"> 예약하기</a>
															</article>

													</div>
												</div>
												<div class="col-3 col-12-medium">
													<div class="sidebar">

														<!-- Archives -->
															<ul class="divided">
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">A Subheading</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">6 hours ago</li>
																			<li class="icon fa-comments"><a href="#">34</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Another Subheading</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">9 hours ago</li>
																			<li class="icon fa-comments"><a href="#">27</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">And Another</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">Yesterday</li>
																			<li class="icon fa-comments"><a href="#">184</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">And Another</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">2 days ago</li>
																			<li class="icon fa-comments"><a href="#">286</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">And One More</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">3 days ago</li>
																			<li class="icon fa-comments"><a href="#">8,086</a></li>
																		</ul>
																	</article>
																</li>
															</ul>
															<a href="#" class="button alt">Archives</a>

													</div>
												</div>
											</div>
										</div>
									</section>
                               </div>
						</div>
                     
                      <!-- 댓글테이블 -->
                             <br><br>
                              
                               <div class="container-card col-10">
                               <span class="glyphicon glyphicon-user"> comment</span>
                               <br>
                                <div class="row">
                                      <div class="col-sm-12"  >
                                       
                                        <div class="card">
                                          <div class="card-body" >
                                            <h5 class="card-title"><b> 홍길동 </b>
                                            <span  class="glyphicon glyphicon-time"> <a class="comdate"> 2020-07-22</a></span>
                                            <a style="text-align:right; display:inline">수정/삭제</a>
                                            </h5>
                                            
                                            <p class="card-text">지난 주말 가족들과 다녀왔습니다!</p>
                                            </div>
                                        </div>
                                             
                                          <div class="card">
                                            <div class="card-body">
                                               <h5 class="card-title"><b> user1  </b>
                                               <span class="glyphicon glyphicon-time"><a class="comdate"> 2020-07-22</a></span></h5>
                                                <p class="card-text">너무 좋아요!!!또 가고싶어요</p>
                                            </div>
                                        </div>
                                     </div>
                                    </div>
                                    <hr>
                                               <!--댓글작성-->
                                       <div class="insertcomment">
                                          <div class="card-header">댓글작성</div>
                                          <div class="card-body">
                                           <form action="insertComment">
                                                     <div class="col-12">
                                                       <textarea cols="6" rows="3" placeholder="댓글을 입력해주세요."></textarea>
                                               
                                      
                                               </div>
                                               <div  class="col-12" style="float:right">
                                               <input type="submit" class="search-input" value="등록" style="text-size:1px;" >
                                               </div>
                                           </form>
                                            
                                          </div>
                                       </div>
                                        
                                </div>
                        
                       </div>
                        
                        </section>  

    

        
        
        
        
        
        
        
        
			<!-- Footer -->
				<footer id="footer">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

								<!-- About -->
									<section>
										<h2 class="major"><span>What's this about?</span></h2>
										<p>
											This is <strong>TXT</strong>, yet another free responsive site template designed by
											<a href="http://twitter.com/ajlkn">AJ</a> for <a href="http://html5up.net">HTML5 UP</a>. It's released under the
											<a href="http://html5up.net/license/">Creative Commons Attribution</a> license so feel free to use it for
											whatever you're working on (personal or commercial), just be sure to give us credit for the design.
											That's basically it :)
										</p>
									</section>

							</div>
							<div class="col-12">

								<!-- Contact -->
									<section>
										<h2 class="major"><span>Get in touch</span></h2>
										<ul class="contact">
											<li><a class="icon brands fa-facebook-f" href="#"><span class="label">Facebook</span></a></li>
											<li><a class="icon brands fa-twitter" href="#"><span class="label">Twitter</span></a></li>
											<li><a class="icon brands fa-instagram" href="#"><span class="label">Instagram</span></a></li>
											<li><a class="icon brands fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>
											<li><a class="icon brands fa-linkedin-in" href="#"><span class="label">LinkedIn</span></a></li>
										</ul>
									</section>

							</div>
						</div>

						<!-- Copyright -->
							<div id="copyright">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
								</ul>
							</div>

					</div>
				</footer>

        </div>

		<!-- Scripts -->

			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
            <script> 
                $('.carousel').carousel()
            </script>
 

	</body>
</html>