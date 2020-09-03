<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html> 
 <html>
<head>
    <title>GoGreen 메인페이지</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="../../resources/css/nav.css" />
    <link rel="stylesheet" href="../../resources/css/mainpage.css" />
    <!--fontawesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script type="text/javascript" 
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

</head>
	<style>
	#logoback{
   background-color:#f1f5f0;
   width: 100%;
   height: 340px;
   padding-top: 50px;
   }

	a{
	text-decoration: none;
	}
	
	h2{
	color: black;
	}
	
	/*테스트  */
	
	
	body {
	font-family: 'Nanum Gothic', sans-serif;
}

a {
	color: black;
}

a:hover {
	color: black;
	text-decoration: none;
}

a:viste {
	color: black;
}

.row {
	margin: 5px;
	padding: 5px;
}

 .nac{
	list-style: none;
	/* 불릿없앰*/
	display: inline-table;
	/* 테이블스타일로배치*/
	padding: 10px 20px;
	/* 안여백은각각10px로*/
}

.container li:hover{
	-ms-transform: scale(1.1);
 	-webkit-transform: scale(1.1);
 	transform: scale(1.1);
}

#subject {
	/* color : #FACC2E; */
	text-align: center;
	padding: 50px 0;
}

div.card-body {
	background-color: F8F8F8;
}

b.card-title {
	padding: 50px 0;
	text-align: center;
	font-size: 15px;
/* 	font-weight: 1px; */
}
	</style>
<body>


 <jsp:include page="menuBar.jsp"></jsp:include>


    <!-- Header -->
    <section id="header">
	
        <!-- Banner -->
     
             <div id="logoback" >
                <img src="../../resources/imgs/logo_transparent.png" alt="메인" style="width:250px;hight:250px; margin-left: 800px;">
             
             
             </div>    
             
      

        <!-- Intro -->
        <section id="intro" class="container">
            <div class="row">
 				<div class="col-4 col-12-medium">
                    <section class="first">
                        <i class="icon solid featured fa-campground"></i>
                        <header>
                           <a href="campingList.do"><h2>전국 캠핑장 조회</h2></a>
                        </header>
                        <p>전국의 캠핑장을 조회할 수 있으며 예약이 가능합니다. 지도검색을 통해 각 지역의 모든 캠핑장 목록을 조회할 수 있습니다.</p>
                    </section>
                </div>
               
				<div class="col-4 col-12-medium">
                    <section class="middle">
                        <i class="icon solid featured alt fa-star"></i>
                        <header>
                            <h2>나만의 캠핑</h2>
                        </header>
                        <p>많이 알려지지 않았거나, 숨겨진 캠핑지를 많은 사람들과 공유해보세요!<br>
                        태그와 지도 클릭을 통한 맞춤형 캠핑지를 검색해보세요! 별점도 등록할수 있습니다!</p>
                    </section>
                </div>

                <div class="col-4 col-12-medium">
                    <section class="last">
                        <i class="icon solid featured alt2 fa-bolt"></i>
                        <header>
                           <a href="ulist.do"></a> <h2>중고용품 게시판</h2></a>
                        </header>
                        <p>캠핑 중고용품을 사고 팔수있습니다. 채팅을 통해 사람들과 편하게 구매하세요.</p>
                    </section>
                </div>
            </div>
            <footer>
                <ul class="actions">
                   <!--  <li class="nac"><a href="campingList.do" class="button large">캠핑 예약하기</a></li> -->
                    <li class="nac"><a href="campingList.do" class="button large" style="margin-left:20px;">캠핑 예약하기</a></li>
                    <li class="nac"><a href="myclist.do" class="button alt large" style="margin-left:55px;">나만의 캠핑</a></li>
                    &nbsp;<li class="nac"><a href="ulist.do" class="button large"  style="margin-left:55px;">중고용품 바로가기</a></li>
                </ul>
            </footer>
        </section>

    </section>



