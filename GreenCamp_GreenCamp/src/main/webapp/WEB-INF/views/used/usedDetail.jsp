<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<head profile="http://www.w3.org/2005/10/profile">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- 현재 날짜가져오기 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="today" value="<%=new java.util.Date()%>"/>

<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy.MM.dd"/>
<!-- 날짜끝 -->
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 하나 세부</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../../resources/css/nav.css" />
<link rel="stylesheet"
	href="../../../resources/css/usedBoard/assets/css/main.css" />
<link rel="stylesheet" href="../../../resources/css/footer.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Song+Myung&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<!-- 스타일 -->
<style>
@import url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,700,900");
body {
  padding-top: 80px;
  padding-bottom: 0px;
  font-family: ;
  letter-spacing: 0.01rem;
  font-size: 1.1rem;
  line-height: 1.75em;
  text-rendering: geometricPrecision;
  margin: 0;
}



.nav-item::after {
  content: '';
  display: block;
  width: 0px;
  height: 4px;
  background: #ff0000;
  transition: 0.2s;
}

.nav-item:hover::after {
  width: 100%;
}

.navbar-nav .nav-link {
  color: #000;
  font-size: 18px;
}

.navbar-nav .active > .nav-link {
  width: 100%;
  height: 50px;
  border-bottom: 0.25rem solid;
  border-bottom-color: #ed4137;
}

.symbol {
  margin-right: 0.4em;
}

.symbol img {
  width: 1.4em;
  height: 1.4em;
}

span.notification-badge {
  position: relative;
  top: -10px;
  right: 10px;
  border: #fff 1px solid;
  margin-right: -18px;
}

.profile-header {
  background: #fff;
  border-bottom: 2px;
  border-bottom-color: #E8E8E8;
  padding-bottom: -1px;
}

.profile-picture {
  margin-right: 2em;
  margin-bottom: 1em;
}

.profile-stats li {
  display: inline-block;
  font-size: 1.1rem;
  line-height: 1.2em;
  cursor: pointer;
}

.profile-stats a {
  background: #f3f3f3;
  padding: 2px 10px 2px 10px;
  border-radius: 10px;
  display: inline-block;
  color: #585858;
  text-decoration: none;
}

.profile-stats a:hover {
  background: #f2849e;
  padding: 2px 10px 2px 10px;
  border-radius: 10px;
  display: inline-block;
  color: #fff;
  text-decoration: none;
}

.profile-stats .active {
  background: #f2849e;
  padding: 2px 10px 2px 10px;
  border-radius: 10px;
  display: inline-block;
  color: #fff;
  text-decoration: none;
}

.content {
  padding: 1em 0 1em 0;
  background: #f3f3f3;
}

a.linkit {
  color: #090a0b;
  text-decoration: none;
  text-decoration-color: #ed4137;
  border-bottom: dotted 0px rgba(88, 88, 88, 0.5);
  padding: 0 0px 9px 0;
}

a.linkit.active {
  color: #090a0b;
  border-bottom: solid 1px #ed4137;
}

a.linkit:hover {
  color: #ed4137;
  text-decoration: none;
  border-bottom: none;
}

.link {
  -moz-transition: border-bottom-color 0.2s ease, color 0.2s ease;
  -webkit-transition: border-bottom-color 0.2s ease, color 0.2s ease;
  -ms-transition: border-bottom-color 0.2s ease, color 0.2s ease;
  transition: border-bottom-color 0.2s ease, color 0.2s ease;
  text-decoration: none;
  color: #585858;
  border-bottom: dotted 1px rgba(88, 88, 88, 0.5);
}

.link:hover {
  -moz-transition: border-bottom-color 0.2s ease, color 0.2s ease;
  -webkit-transition: border-bottom-color 0.2s ease, color 0.2s ease;
  -ms-transition: border-bottom-color 0.2s ease, color 0.2s ease;
  transition: border-bottom-color 0.2s ease, color 0.2s ease;
  text-decoration: none;
  border-bottom: solid 1px;
  border-bottom-color: #f2849e;
  color: #f2849e !important;
}

