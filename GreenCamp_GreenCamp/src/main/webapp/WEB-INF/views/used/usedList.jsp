<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet"
	href="../../../resources/css/usedBoard/assets/css/main.css" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<script src="../../../resources/css/camping/assets/js/jquery.min.js"></script>
<script
	src="../../../resources/css/camping/assets/js/jquery.dropotron.min.js"></script>
<script
	src="../../../resources/css/camping/assets/js/jquery.scrolly.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--폰트어썸-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
	rel="stylesheet">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<link
	href="https://fonts.googleapis.com/css2?family=Song+Myung&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">

<!------ Include the above in your HEAD tag ---------->



<style>
.hero {
	padding: 6.25rem 0px !important;
	margin: 0px !important;
}

.cardbox {
	border-radius: 3px;
	margin-bottom: 20px;
	padding: 0px !important;
}

.cardbox .cardbox-heading {
	padding: 16px;
	margin: 0;
}

.cardbox .btn-flat.btn-flat-icon {
	border-radius: 50%;
	font-size: 30px;
	height: 32px;
	width: 32px;
	padding: 0;
	overflow: hidden;
	color: #fff !important;
	background: #b5b6b6;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.cardbox .float-right .dropdown-menu {
	position: relative;
	left: 13px !important;
}

.cardbox .float-right a:hover {
	background: #f4f4f4 !important;
}

.cardbox .float-right a.dropdown-item {
	display: block;
	width: 100%;
	padding: 4px 0px 4px 10px;
	clear: both;
	font-weight: 400;
	font-family:;
	font-size: 35px !important;
	color: #848484;
	text-align: inherit;
	white-space: nowrap;
	background: 0 0;
	border: 0;
}

.media {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: start;
	align-items: flex-start;
}

.d-flex {
	display: -ms-flexbox !important;
	display: flex !important;
}

.media .mr-3 {
	margin-right: 1rem !important;
}

.media img {
	width: 48px !important;
	height: 48px !important;
	padding: 2px;
	border: 2px solid #f4f4f4;
}

.media-body {
	-ms-flex: 1;
	flex: 1;
	padding: .4rem !important;
}

.media-body p {
	font-family:;
	font-weight: 500 !important;
	font-size: 14px;
	color: #88898a;
}

.media-body small span {
	font-family:;
	font-size: 12px;
	color: #aaa;
	margin-right: 10px;
}

.cardbox .cardbox-item {
	position: relative;
	display: block;
}

.cardbox .cardbox-item img {
	
}

.img-responsive {
	display: block;
	max-width: 100%;
	height: auto;
}

.fw {
	width: 100% !important;
	height: auto;
}

.cardbox-base {
	border-bottom: 2px solid #f4f4f4;
	border-radius: 1px 1px 15px 15px;
}

.cardbox-base ul {
	margin: 10px 0px 10px 15px !important;
	padding: 10px !important;
	font-size: 0px;
	display: inline-block;
}

.cardbox-base li {
	list-style: none;
	margin: 0px 0px 0px -8px !important;
	padding: 0px 0px 0px 0px !important;
	display: inline-block;
}

.cardbox-base li a {
	margin: 0px !important;
	padding: 0px !important;
}

.cardbox-base li a i {
	position: relative;
	top: 4px;
	font-size: 16px;
	color: #8d8d8d;
	margin-right: 15px;
}

.cardbox-base li a span {
	font-family:;
	font-size: 14px;
	color: #8d8d8d;
	margin-left: 20px;
	position: relative;
	top: 5px;
}

.cardbox-base li a em {
	font-family:;
	font-size: 14px;
	color: #8d8d8d;
	position: relative;
	top: 3px;
}

.cardbox-base li a img {
	width: 25px;
	height: 25px;
	margin: 0px !important;
	border: 2px solid #fff;
}

img {
	background-size: auto;
}

.author a {
	font-family:;
	font-size: 16px;
	color: #00C4CF;
}

.author p {
	font-family:;
	font-size: 16px;
	color: #8d8d8d;
}

.youngjune {
	
}

body {
	background:;
	color: #666;
	font: 14px/24px;
}

#container {
	width: 600px;
	margin: 0 auto;
	padding: 20px;
}

.btn {
	display: inline-block;
	padding: 10px;
	border-radius: 5px;
	color: #aaa;
	font-size: .875em;
}