<!-- 캠핑장 TOP3 -->
	<section>
		<div style="justify-content: center; background-color: #f7f7f7">
			<div class="container">
				<h4 id="subject"><b>추천 캠핑장</b></h4>
				<ul>
				<c:forEach var="c" items="${camping }">
					<li class="nac">
						<a href="/">
							<div class="card" style="width: 300px;">
		
								<img src="../../resources/css/camping/assets/css/images/${c.cNo }.jpg" width="300px" height="300px" style="float: left">
								<div class="card-body">
									<center>
										<b class="card-title"> ${c.cName } </b>
									</center>
								</div>
							</div>
						</a>
					</li>
					</c:forEach>
				</ul>
			</div><br><br>
		</div>
	</section>
	
	<!-- 나만의 캠핑장 TOP3 -->
	<!-- 현진 나만의 캠핑 최신순 top3 출력-->
	<div class="mycamptop3" style="margin-bottom:-100px;margin-top:-50px;text-align:center;">
        <p id="subject"><h4><b>나만의 캠핑지</b></h4><br><h5>지금 막 등록된 새로운 캠핑지 정보를 알아보세요!</h5></p>
        </div>
        
        <!-- 현진 나만의 캠핑 최신순 top3 출력-->
        <section id="intro" class="container">
            <div class="row" >
            
            <c:forEach var="myc" items="${topList }">
         
         <div class="col-4 col-12-medium">
                    <section class="first">
            
            <div class="box" style="box-shadow: none;">
            
            <%-- <c:if test="${empty myc }">
               <p>해당 검색과 일치하는 게시글이 없습니다.</p>
            </c:if> --%>
            
            <c:set var="loop_flag" value="false" />
             
             
           <!-- 캠핑장 추천 top3 -->  
             <c:forEach var="fileList" items="${fileList }">
                <c:choose>
                   <c:when test="${fileList.mycNo eq myc.mycNo}">
                      <a href="${mycdetail }" class="image fit" >
                     <img src="../../resources/myCampFiles/${fileList.mycFileName}" alt="" style="width: 100%;
            height:200px;!important"/>
                     </a>
                     <c:set var="loop_flag" value="true" />
                   </c:when>
                </c:choose>
             </c:forEach>
               
                   <div class="inner">
                     <%-- <p style="color: black;">${myc.mycNo}</p> --%>
                     <h3>${myc.mycTitle}</h3>
                     <p style="color: #595959;margin-bottom:10px;">${myc.mycPlace}</p>
                     <%-- <p style="color: black;">${myc.mycDetail}</p> --%>
                     <c:if test="${myc.mycTag==null}">
                        <h3 style="color: #595959;margin-bottom:10px;">등록되지 않음</h3>
                     </c:if>
                     <c:if test="${myc.mycTag!=null}">
                        <p style="color:#595959;margin-bottom:10px;background-color:#eafaea;">${myc.mycTag}</p>
                     </c:if>
                     <p style="color: #595959;margin-bottom:10px;font-size:0.8em;"> 조회수 : ${myc.mycViewCnt}</p>
                     <c:url var="mycdetail" value="mycdetail.do">
                        <c:param name="mycNo" value="${myc.mycNo }" />
                        <c:param name="page" value="${mycpi.mycCurrentPage }" />
                     </c:url>
                     <a href="${mycdetail }"  id="detailbtn" class="button fit detailbtn" style="box-shadow:none;background-color:white;border:solid #b5e5ac 1px;color: #4C7146!important;">상세보기</a>
                  </div> 
            
               
              </section>
              </div>
            
            </c:forEach>
	</div>
	</section>

<!-- 중고top3 -->

 <section>
 <div style="justify-content: center; background-color: #f7f7f7">
 <div class="container">
 <h4 id="subject" style="margin-bottom:-50px;margin-top:-30px;"><b>중고용품 판매</b></h4>