.card_extra {
  box-shadow: 0 0 1rem -0.5rem #D3D3D3;
  transition: transform 0.1s ease-in-out, box-shadow 0.1s;
}

.card_extra:hover {
  transform: translateY(-0.5rem) scale(1.0125);
  box-shadow: 0 0.5em 2rem -1rem #D3D3D3;
}

.icon {
  font-size: 24px;
  color: #f3f3f3;
}

.icon {
  font-size: 24px;
  color: #666666;
}

.icon-margin-left {
  margin-left: 0.5rem;
}

a.icon.remove-icon:hover {
  color: #F05050;
}

a.icon.check-icon:hover {
  color: #4CAF50;
}

.footer {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1rem;
  background-color: ;
  text-align: center;
}

</style>


</head>
<body class="is-preload">

	<!-- Nav -->
	<!--  네비바들어가는 부분-->
	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	<!-- 네비 끝 -->


	<!-- Wrapper -->
	<div class="main_container" >
	<div class="col-md-6">

		<!-- <main role="main" class="content"> -->
		<div class="container">


			<div class="accordion mt-n4 mb-n2" id="TonieContent">
				<div class="card border-light border-0" >
					<div class="card-body" id="headingHeader">
					<br><br><br>
					
								<div class="img-wrap img-1" align="center">
							<img src="https://assets.codepen.io/1462889/kayak.png" alt="" style="width:300px; height:auto;">
						</div>
						
						 <h4>
						 
						 제    목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;${usedBoard.usedTitle}<br> 조 회 수 : &nbsp;${usedBoard.usedCount}<br> 아 이 디 :  &nbsp;${usedBoard.usedWriter}
						 
						 <a onclick="window.open('/createChatRoom.do?usedId=${vo.mId }&usedTitle=${vo.usedTitle }&usedNo=${vo.usedNo }&loginUser=${loginUser.mId }','채팅방','width=430,height=500,top=150,left=600,location=no,status=no,scrollbars=yes');">						
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-dots" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
				  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
				</svg></a>
 				</h4>
						<h4><b>작 성 일 : &nbsp;</b>${usedBoard.usedCreateDate}<br>
						
						<b>판 매 완 료  여 부 : &nbsp;</b>
						<c:choose> 
						    <c:when test="${usedBoard.usedYn eq 'Y'}">
						        판 매 완 료
						    </c:when>
						    <c:when test="${usedBoard.usedYn eq 'N'}">
						        판 매 중
						    </c:when>
						</c:choose>
						</h4>
						<hr>
						<br><br>
					</div>
				</div>
				</div>
				<div class="card mt-n4 border-light border-0">
					<div class="card-header bg-white" id="headingOne">
					</div>

					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#TonieContent">
						<div class="card-body">
							<p>
								${usedBoard.usedContent}<br>
							</p>
						</div>
					</div>
					
				</div>
				
				
                 
                 <%-- <div class="product-count" align="center">
                 <c:if test="${loginUser.mId eq usedBoard.mId}">
                     <button><a href="uModify.do" class="round-black-btn"> 수정하기 </a></button>
                     <button><a href="uDelete.do" class="round-black-btn"> 삭제하기 </a></button>
                     </c:if>
                     <button><a href="ulist.do" class="round-black-btn"> 목록으로 </a></button>
                 </div> --%>
				<hr>
				
				
				
				
			<div class="product-count" align="center">
			
			<c:if test="${loginUser.mId eq usedBoard.usedWriter}"> 		
			
			
			
			
            <c:url var="useNo" value="uModify.do">
        		<c:param name="usedNo" value="${usedBoard.usedNo}" />
        	</c:url>
        	<a href="${useNo}">
        	
        	<button style='font-size:24px'>수정하기 <i class='fas fa-hiking'></i></button>
        	
        	
        	<!-- <button type="submit" class="btn btn-info">수정하기</button> -->
				  </a>
            
            
            
            
            
            
            
            
        	<c:url var="useNo" value="udelete.do">
        		<c:param name="usedNo" value="${usedBoard.usedNo}" />
        	</c:url>
        	<a href="${useNo}">
        	<button style='font-size:24px'>삭제하기 <i class='fas fa-fire-alt'></i></button>
        	
        	<!-- <button type="button" class="btn btn-secondary">삭제하기</button> -->
        	</a>
			</c:if>
			
			
			
			
			
			
			
			
			<a href="ulist.do">
			<button style='font-size:24px'>목록으로 <i class='fas fa-tree'></i></button>
			
			<!-- <button type="button" class="btn btn-secondary">목록으로</button> -->
			
			</a>
			</div>	

				<div class="card mt-n4 border-bottom-1 border-0">
					<div class="card-header bg-white" id="headingTwo">
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
						data-parent="#TonieContent">
						<div class="card-body">
							<br>

							<h2>
							답글 달기</h2>
							<ul class="replyList">
							</ul>

							<input type="hidden" name="usedNo" value="${param.usedNo}" />
							<textarea name="usedRContent" cols="120" rows="5"></textarea>
							<input type="button" name="replyBtn" value="답글등록">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	

	<script>
		$(document)
				.ready(
						function() {
							var usedNo = $('[name="usedNo"]').val();

							function replyList() {
								$.ajax({
											url : "replyList.do",
											data : {
												
												'usedNo' : usedNo
											},
											success : function(response) {
												var str = '';
												
												
												$
														.each(
																response.list,
																function(idx,
																		vo) {
																	str += '<li style="line-height: 250%; font-size:24px "  commentNo='
																			+ vo.commentNo
																			+ '>'
																			+ vo.usedRId
																			+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
																			+vo.usedRContent 
																			/* + 'Date' + '${list.usedRCreateDate}'; */
																			+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${now}';
																			
																	str += '<span style="display:none; text-align:left;padding-left:50px;">';
																	str += '<button class="deleteReply" data-comment-no=' + vo.commentNo + '>'
																			
																			+'삭 제</button>';
																	str += '</span>';
																	str += '</li>';
																});
												$('.replyList').html(str);
											},
											error : function(response) {
											}
										});
							}

							replyList();

							$(document).on('mouseleave', '.replyList li',
									function() {
										$(this).find('span').css({
											'display' : 'inline-block'
										});
									})
							$(document).on('mouseenter', '.replyList li',
									function() {
										$(this).find('span').css({
											'display' : 'inline-block'
										});
									})

							//----------------------------------------------------------------------------
							// 댓글 삭제
							$(document).on(
									'click',
									'.deleteReply',
									function() {
										var commentNo = $(this).data(
												'commentNo');
										if (commentNo == '') {
											alert('댓글 번호가 없습니다');
											return;
										}
										var conf = confirm('댓글이삭제 됩니다');
										if (conf) {
											$.ajax({
												type : "post",
												url : "deleteUsedReply.do",
												data : {
													'usedNo' : $(
															'[name="usedNo"]')
															.val(),
													'commentNo' : commentNo
												},
												success : function(response) {
													alert(response.MESSAGE);
													replyList();

												},
												error : function(response) {
													alert('error');
												}
											});
											//  end ajax
										}
									})
							//-------------------------------------------------------------------------
							// 댓글 등록
							$('[name="replyBtn"]')
									.on(
											'click',
											function() {
												if ($('[name="usedRContent"]')
														.val() == '') {
													alert('댓글 내용이 없습니다');
													return;
												}
												if ($('[name="usedNo"]').val() == '') {
													alert('글 번호가 없습니다');
													return;
												}
												$.ajax({
															type : "post",
															url : "/insertUsedReply.do",
															data : {
																'usedNo' : $(
																		'[name="usedNo"]')
																		.val(),
																'usedRContent' : $(
																		'[name="usedRContent"]')
																		.val()
															},
															success : function(
																	response) {
																alert(response.MESSAGE);
																replyList();
															},
															error : function(
																	response) {
																alert('error');
															}
														});

												// 댓글 입력부분 초기화
												$('[name="usedRContent"]').val('');
							});
						});

	</script>
</body>