.page {
	display: inline-block;
	padding: 7px 9px;
	margin-right: 4px;
	border-radius: 3px;
	border: solid 1px #c0c0c0;
	background: #e9e9e9;
	box-shadow: inset 0px 1px 0px rgba(255, 255, 255, .8), 0px 1px 3px
		rgba(0, 0, 0, .1);
	font-size: .875em;
	font-weight: bold;
	text-decoration: none;
	color: #717171;
	text-shadow: 0px 1px 0px rgba(255, 255, 255, 1);
}

.page:hover, .page.gradient:hover {
	background: #fefefe;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#FEFEFE),
		to(#f0f0f0));
	background: -moz-linear-gradient(0% 0% 270deg, #FEFEFE, #f0f0f0);
}

.page.active {
	border: none;
	background: #616161;
	box-shadow: inset 0px 0px 8px rgba(0, 0, 0, .5), 0px 1px 0px
		rgba(255, 255, 255, .8);
	color: #f0f0f0;
	text-shadow: 0px 0px 3px rgba(0, 0, 0, .5);
}

.page.gradient {
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#f8f8f8),
		to(#e9e9e9));
	background: -moz-linear-gradient(0% 0% 270deg, #f8f8f8, #e9e9e9);
}

.active-pink-2




input


.form-control




[
type
=
text
]


:focus


:not

 

(
[
readonly
]

 

){
border-bottom


:

 

1
px

 

solid

 

#f48fb1


;
box-shadow


:

 

01
px00

 

#f48fb1


;
}
.pagination {
	margin: auto;
	top: auto;
}

.selectbox {
	position: relative;
	width: 200px;
	height: 40px;
	line-height: 40px;
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
	border: 1px solid #999;
	z-index: 1;
}

.selectbox label {
	position: absolute;
	top: 0px;
	left: 5px;
	height: 40px;
	line-height: 40px;
	color: #999;
	z-index: -1;
}

.selectbox select {
	width: 100%;
	height: 40px;
	line-height: 40px;
	font-family: inherit;
	border: 0;
	opacity: 0;
	filter: alpha(opacity = 0);
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}





</style>
<head>
<title>중고거래 게시판</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>

<body class="is-preload">



	<!-- Header -->
	<header id="header">
		<div class="logo">
			<div>
				<p>중고 거래 게시판</p>
			</div>
		</div>
	</header>

	<!-- ########################Nav####################################-->
	<jsp:include page="../common/menuBar.jsp" />



	<!-- #################################Main##################################### -->

	<br>
	<br>
	<section class="page-section" id="team">
		<div class="text-center"
			style="width: 100%; font-family: 'Song Myung', serif;">
			<h1 class="section-heading text-uppercase">중고거래 게시판입니다.</h1>
			<h2 class="section-subheading text-muted">허가받지 않은 자의 거래가 금지되는
				주류, 담배, 헌혈증과 같은 제품은 금지합니다.</h2>
		</div>
		<br> <br> <br>


		<table border="1"
			style="font-family: 'Song Myung', serif; font-size: 25px">
			<tr align="center" height="20">
				<td colspan="6">
					<!-- [이전] --> <c:if test="${pi.currentPage <= 1 }">
               [이전] &nbsp;
               </c:if> <c:if test="${pi. currentPage > 1 }">
						<c:url var="before" value="ulist.do">
							<c:param name="page" value="${pi.currentPage - 1 }" />
						</c:url>
						<a href="${before }">[이전]</a> &nbsp;
               </c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
						end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<font color="red" size="4"><b>[${p }]</b></font>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="pagination" value="ulist.do">
								<c:param name="page" value="${p }" />
							</c:url>
							<a href="${pagination }">${p }</a> &nbsp;
                  </c:if>
					</c:forEach> <!-- [다음] --> <c:if test="${pi.currentPage >= pi.maxPage }">
               [다음] &nbsp;
                  </c:if> <c:if test="${pi. currentPage < pi.maxPage }">
						<c:url var="after" value="ulist.do">
							<c:param name="page" value="${pi.currentPage + 1 }" />
						</c:url>
						<a href="${after }">[다음]</a>
						<!-- <div class="img-5" style="transform: rotate(100deg)">
							<img src="https://assets.codepen.io/1462889/Ivy.png" alt="">
						</div> -->
                  </c:if>

				</td>
			</tr>
			</tbody>





			<!-- 게시물 검색하기 -->
			
			
			<form action="usearch.do" name="searchForm" method="get">
				<div id="searchArea" align="center"
					style="font-family: 'Song Myung'; font-size: 25px">
					
					<img src="https://assets.codepen.io/1462889/camp.png"  alt="" style="width:200px; height:auto;">
					<img src="https://assets.codepen.io/1462889/IvyRock.png" alt="" style="width:50px; height:auto;">
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="searchCondition" name="searchCondition"
						class="selectbox" style="font-size: 25px">
						<option value="all"
							<c:if test="${search.searchCondition == 'all' }">selected</c:if>>전
							체</option>
						<option value="writer"
							<c:if test="${search.searchCondition == 'writer' }">selected</c:if>>작성자</option>
						<option value="title"
							<c:if test="${search.searchCondition == 'title' }">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${search.searchCondition == 'content' }">selected</c:if>>내용</option>
							
					</select> <input type="search" name="searchValue"
						value="${search.searchValue }">
						
				
					<button class="btn btn-flat ">검 색</button>
					
					<%-- <c:if test="${empty search }">
					<p>해당 검색과 일치하는 게시글이 없습니다.</p>
					</c:if> --%>
				
					<br> <input type="checkbox" name="existFile"
						<c:if test="${!empty search.existFile }">checked</c:if>>
				</div>

			</form>



			<div class="container">
			
				<c:forEach var="vo" items="${uList}">
					<div class="col-lg-4" id="youngjune" style="font-size: 20px">

						<div class="cardbox bg-white" style="float: left;">
							<div class="cardbox-heading">
								<!-- START dropdown-->
								<div class="dropdown float-right">
								
								
								
			
			<a onclick="window.open('/createChatRoom.do?usedId=${vo.mId }&usedTitle=${vo.usedTitle }&usedNo=${vo.usedNo }&loginUser=${loginUser.mId }','채팅방','width=430,height=500,top=150,left=600,location=no,status=no,scrollbars=yes');">						
	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-dots" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
</svg></a>
									
		
		
									
								</div>

								<!--/ dropdown -->
								<div class="media m-0">
									<div class="d-flex mr-3">
										<div class="media-body"
											style="width:100%; font-family: 'Song Myung', serif;">
											<p class="m-0" style="font-size: 20px">${vo.usedTitle}</p>
											<small><span><i class="icon ion-md-pin"></i>작 성 자 : ${vo.usedWriter}</span></small><br>
											 <small><span><i class="icon ion-md-pin"></i>지 역 : ${vo.usedArea}</span></small><br>
											 <small><span><i class="icon ion-md-pin"></i>작 성 일 : ${vo.usedCreateDate}</span></small><br>

										</div>
									</div>
								</div>
								<!--/ media -->






							</div>
							<!--/ cardbox-heading -->

							<div class="cardbox-item">
								<a href="./udetail.do?usedNo=${vo.usedNo}"> <img
									class="img-fluid" 
									src="/resources/imgs/noticeimg/${vo.usedRenameFilename }"
									alt="Image" style="width: 462px; height: 340px; font-size: 28px; border-radius: 8px;">
								</a> <%-- <small><span><i class="icon ion-md-time"
										style="font-size: 28px"></i>${vo.usedCreateDate}</span></small> --%>
							</div>

							<!--/ cardbox-item -->
							<div class="cardbox-base">
								<ul>
									<li><a><i class='fas fa-eye'>&nbsp;${vo.usedCount}</i></a></li>

								</ul>
								&nbsp;&nbsp;&nbsp;

								<ul class="">

									<li><a><i class='fas fa-crow'>&nbsp; <c:choose>
										<c:when test="${vo.usedYn eq 'Y'}"> 판매완료
							    </c:when>
										<c:when test="${vo.usedYn eq 'N'}">판매중
							    </c:when>
												</c:choose></i> </a></li>
									<li><a><em class="mr-5"></em></a></li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</table>
	</section>
	<div class="" align="center"
		style="width: 100%; font-family: 'Song Myung', serif; ">
		
		
		<c:if test="${!empty loginUser}">
			<a href="uWrite.do">
			<i class='far fa-keyboard' style='font-size:48px; none;'></i>
			</a>


		</c:if>
				


	</div>

	<br>
	<br>



	<!-- ######################Footer###########################-->

<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

</html>