<div class="row" id="usedMain">
            <c:forEach var="vo" items="${uMList}">
                  <div class="col-lg-4 youngjune">

                     <div class="team-member">
                        <div class="cardbox bg-white">

                           <div class="cardbox-heading">
                              <!-- START dropdown-->

                              <a href="URL" onclick="window.open('/createChatRoom.do?usedId=${vo.mId }
                              &usedTitle=${vo.usedTitle }&usedNo=${vo.usedNo }&loginUser=${loginUser.mId }','채팅방','width=430,height=500,top=150,left=600,location=no,status=no,scrollbars=yes');" 
                              return false;"></a>
                              
                              <!-- <div class="dropdown float-right">
                                 <a href="URL"
                                    onclick="window.open(this.href, '_blank', 'width=500px,height=700px,toolbars=no,scrollbars=no'); return false;">
                                    <button class="btn btn-flat btn-flat-icon" type="button"
                                       data-toggle="dropdown" aria-expanded="false">
                                       <i class='fas fa-comments'></i>
                                    </button>
                                 </a>
                              </div> -->


                              <!--/ dropdown -->
                              <div class="media m-0">
                                 <div class="d-flex mr-3"></div>
                                 <div class="media-body">
                              <p class="m-0">
                                 <a href="./udetail.do?usedNo=${vo.usedNo}">${vo.usedTitle}</a>
                              </p>
                              <small><span><i class="icon ion-md-pin"></i>${vo.usedArea}</span></small><br>
                              <small><span><i class="icon ion-md-time"></i>${vo.usedCreateDate}</span></small>
                           </div>
                              </div>
                              <!--/ media -->
                           </div>
                           <!--/ cardbox-heading -->
                           <a href="./udetail.do?usedNo=${vo.usedNo}">
                              <div class="cardbox-item">
                                  <img class="img-fluid" src="/resources/imgs/noticeimg/${vo.usedRenameFilename }" alt="Image"
                                  style="width: 462px; height: 340px; font-size: 28px">
                              </div>
                           </a>
                           <!--/ cardbox-item -->
                           <div class="cardbox-base">
                              <ul class="float-right">

                                 <li class="nac"><a><i class='fas fa-crow'>&nbsp;&nbsp;
                        <c:choose> 
                         <c:when test="${vo.usedYn eq 'Y'}">
                             판매완료
                         </c:when>
                         <c:when test="${vo.usedYn eq 'N'}">
                             판매중
                         </c:when>
                     </c:choose>
                           </i></i></a></li>
                              <li class="nac"><a><em class="mr-5"></em></a></li>
                              </ul>
                              <ul>
                                 <li class="nac"><a><i class='fas fa-eye'>&nbsp;&nbsp;${vo.usedCount}</i></a></li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>                  
            </c:forEach>      
      </div>
      </div>
      </div>
</section>
<br>
<br>
<hr>
<br><br>
<h4 style="text-align:center;">캠핑장 지도로 조회</h4>
	<jsp:include page="../camping/mapprac1.jsp"></jsp:include> 		


<!--캠핑상식 -->
<!-- <div class="container text-center">  
 <h3 class="text-center">캠핑 상식</h3>  
  <ul class="nav nav-tabs">
    <li class="nac" class="active"><a data-toggle="tab" href="#home">바닷가 캠핑 주의 사항</a></li>
    <li class="nac"><a data-toggle="tab" href="#menu1">산악지역 캠핑 주의 사항</a></li>
    <li class="nac"><a data-toggle="tab" href="#menu2">기본 인명 구조 상식</a></li>
  </ul>
<br><br><br>
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h2>바닷가 캠핑 주의 사항</h2>
      <p>프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.

로렘 입숨은 전통 라틴어와 닮은 점 때문에 종종 호기심을 유발하기도 하지만 그 이상의 의미를 담지는 않는다. 문서에서 텍스트가 보이면 사람들은 전체적인 프레젠테이션보다는 텍스트에 담긴 뜻에 집중하는 경향이 있어서 출판사들은 서체나 디자인을 보일 때는 프레젠테이션 자체에 초점을 맞추기 위해 로렘 입숨을 사용한다.</p>
    
    
로렘 입숨은 전통 
    </div>
    <div id="menu1" class="tab-pane fade">
      <h2>산악지역 캠핑 주의 사항</h2>
      <p>프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.

로렘 입숨은 전통 라틴어와 닮은 점 때문에 종종 호기심을 유발하기도 하지만 그 이상의 의미를 담지는 않는다. 문서에서 텍스트가 보이면 사람들은 전체적인 프레젠테이션보다는 텍스트에 담긴 뜻에 집중하는 경향이 있어서 출판사들은 서체나 디자인을 보일 때는 프레젠테이션 자체에 초점을 맞추기 위해 로렘 입숨을 사용한다.</p>
  
로렘 입숨은 전통 
    
        </div>
    <div id="menu2" class="tab-pane fade">
      <h2>기본 인명 구조 상식</h2>
      <p>프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.

로렘 입숨은 전통 라틴어와 닮은 점 때문에 종종 호기심을 유발하기도 하지만 그 이상의 의미를 담지는 않는다. 문서에서 텍스트가 보이면 사람들은 전체적인 프레젠테이션보다는 텍스트에 담긴 뜻에 집중하는 경향이 있어서 출판사들은 서체나 디자인을 보일 때는 프레젠테이션 자체에 초점을 맞추기 위해 로렘 입숨을 사용한다.</p>
   
로렘 입숨은 전통 
    
      </div>
  </div>
</div>
 -->

<br><br><br><br>



<jsp:include page="footer.jsp"></jsp:include>






    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../../../resources/js/jquery.dropotron.min.js"></script>
    <script src="../../../resources/js/jquery.scrolly.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>





</body></html> 
