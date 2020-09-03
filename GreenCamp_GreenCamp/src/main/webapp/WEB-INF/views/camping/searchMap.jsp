<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE HTML>

<html>
	<head>
		<title>지도로 검색</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

		<!--메뉴바 푸터 메인 css  -->
		 <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>  
		 <link rel="stylesheet" href="../../../resources/css/camping/assets/css/main.css" />

       <!--폰트어썸  -->
       <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" rel="stylesheet">
      
		<style>
            #searchMap{
                margin: 10px;
                padding: 10px 10px;
            }
	
		a:hover{
		text-decoration: none;
		}
		.row > * {
 		   padding: 0px 0 0 00px;
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
<%-- 			<jsp:include page="campingsearch.jsp"></jsp:include>
        
         --%>
        
			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-9 col-12-medium">
								<div class="content">

									<!-- Content -->

										<article class="box page-content">

								<!--검색결과창 지도와 헤드 부분!  -->
											<header>
											<div id="searchMap">
												<h3><span>"${str} "검색 결과</span></h3>
												<p>총 ${count } 개의 검색결과가 있습니다.</p>
										<jsp:include page="mapprac1.jsp"></jsp:include> 
											</div>
											</header>

											<section>
											
											</section>
										</article>
								</div>
							</div>
							
							<div class="col-3 col-12-medium">
								<div class="sidebar">
											<section>
												<ul class="divided" id="startbox">
													<!--시작  -->
													<c:forEach var="camping" items="${camping}" begin="0" end="4" step="1">
													<!--하나의 정보 box시작  -->
													<li>
													<article class="box post-summary">
														<h3><a href="campingDetail.do?cNo=${camping.cNo }">${camping.cName}</a></h3> 
														<p>${camping.cAddr}</p>
														
														<ul class="meta">
																			
													 	<c:set var="con" value="${camping.cConUtil }" /> 
													 	<c:set var="cet" value="${camping.cEtc }" /> 
											
													
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
													<%-- 
														<c:if test="${fn:contains(con, '취사')}">
														<li class="showUtil"><i class="fas fa-burn fa-2x"></i></li>	
														</c:if>
														
														
														<c:if test="${fn:contains(con, '매점')}">
														<li class="showUtil"><i class="fas fa-shopping-cart fa-2x"></i></li>	
														</c:if>
														
														
														<c:if test="${fn:contains(con, '전망대')}">
														<li class="showUtil"><i class="fas fa-sbinoculars fa-2x"></i></li>	
														</c:if> --%>
														
														
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
												</article>
												</li>
										<!--하나의 정보 끝  -->
										</c:forEach>
									</ul>
								<a href="#" class="button alt"  id="addBtn" onclick="moreList();">더보기</a>
								</section>
								</div>
							</div>
						
						</div>
					</div>
				</section>

			<!-- Footer -->
			<jsp:include page="../common/footer.jsp"></jsp:include>

		</div>
<input type="hidden" value="${str }" id="strhidden">

            <script>
            
            /*더보기 클릭시 올라가는 함수 선언 */
            clickCount=0;
            
            /* 더보기 함수 */
            function moreList(){
			  var clocal=$("#strhidden").val();
          	
             
                 $.ajax({
                    url : "addsearchMapresult.do",
                    type : "post",
                    dataType : "json",
                    data : {clocal:clocal},
                    success : function(data) {
                    	var addListHtml =""; //데이터를 담아줄변수 선언
                    	
                    	
    					if( data.length > 0 ) {
    							  clickCount+= 1;  
    							  var startnum=clickCount*4     
    							  
    							  /* for문을 이용해 인덱스 4부터 5개씩 출력함 */
    							 for(var i=startnum+1 ; i< startnum*2+ clickCount ;i++){
    						
    							 addListHtml += "<li id='startbox'>";
    							 addListHtml += "<article class='box post-summary'>";
    							 addListHtml += "<h3><a href='#'>"+data[i].cName+"</a></h3>";
    							 addListHtml +=	"<p>"+data[i].cAddr+"</p>";
    							 addListHtml +=	"<ul class='meta'>";
    						
    								
    							 if(data[i].cConUtil.search('화장실')>0){
	 									
								addListHtml += "<li>";
								addListHtml +="<i class='fas fa-restroom fa-2x'>";
								addListHtml +="</i>";
								addListHtml +="</li>"; 
										
											}				
    							 if(data[i].cConUtil.search('전기')>0){
	 									
								addListHtml += "<li>";
								addListHtml +="<i class='fas fa-plug fa-2x'>";
								addListHtml +="</i>";
								addListHtml +="</li>"; 
										
											}				
    							 if(data[i].cConUtil.search('수도')>0){
	 									
								addListHtml += "<li>";
								addListHtml +="<i class='fas fa-sink fa-2x'>";
								addListHtml +="</i>";
								addListHtml +="</li>"; 
										
											}				
    							 if(data[i].cConUtil.search('샤워')>0){
	 									
								addListHtml += "<li>";
								addListHtml +="<i class='fas fa-shower fa-2x'>";
								addListHtml +="</i>";
								addListHtml +="</li>"; 
										
											}				
    							 if(data[i].cConUtil.search('취사')>0){
	 									
								addListHtml += "<li>";
								addListHtml +="<i class='fas fa-burn fa-2x'>";
								addListHtml +="</i>";
								addListHtml +="</li>"; 
										
											}				
    							 if(data[i].cConUtil.search('체험')>0){
	 									
								addListHtml += "<li>";
								addListHtml +="<i class='fas fa-dog fa-2x'>";
								addListHtml +="</i>";
								addListHtml +="</li>"; 
										
											}				
    							 if(data[i].cConUtil.search('음식점')>0){
	 									
								addListHtml += "<li>";
								addListHtml +="<i class='fas fa-shower fa-2x'>";
								addListHtml +="</i>";
								addListHtml +="</li>"; 
										
											}				
    							 if(data[i].cConUtil.search('구장')>0){
	 									
								addListHtml += "<li>";
								addListHtml +="<i class='fas fa-volleyball-ball fa-2x'>";
								addListHtml +="</i>";
								addListHtml +="</li>"; 
										
											}				
    							 if(data[i].cConUtil.search('바베큐')>0){
	 									
								addListHtml += "<li>";
								addListHtml +="<i class='fas fa-wine-glass-alt fa-2x'>";
								addListHtml +="</i>";
								addListHtml +="</li>"; 
										
											}				
    	
										 addListHtml +=		"</ul>";
										 addListHtml +=		"</article>";
										 addListHtml +=		"</li>";
											
											
    							  }
    							  $("#startbox").append(addListHtml);
									/* 스크롤의 위치를 더보기로 조정함 */
    			        			var offset = $('#addBtn').offset(); //선택한 태그의 위치를 반환
    			                        //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
    			                //   var offset= $('.divided').find("#addBtn").position().top;
    			                        
    			                        console.log(offset);
    			        	        $('html').animate({scrollTop : offset.top}, 500);
    			        	      
    					}
                    }
            	
                 });
			}
   
            
            </script>

	</body>
</html>