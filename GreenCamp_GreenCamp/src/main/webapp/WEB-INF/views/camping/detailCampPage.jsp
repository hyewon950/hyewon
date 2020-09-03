<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html lang="en">
    <head>
    <meta charset="utf-8">
		<title>캠핑장 상세페이지</title>
		
	
		<!--메뉴바 푸터 메인 css  -->
		 <script src="../../../resources/css/camping/assets/js/jquery.min.js"></script>
		<link rel="stylesheet" href="../../../resources/css/camping/assets/css/main.css" />

        <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<!--폰트어썸-->
    	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" rel="stylesheet">
    	<!-- 부트스트랩 -->
   		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> 

		<!-- 네이버지도관련 -->
	    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cbgecofdq1"></script>
    
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
            padding: 10px;
            height: 280px;
        }
        a:hover{
        	text-decoration: none;
        	color: green;
        }
        #rebut{
        margin-left: 60px;
        margin-top: 5px;
        }
        
        li{
        list-style: none;
 	    }
        
        .showUtil{
        margin-right: 50px;
        margin-left: 0px;
        display: inline-block;
        }
        #showMenubox{
       /*  border: 2px solid #e3e6f0; */
        padding: 23px 3px 3px 3px;
        margin-top: 10px;
        background-color:whitesmoke;
		border-radius: 2px;
		width: 90%;
		height: 120px;
		
        }
        
        #insidebutton{
         float: right;
         vertical-align:text-top;

        }
        
         .star_rating {font-size:0; letter-spacing:-4px;}
		.star_rating a {
		    font-size:22px;
		    letter-spacing:0;
		    display:inline-block;
		    margin-left:5px;
		    color:#ccc;
		    text-decoration:none;
		}
		.star_rating a:first-child {margin-left:0;}
		.star_rating a.on {color:#777;}
		.star_rating a:hover{
		text-decoration: none;
		}
		/* .star_rating a:active{
		text-decoration: none !important;
		} */
		
		
        .fa-4x{
        color: gray;}
        
       li h5{
        margin-left: 9.5px;
        }
        
        /* 테스트 좋아요 조회수 css*/
        .header_ctr {
		display:inline-block;
		border: 1px #ddd solid;
		color:#444;
		border-radius:2px;
		padding:0 15px 15px 10px;
		height:28px;
		line-height:29px;
		margin-right: 10px;
		}	
		 a:hover{
		text-decoration: none;
		}
		
		a i.far {
		border-right:1px #ddd solid;
		width:28px;
		}
		
        #likecss a:hover{
            color: #777;
   			border-color: #cc4b9e;
   			text-decoration: none;
        }
      
    
       .star_rating a.on{
       text-decoration: none;
       }
        
        </style>
    
	</head>
	<body class="homepage is-preload">
		
			<!-- Nav -->
			
			<jsp:include page="../common/menuBar.jsp"></jsp:include>
		
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<h1><a href="index.html" id="logo">greencamp</a></h1>
								
						</div>
					</div>
					
				</header>


			<!-- Banner -->
			
			<!--  검색바-->
	 	<jsp:include page="campingsearch.jsp"></jsp:include> 
			
			
			<!-- ---------------------메인시작----------Main -->
				<section id="main">
					<div class="container">
						<div class="row gtr-200">
							
							<div class="col-12">

								<!-- Blog -->
									<section class="box blog">
										<h2 class="major"><span>${camping.cName }</span></h2>
										<div>
											<div class="row">
												<div class="col-9 col-12-medium">
													<div class="content">

														<!-- Featured Post -->
															<article class="box post">
																<header>
																
																	<h3>${camping.cName }</h3>
																	<p>${camping.cType }</p>
																	
																	
				
								<a href="#" class="header_ctr" onclick="likebutton();" style="text-decoration: none;" id="likecss">
								<i class="far"><img src="../../resources/css/camping/images/likebutton.png" alt="추천하기"style="width:15px;height:15px;"></i>
								좋아요
								<span id="campingcRecom"></span>
								</a>
								
								<a class="header_ctr">
								<i class="far fa-eye"></i>
								조회수
								<span>${camping.cCount}</span>
								</a>
								
														 			
																</header>
														<br>
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
                                             
										
											<c:set var = "str" value = "${camping.cName }"/>
											<c:if test="${fn:contains(str,'숲속가든')}">
												<img src="../../resources/css/camping/assets/css/images/10.jpg"" alt="..." style="width:100%;" >
											</c:if>
											
											
											
											 <img src="../../resources/css/camping/assets/css/images/${camping.cImg }.jpg"" alt="..." style="width:100%;" >
                                            </div>
                                            <div class="item">
                                              <img src="../../resources/css/camping/assets/css/images/${camping.cImg+3}.jpg"" alt="..." style="width:100%;" >

                                            </div>
                                                <div class="item">
                                              <img src="../../resources/css/camping/images/112.jpg"" alt="..." style="width:100%;">

                                            </div>
                                          
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
									<!---------------------------------------------------------------------------------------------- -->
								<br>
								<hr><br>
									<h4><i class="far fa-check-circle" style="color:#ad4284;"></i> <b>캠핑장 소개</b></h4><br>
								<h5>&nbsp;&nbsp;백두대간의 푸르름과 맑고 깨끗한 계곡에서 소박하게 캠핑할 수 있는 작은공간을 마련했습니다.놀러오셔서 행복한추억 만들어보세요</h5>	
										<br>
								<!-- 주소 지도관련 -->	
								<hr><br>
									<h4><i class="far fa-check-circle" style="color:#ad4284;"></i> <b>위치정보</b></h4><br>				
									<h4><p><i class="fas fa-map-marked-alt"> ${camping.cAddr }</i></p></h4><br>
								
									<div id="map" style="width:80%;height:400px;"></div>
								<br><hr><br>
							</article>
						</div>
						
						
								<!------ 편의시설 세부사항 보여주는  div ---------------->
								
							<h4><i class="far fa-check-circle" style="color:#ad4284;"></i> <b>편의 시설정보</b></h4>
									<div id="showMenubox" style="display: inline-block;">
										<%-- 	<p>${camping.cConUtil }</p> --%>
										
									 	<c:set var="con" value="${camping.cConUtil }" /> 
									 	<c:set var="cet" value="${camping.cEtc }" /> 
										<ul>
											
												<c:if test="${fn:contains(con,'화장실')}">
												<li class="showUtil"><i class="fas fa-restroom fa-4x"><h5>화장실</h5></i></li>	
												</c:if>
											
											
												<c:if test="${fn:contains(con, '전기')}">
												<li class="showUtil"><i class="fas fa-plug fa-4x"><h5>전기</h5></i></li>	
												</c:if>
										
											
												<c:if test="${fn:contains(con,'수도')}">
												<li class="showUtil"><i class="fas fa-sink fa-4x"><h5>수도</h5></i></li>	
												</c:if>
											
										
												<c:if test="${fn:contains(con, '샤워')}">
												<li class="showUtil"><i class="fas fa-shower fa-4x"><h5>샤워</h5></i></li>	
												</c:if>
												
												<c:if test="${fn:contains(con, '취사')}">
												<li class="showUtil"><i class="fas fa-burn fa-4x"><h5>취사</h5></i></li>	
												</c:if>
												
												
												<c:if test="${fn:contains(con, '매점')}">
												<li class="showUtil"><i class="fas fa-shopping-cart fa-4x"><h5>매점</h5></i></li>	
												</c:if>
												
												
												<c:if test="${fn:contains(con, '전망대')}">
												<li class="showUtil"><i class="fas fa-sbinoculars fa-4x"><h5>전망대</h5></i></li>	
												</c:if>
												
												
												<c:if test="${fn:contains(con, '수대')}">
												<li class="showUtil"><i class="fas fa-sink fa-4x"><h5>수대</h5></i></li>	
												</c:if>
												
												<c:if test="${fn:contains(con, '광장')}">
												<li class="showUtil"><i class="fas fa-square-full fa-4x"><h5>광장</h5></i></li>	
												</c:if>
												
												<c:if test="${fn:contains(con, '체험')}">
												<li class="showUtil"><i class="fas fa-dog fa-4x"><h5>체험</h5></i></li>	
												</c:if>
												
												<c:if test="${fn:contains(con, '구장')}">
												<li class="showUtil"><i class="fas fa-volleyball-ball fa-4x"><h5>구장</h5></i></li>	
												</c:if>
												
												
												<c:if test="${fn:contains(con, '바베큐')}">
												<li class="showUtil"><i class="fas fa-wine-glass-alt fa-4x"><h5>바베큐</h5></i></li>	
												</c:if>
												
												<!-- C_ETCTL -->
												
												<c:if test="${fn:contains(cet, '카라반') or fn:contains(con, '카라반')}">
												<li class="showUtil"><i class="fas fa-caravan fa-4x"><h5>카라반</h5></i></li>	
												</c:if>
												
												<c:if test="${fn:contains(cet, '와이파이')or fn:contains(con, '와이파이')}">
												<li class="showUtil"><i class="fas fa-wifi fa-4x"><h5>와이파이</h5></i></li>	
												</c:if>
												
												<c:if test="${fn:contains(cet, '수영장') or fn:contains(con, '수영장') }">
												<li class="showUtil"><i class="fas fa-swimming-pool fa-4x"><h5>수영장</h5></i></li>	
												</c:if>
												
												
											
											
											<li>
											</li>
										</ul>	
									</div>
											<br><br><br>
										<hr><br>
									&nbsp;*greencamp에 등록된 정보는 현장상황과 다소 다를 수 있으니 애완동물 동반 여부, 부가 시설물, 추가차량 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.			
											<br><hr>		
													
												</div>
												<div class="col-3 col-12-medium">
													<div class="sidebar">

														<!-- Archives -->
															<ul class="divided">
																<li>
																	<article class="box post-summary">
																	
																		<h5><i class="fas fa-phone-alt">  연락처</i></h5><br>
																		  &nbsp;${camping.cPhone}
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h5><i class="fas fa-clock">  운영시간</i></h5><br>
																		<c:if test="${!empty camping.cCharge }">
																			&nbsp;${camping.cTime}
																	</c:if>
																		<c:if test="${empty camping.cCharge }">
																			<h5>&nbsp;전화 문의 바랍니다.</h5>
																	</c:if>
																	
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h5><i class="fas fa-won-sign">  요금</i></h5><br>
																			<c:if test="${!empty camping.cCharge }">
																			&nbsp;${camping.cCharge }
																			</c:if>
																			<c:if test="${empty camping.cCharge }">
																				<h5>&nbsp;전화 문의 바랍니다.</h5>
																			</c:if>
																			
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h5><i class="fas fa-car">  주차장 면수 </i></h5><br>
																		<c:if test="${!empty camping.cParkSum  }">
																		&nbsp;${camping.cParkSum }
																		</c:if>
																		<c:if test="${empty camping.cParkSum  }">
																		<h5>&nbsp;전화 문의 바랍니다.</h5>
																		</c:if>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h5><i class="fas fa-check-circle">  안전시설</i></h5><br>
																		 &nbsp;${camping.cSafe }
																	</article>
																</li>
														
															<li>
																<article class="box post-summary">
																<c:url var="RESER" value="reservation.do">
																	<c:param name="cNo" value="${camping.cNo}" />
																</c:url>
																<c:if test="${loginUser ne null}">
																	<a href="${RESER}" class="button alt" id="rebut" style="text-decoration:none;">예약하기</a>
																</c:if>
																<c:if test="${loginUser eq null}">
																	<a href="loginView.do"  onclick="return confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?');"class="button alt" id="rebut" style="text-decoration:none;">예약하기</a>
																</c:if>
															</article>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</section>
                               </div>
						</div>
                     
                      <!-- 댓글테이블 -->
                             <br><br>
                              
                               <div class="container-card col-10" style="border-radius: 5px;">
                               <span class="glyphicon glyphicon-user"> comment</span>
                               <br>
                                <div class="row">
                                      <div class="col-sm-12" id="reviewbody" >
          
                                     </div>
                                    </div>
                                    <hr>
                                  <!--댓글작성-->
                                     <div class="card">
                                       <div class="insertcomment">
                                          <div class="card-header">댓글작성 </div>
											 <form action="insertComment">
                                       			   <div class="card-body">
	                                       			   	<p class="star_rating">
														    <a href="#" class="on" onclick="star1();" id="staron">별점 ★</a>
														    <a href="#" class="on"  onclick="star2();" id="staron">★</a>
														    <a href="#" class="on"  onclick="star3();" id="staron">★</a>
														    <a href="#" onclick="star4();" id="staron">★</a>
														    <a href="#" onclick="star5();" id="staron">★</a>
														</p>
                                                     <div class="col-12">
                                                     
                                                     <!--아이디와 예약번호가 일치하는 사람만 후기 작성 가능하게함  -->
                                                     <c:if test="${loginUser ne null}">
                                                         <textarea class="form-control col-12" rows="5" placeholder="캠핑장 후기를 입력해주세요." id="contentarea"></textarea>
                                                     </c:if>
                                               <!--로그인 한 사람만 작성 할 수 있음-->
                                                    <c:if test="${loginUser.mId eq null}"> 
                                                       <textarea  value="Press Me" onclick="checklogin();" class="form-control col-12" rows="5" placeholder="댓글을 입력해주세요." ></textarea>
                                                     </c:if>
                                               		 </div>
                                              		 <div  class="col-12" style="float:right">
                                             		  	<input type="button" class="search-input" value="수정완료" style="text-size:1px; display:none;" id="updatebutton" >
                                             		  	<input type="button" class="search-input" value="등록" style="text-size:1px; display:block;" id="insertbutton" >
                                             		 </div>
                                         			 </div>
                                         	 </form>
                                       </div>
                                       </div>
                                      <!-- 테스트 -->
                              	  </div>
                       </div>
                    </section>  

    

        
        
        
        
        
        
        
        
			<!-- Footer -->
				<jsp:include page="../common/footer.jsp"></jsp:include>

        </div>



		<!-- 스크립트로보내기 위한 id -->
		<input type="hidden" value="${loginUser.mId }" id="getloginUserId">






		<!-- Scripts -->

			<script src="../../../resources/css/camping/assets/js/browser.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/breakpoints.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/util.js"></script>
			<script src="../../../resources/css/camping/assets/js/main.js"></script> 
			
 	<script>
 	//페이지 로딩시 좋아요개수,댓글 불러옴
	$(function(){
		getRecommCount();
	 	selectReviewList();
	 	
	});
	
 	
 	
	//댓글 등록 함수
	$("#insertbutton").on("click", function() {
		
		var rvContent=$("#contentarea").val();
		var cNo=${camping.cNo};
		var commentStar=star;     //별점을 숫자로 바꿔줌
		
		$.ajax({
			url :"insertrv.do",
			data : {rvContent:rvContent, cNo:cNo, commentStar:commentStar},
			type : "post",
			success : function(data) {  //data를 String 으로 받아옴
				if(data == "success") {
					console.log("성공");
					 selectReviewList();  //성공시 댓글을 바로 불러옴
					$("#contentarea").val("");
				}else if(data == "fail"){
					alert('예약한 회원만 후기 작성이 가능합니다.');  //로그인 했으나 예약하지 않았을떄
				}else if(data == "over"){
					alert('후기는 한번만 작성 가능 합니다.!'); //로그인했으나 후기를 이미 작성한 회원
				}
			}
		});
	});
	
	//댓글 리스트 출력함수
	function selectReviewList(){
			var cNo = ${camping.cNo};
			
			$.ajax({
				url:"campingRvList.do",
				data:{cNo:cNo},
				dataType:"json", //응답이 오는 data는(밑에꺼) json형태 이다.
				success:function(data){ //controller에서 json으로 받아오는 코드 만들어줌
					$reviewbody=$("#reviewbody");
					$reviewbody.html("");
					var userId=$("#getloginUserId").val();
					console.log("length : "+data.length);
					
					var $div;
					var $h5;
					var $mId;
					var $rvNo;
					var $resNo;
					var $cNo;
					var $mId;
					var $rvContent;
					var $rvDate;
					var $commentStar;
				
					
					if( data.length > 0 ) {
						for ( var i in data ) {
		
							
							$div1 = $("<div>");
							$div = $("<div class='card'>");
							$div2 = $("<div class='card-body'>");
							$h5 = $("<h5 class='card-title'>");
							$h6 = $("<b>").text(data[i].mId);
							
							
							$span = $("<span class='glyphicon '>"); /* glyphicon-time */ 
							$span1 = $("<a class='comdate'>").text(data[i].rvDate);
							//수정 삭제 버튼
							$span2=$("<span>");
							$upbtn=$("<button class='button' id='showupbtn' onclick='mycCommentUpdateShow(this,"+data[i].rvNo+");' style='text-align:center; display:inline; margin-left:50px;font-size:8px'>").text("수정");
							$delbtn=$("<button class='button' id='delbtn' onclick='mycCommentDelete(this,"+data[i].rvNo+");' style='text-align:center; display:inline; margin-left:5px;font-size:8px'>").text("삭제"); 
							//후기 내용
							$rvContent=$("<p class='card-text'>").text(decodeURIComponent(data[i].rvContent.replace(/\+/g, " ")));
							
							$UpdateStarspan =$("<p class='star_rating'>");
							$UpdateStar1 =$("<a href='#' class='on' onclick='star1();' >").text('별점: ★');
							$UpdateStar2 =$("<a href='#' class='on' onclick='star2();' >").text('★');
							$UpdateStar3 =$("<a href='#' class='on' onclick='star3();' >").text('★');
							$UpdateStar4 =$("<a href='#' class='on' onclick='star4();' >").text('★');
							$UpdateStar5 =$("<a href='#' class='on' onclick='star5();' >").text('★');
							
							
							$div1.append($div);
							$div.append($div2);
							$div2.append($h5);
							$h5.append($h6);
							$h5.append($span);
							$span.append($span1);
							
							$h5.append($span2);
	 						if(data[i].commentStar >= 5){
	 							$span2.append("★★★★★")}
							else if(data[i].commentStar == 4){
								$span2.append("★★★★☆")}
							else if(data[i].commentStar == 3){
								$span2.append("★★★☆☆")}
							else if(data[i].commentStar == 2){
								$span2.append("★★☆☆☆")}
							else if(data[i].commentStar == 1){
								$span2.append("★☆☆☆☆")}
	 					
	 					//글을 등록한 회원이라면 삭제/수정버튼이 보임
						if(userId == data[i].mId){
							 $h5.append($upbtn);  //수정버튼 
							$h5.append($delbtn);
							 console.log("loginuser:"+userId);
						}
							$div2.append($rvContent);
							$reviewbody.append($div);
						
					}}else{
						$div = $("<div>");
						$mycComment = $("<p>").text("등록된 후기가 없습니다.");
						$div.append($mycComment);
						$reviewbody.append($div);
					}
				}
				});
			}
	
		
		//댓글수정 textarea창에 보여주는 함수 
		//클릭시 선택한 내용이 textarea에 들어감
		  function mycCommentUpdateShow(obj,rvNo) {
	
			  var content=$(obj).parent().next().text();
		    	console.log("obj"+ content);
			
		//	 var star=$(obj).prev().text(); //별점 text가져오는 선택자임
		    	
			$("#contentarea").val(content);
			$("#updatebutton").css("display" ,"block");
			$("#insertbutton").css("display" ,"none");
			
		
		}  
		
		//댓글 수정 update하는 구문
		 $("#updatebutton").on("click", function(){
				
				var rvContent=$("#contentarea").val();
				var cNo=${camping.cNo};
				var commentStar=star;     //별점을 숫자로 바꿔줌
					
				$.ajax({
					url :"updatecampreview.do",
					data : {rvContent:rvContent, cNo:cNo, commentStar:commentStar},
					type : "post",
					success : function(data) {  //data를 String 으로 받아옴
						if(data == "success") {
							console.log("성공");
							 selectReviewList();  //성공시 댓글을 바로 불러옴
							$("#contentarea").val("");
						}
					}
				});
			});
				
				
	      
	
	
		//댓글 삭제
		function mycCommentDelete(obj,rvNo){
			var cNo=${camping.cNo};
			if(confirm('정말로 후기를 삭제하시겠습니까?')){
			console.log("rvNo:"+rvNo);
			$.ajax({
				url :"deleteCampReview.do",
				data : {rvNo:rvNo, cNo:cNo},
				type : "post",
				success : function(data) {  //data를 String 으로 받아옴
					if(data == "success") {
						alert('삭제되었습니다.');
						 selectReviewList();  //성공시 댓글을 바로 불러옴
					}
				}
			});
			
			}
		}
	
	
		 	
		 	//좋아요 갯수 올라가는 
		 		function likebutton(){
		 			var cNo =${camping.cNo};
		 			//var userId=${loginUser.mId}; db에 좋아요를 누른 userId도 저장해야한다
		 			
		 			
		 			console.log("cNo22 : " + cNo);
		 			$.ajax({
						url : "insertRecommend.do",
						data : { cNo : cNo },
						success : function(data) {  //data를 String 으로 받아옴
							console.log("data : " + data);
							if(data == "success") {
								getRecommCount();
							}else{
								console.log("실패!! : " + cNo);
							}
								}
		 			});
		 		};
		 		
		 		
		 	//좋아요 갯수 가져오는
		 	function getRecommCount() {
				var cNo=${camping.cNo};
					$.ajax({
						url : "likecount.do",
						 type: "POST",
						data : {cNo:cNo},
						success : function(data) {  //data를 String 으로 받아옴
								 $("#campingcRecom").html(data);
							}
		 			});
				}
				 	
			//별점 주는 스크립트
				$( ".star_rating a" ).click(function() {
				     $(this).parent().children("a").removeClass("on");
				     $(this).addClass("on").prevAll("a").addClass("on");
				     return false;
				});

	
		//별점을 숫자로 바꿔주기
			  star=0;
			
			function star1(){
				 star=1;
			}
			function star2(){
				 star=2;
			}
			function star3(){
				 star=3;
			}
			function star4(){
				 star=4;
			}
			function star5(){
				 star=5;
			}
			
	
			/* 네이버 지도 api관련 */
			//위도 경도 불러와서 넣어줌
			var lat=${camping.latitude};
			var lon=${camping.longitude};
			
			var mapOptions = {
					  center: new naver.maps.LatLng(lat, lon),
					  zoom: 15
					};

			var map = new naver.maps.Map('map', mapOptions);
			console.log("위도:"+lat+"경도:"+ lon);
			
			/* 마커 생성 */
			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(lat, lon),
			    map: map
			});
			
			function checklogin(){
				var result=confirm("로그인이 필요한 서비스 입니다. 로그인 페이지로 이동 하시겠습니까?");
				
				if(result){
					location.href="loginView.do"
				}
				
			}
 	</script>          
 

	</body>
</html>