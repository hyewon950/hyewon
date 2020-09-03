<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 하나 세부</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../../resources/css/nav.css" />
<link rel="stylesheet"
	href="../../resources/css/myCampcss/assets/css/myCampDetail.css" />
<link rel="stylesheet" href="../../../resources/css/footer.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">

<!-- 별점 스타일 -->
   <style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    } 
</style>


</head>
<body class="single is-preload">

	<!-- Nav -->
	<!--  네비바들어가는 부분-->
	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	<!-- 네비 끝 -->


	<!-- Wrapper -->
	<div id="wrapper">

		<h1>나만의 캠핑장</h1>
		<!-- Main -->
		<div id="main">
<input type="hidden" value="${loginUser.mId }" id="getloginUserId">
			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">${myCamp.mycTitle }</a>
						</h2>
						<p style="font-size:1.2em;">${myCamp.mycTag }</p>
						<br>
						<p style="font-size:1.1em;">${myCamp.mycPlace }</p>
						<!-- 작성자와 일치할때 수정/삭제 가능 -->
						<c:if test="${loginUser.mId eq myCamp.mId }">
						<div class="updatedelete">
							<c:url var="updatemycboardView" value="updatemycboardView.do">
								<!-- 쿼리스트링: url다음에 ?로 보내는 데이터, 컨트롤러로보내는 파라미터 -->
								<c:param name="mycNo" value="${myCamp.mycNo }"></c:param>
							</c:url>
							<a href="${updatemycboardView }" style="text-decoration: none;">글 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<c:url var="deletemycboard" value="deletemycboard.do">
								<!-- 쿼리스트링: url다음에 ?로 보내는 데이터, 컨트롤러로보내는 파라미터 -->
								<c:param name="mycNo" value="${myCamp.mycNo }"></c:param>
							</c:url>
							<a href="${deletemycboard }" style="text-decoration: none;">글 삭제</a>
						</div>
						</c:if>
						
					</div>
					<div class="meta">
						<!-- <a href="#" class="author"> -->
						<!-- <span class="published" name="author">작성자: </span> -->
						<span class="published" name="mId" > 작성자: ${myCamp.mId }</span>
						<!-- <img
							src="../../resources/css/myCampcss/assets/css/images/avatar.jpg"
							alt="" /></a> -->
						<time class="published" name="mycWriteDate" datetime="${myCamp.mycWriteDate }" >등록일
							: ${myCamp.mycWriteDate }</time>
						<time class="published" name="mycModifyDate" datetime="${myCamp.mycModifyDate }" >최종
							수정일 : ${myCamp.mycModifyDate }</time>
						<p>
							<a href="#" class="icon solid fa-comment" name="mycViewCnt">${myCamp.mycViewCnt }</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="javascript:void(0);" id="heart" class="icon solid fa-heart likeclass" name="mycLikeCnt">${myCamp.mycLikeCnt }</a>
						</p>

					</div>
				</header>
				<!--메인사진 -->
				<!--<div class="image featured"><img src="images/pic01.jpg" alt="" width="100px"/></div>-->
				<div class="fileimg" id="fileimg"> 
				</div>
				
				<c:forEach var="mycf" items="${myCampFile}">
					<img src="../../resources/myCampFiles/${mycf.mycFileName}" alt="안나오넹" width="500px">
				</c:forEach>
				
				<p>${myCamp.mycDetail }</p>
				<!-- <div class="fileimg" style="text-align: center">
					<img
						src="../../resources/css/myCampcss/assets/css/images/pic01.jpg"
						width="500px;" height="300px">
				</div> -->
				<footer style="height: 50px;">
					<ul class="stats">
						<c:url var="myclist" value="myclist.do"></c:url>
						<li><a href="${myclist }" style="text-decoration: none;">목록으로</a></li>
						<%-- <li><a class="btn btn-outline-dark heart"><img id="heart" src="/resources/imgs/blackheart.png">${myCamp.mycLikeCnt }</a></li> --%>
						<li><a href="#" class="icon solid fa-comment">${myCamp.mycViewCnt }</a></li>
						<li><a href="javascript:void(0);"  onclick="like();" class="icon solid fa-heart" id="heart">${myCamp.mycLikeCnt }</a></li>
					</ul>
				</footer>
				<div class="mycampcomment" style="margin-top: -50px;">
					<br>

					<!-- 댓글테이블 -->
					<br> <br>

					<div class="container-card col-10" id="cardboarder">
						<span class="glyphicon glyphicon-user"> comment</span> <b
							id="mycCommentCount"></b><br>

						<div class="row">
							<div class="col-sm-12" id="lucky">

								
								<!-- 연습용입니드아 -->
								<!-- 	<div class="card">
									<div class="card-body" >
										<h5 class="card-title">
											<b>홍길동 </b> <span class="glyphicon glyphicon-time"> <a
												class="comdate">2010-08-08 </a></span> <a
												style="text-align: right; display: inline">수정/삭제</a>
										</h5>
									
										<p class="card-text"></p>
									
									</div>
								</div>
								
								
								
								  <div class="card">
									<div class="card-body">
										<h5 class="card-title">
											<b> user1 </b> <span class="glyphicon glyphicon-time"><a
												class="comdate"> 2020-07-22</a></span>
												<a style="text-align: right; display: inline">수정/삭제</a>
										</h5>
										<p class="card-text">너무 좋아요!!!또 가고싶어요@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</p>
									</div>
								</div> 
								 -->

							</div>
						</div>
						<!-- 댓글 목록 보기 끝 -->

						<hr>

						<!--댓글작성-->
						<div class="insertcomments">
							<div class="card-header">
								<li class="icon fa-comments">댓글작성</li>
							</div>
							<c:if test="${!empty loginUser }">
							<div class="card-body">
								<!-- <form action="insertComment"> -->
								<div class="col-12">
									<span id="star_grade" style="float:right;" name="mycCommentStar">
									<!-- <button id="one">★</button>
									<button id="two">★</button>
									<button id="three">★</button> -->
						        <a href="javascript:void(0);" onclick="star();" class="star" id="one">★</a>
						        <a href="javascript:void(0);" onclick="star();" class="star" id="two">★</a>
						        <a href="javascript:void(0);" onclick="star();" class="star" id="three">★</a>
						        <a href="javascript:void(0);" onclick="star();" class="star" id="four">★</a>
						        <a href="javascript:void(0);" onclick="star();" class="star" id="five">★</a>
						        </span>
									<textarea cols="6" rows="3" id="mycComment" name="mycComment"
										placeholder="댓글을 입력해주세요."></textarea>
								</div>
								<div class="col-12" style="float: right">
									<!-- <input type="submit" class="search-input" value="등록"
											style="text-size: 1px;"> -->
									<button id="mycCommentSubmit" style="height: 40px;">등록하기</button>
								</div>
								<!-- 	</form> -->

							</div>
							</c:if>
							<c:if test="${empty loginUser }">
								<p style="text-align:center;">※ 댓글작성은 로그인후 이용가능 합니다.</p>
							</c:if>
						</div>
						<!-- 댓글작성 여기까지 -->
						
					</div>
				</div>


			</article>

		</div>

		<!-- Footer -->
		<footer id="footer">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-12">

						<!-- About -->
						<section>
							<h2 class="major">
								<span style="background-color: #f2f5f3;">What's this
									about?</span>
							</h2>
							<p>
								This is <strong>TXT</strong>, yet another free responsive site
								template designed by <a href="http://twitter.com/ajlkn">AJ</a>
								for <a href="http://html5up.net">HTML5 UP</a>. It's released
								under the <a href="http://html5up.net/license/">Creative
									Commons Attribution</a> license so feel free to use it for whatever
								you're working on (personal or commercial), just be sure to give
								us credit for the design. That's basically it :)
							</p>
						</section>

					</div>
				</div>

				<!-- Copyright -->
				<div id="copyright">
					<ul class="menu">
						<li>&copy; Untitled. All rights reserved</li>
						<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>

			</div>
		</footer>

	</div>

	<!-- 댓글 스크립트 -->
	<script>
	var mycCommentStar1 = 0;
		$(function(){
			var mycCommentStar =0;
			// 초기 페이지 로딩 시 댓글 불러오기
			selectMyCampComment(); //이게 실행되면 밑에 댓글들 나옴 (ajax가 실행됨)
			
			/* selectMyCampFile();//파일들 불러오기  */
			
			// ajax polling
			//타회원이 댓글들을 작성했을 수 있으니 지속적으로 댓글 불러오기
			/* setInterval(function() {
				selectMyCampComment();
			},5000); //10초 마다 불러옴  */
			
			
			//파일 불러오기
		/*  	function selectMyCampFile(){
				var mycNo = ${myCamp.mycNo};
				$.ajax({
					url:"mycFileList.do",
					data:{mycNo:mycNo},
					dataType:"json", //응답이 오는 data는(밑에꺼) json형태 이다.
					success:function(data){ //controller에서 json으로 받아오는 코드 만들어줌
						$divimg = $("#fileimg");
						$divimg.html("");
						
						var $div;
						
						if( data.length > 0 ) {
							for ( var i in data ) {
								
								$div = $("<div>");
								
								$path = $("<img src='"+data[i].mycFilePath+"'>");
								//$pathc = $("<p"+data[i].mycFilePath+"'>");
								
								$div.append($path);
								$divimg.append($div); 
							}
						}

					}
				});
			}  
 */			
			
			// 댓글 등록 ajax
			 $("#mycCommentSubmit").on("click", function() {
				
				 $(".star").parent().children("a").removeClass("on");  
				 
				var mycComment = $("#mycComment").val(); // 댓글의 내용
				var mycNo = ${myCamp.mycNo }; // 어느 게시글의 댓글인지 알려줌
				console.log("댓글 등록의 스타 : "+ mycCommentStar);
				console.log("댓글 등록의 글내용 : "+ mycComment);
			
				
				if(mycCommentStar==0){
					alert("별점 선택을 안하셨으므로 별점 0점으로 적용됩니다.");
				}
				
				/* if(mycComment == null){
					//mycComment = ".";
					alert("댓글 내용을 입력해주세요.");
				}  */
				  
				
				$.ajax({
					url : "insertComment.do",
					data : {mycComment:mycComment, mycNo:mycNo, mycCommentStar:mycCommentStar},
					type : "post",
					success : function(data) { //data를 String으로 받아옴, 단순 결과값만 받아오는 거기때문에 String
						if(data == "success") { //결과값이 success이면
							mycCommentStar=0;
							selectMyCampComment(); //목록을 가져오도록
							$("#mycComment").val("");
							alert("댓글이 등록되었습니다.")
						}
					}
					
				});
			});
 		//댓글등록 여기까지
 		
 			//별점 등록
 		
			$(".star").on("click", function(){
            var starname=$(this).attr('id');
            //var mycCommentStar =0;
            if(starname=="one"){
            	mycCommentStar=1;
            }else if(starname=="two"){
            	mycCommentStar=2;
            }else if(starname=="three"){
            	mycCommentStar=3;
            }else if(starname=="four"){
            	mycCommentStar=4;
            }else if(starname=="five"){
            	mycCommentStar=5;
            }else{
            	mycCommentStar=0;
            }

            $(this).parent().children("a").removeClass("on");  
            /* 별점의 on 클래스 전부 제거 */
            
           	$(this).addClass("on").prevAll("a").addClass("on"); 
            /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */          
 
            //$(this).
            
          alert(mycCommentStar+" 점을 누르셨습니다.");
           //alert(starname);
            
           return mycCommentStar;
        });
 			
 			
 			
 			
		});//function닫음
		
		
		//댓글수정
		  //보였다 안보였다
		    function mycCommentUpdateShow(obj,mycCommentNo) {
		   	
			$(obj).hide();
			$(obj).next().show();
			$(obj).parent().siblings().eq(1).show();
			$(obj).parent().next().hide();
	
	
		}  //이거임 mycCommentUpdateShow닫는거
		
		//댓글 수정
		  function mycCommentUpdate(obj, mycCommentNo) {
	           
	         //  var mycComment = $(obj).parent().siblings().eq(1).val();
	          var mycComment = $(obj).prev().val();
	         // var mycCommentStar = $(obj).parent().siblings().children().eq(0).children().eq(2).val();
	          var mycCommentStar  = mycCommentStar1;
	         
	           console.log("obj"+ obj);
	           console.log("mycComment "+mycComment);
				console.log("mycCommentNo "+mycCommentNo);
				console.log("mycCommentStar "+mycCommentStar);
				console.log("mycCommentStar1 "+mycCommentStar1);
				//console.log("이게뭘까요요ㅛ요 "+mycC);
				
				if(mycCommentStar==0){
					alert("별점 선택을 안하셨으므로 별점 0점으로 적용됩니다.");
				}
	           
	           $.ajax({
	              url : "updateComment.do",
	              data : {mycComment:mycComment,mycCommentNo:mycCommentNo, mycCommentStar:mycCommentStar1},
	              type : "post",
	              success : function (data) {
	            	  selectMyCampComment();
	                 alert("수정이 완료되었습니다.")
	              }
	           
	           });
	        }
		
		//댓글 수정취소
		function mycCommentUpdateCancel(obj,mycCommentNo){
			selectMyCampComment();
		}
		

		//댓글삭제
		   function mycCommentDelete(obj,mycCommentNo){
			//var mycComment = $("#mycComment").val(); // 댓글의 내용
			//var mycCommentNo = ${myCampComment.mycCommentNo }; // 어느 게시글의 댓글인지 알려줌
			$.ajax({
				url : "deleteComment.do",
				data : {mycCommentNo:mycCommentNo},
				type : "post",
				success : function(data) { //data를 String으로 받아옴, 단순 결과값만 받아오는 거기때문에 String
					if(data == "success") { //결과값이 success이면
						selectMyCampComment(); //목록을 가져오도록
						alert("댓글이 삭제되었습니다.")
					}
				}
			});
		}     

		
		// 댓글 리스트 불러오는 ajax 함수
		      function selectMyCampComment(){
		         var mycNo = ${myCamp.mycNo};
		         var hi = mycCommentStar1;
		         console.log("hi : "+hi);
		         $.ajax({
		            url:"mycCommentList.do",
		            data:{mycNo:mycNo},
		            dataType:"json", //응답이 오는 data는(밑에꺼) json형태 이다.
		            success:function(data){ //controller에서 json으로 받아오는 코드 만들어줌
		               $divborder = $("#lucky");
		               $divborder.html("");
		               console.log("hi : "+hi);
		               
		               
		               var mId=$("#getloginUserId").val();
		               var $div;
		               var $h5;
		               var $mId;
		               var $mycComment;
		               var $mycCommentDate;
		               var $mycCommentStar;
		               var $commentWrite;
		               var $UpdateStar;
		               
		               
		               $("#mycCommentCount").text("(" + data.length+")"); //리스트의 길이를 댓글의 갯수로 확인할 수있다.
		               if( data.length > 0 ) {
		                  for ( var i in data ) {
		                     
		                     
		                     $div = $("<div>");
		                     $div1 = $("<div class='card'>");
		                     $div2 = $("<div class='card-body'>");
		                     $h5 = $("<h5 class='card-title'>");
		                     $span = $("<span class='glyphicon glyphicon-time'>");
		                     //$br=$("<br>")
		                     $span2=$("<span class='text' style='display: none;''>")
		                     
		                     
		                     $mId = $("<b name='mId'>").text(data[i].mId);
		                     $mycComment = $("<p class='card-text' name='mycComment' id='comment'>").text(decodeURIComponent(data[i].mycComment.replace(/\+/g, " ")));
		                     $mycCommentDate = $("<a class='comdate' name='mycCommentDate'>").text(data[i].mycCommentDate);
		                     
		                     $upbtn=$("<button class='button' id='showupbtn' onclick='mycCommentUpdateShow(this,"+data[i].mycCommentNo+");' style='text-align:center; display:inline; float-right;'>").text("수정");
		                     $canbtn=$("<button class='button' id='canbtn' onclick='mycCommentUpdateCancel(this,"+data[i].mycCommentNo+");' style='text-align:center; display:inline; float-right; display:none;'>").text("취소");
		                     $delbtn=$("<button class='button' id='delbtn' onclick='mycCommentDelete(this,"+data[i].mycCommentNo+");' style='text-align:center; display:inline; float-right;'>").text("삭제");
		                     
		                     //수정 별점 넣기
		                     $UpdateStarspan =$("<span id='star_grade' style='float:right;margin-right:15px;' name='mycCommentStar'>");
		                     $UpdateStar1 =$(" <a href='javascript:void(0);' onclick='star(this,"+data[i].mycCommentStar+");' class='star' id='one'>").text('★');
		                     $UpdateStar2 =$(" <a href='javascript:void(0);' onclick='star(this,"+data[i].mycCommentStar+");' class='star' id='two'>").text('★');
		                     $UpdateStar3 =$(" <a href='javascript:void(0);' onclick='star(this,"+data[i].mycCommentStar+");' class='star' id='three'>").text('★');
		                     $UpdateStar4 =$(" <a href='javascript:void(0);' onclick='star(this,"+data[i].mycCommentStar+");' class='star' id='four'>").text('★');
		                     $UpdateStar5 =$(" <a href='javascript:void(0);' onclick='star(this,"+data[i].mycCommentStar+");' class='star' id='five'>").text('★');
		                     
		                     $commentWrite = $("<textarea rows='3' style='float:left; width:80%; height:100px;margin-left: 80px;background-color:transparent;margin-left:-20px;border:none;' class='hid' name='mycComment'>").text(decodeURIComponent(data[i].mycComment.replace(/\+/g, " ")));
		                     //display: none; 
		                     $writeupbtn = $("<button class='button hid' id='updatebtn' onclick='mycCommentUpdate(this,"+data[i].mycCommentNo+");' style='text-align:center; display:inline; float-right;margin-top:20px;margin-left:5px;'>").text("수정완료");
		                     
		                     console.log("수정완료1 : "+mycCommentStar1);
		                     console.log("수정완료2 : "+data[i].mycCommentStar);
		                     
		                     //그냥 별점 보이게
		                     $b=$("<b name='mycCommentStar'>").text( data[i].mycCommentStar);
		                     //수정 시 별점
		                     //$bafter=$("<b style='display:none' name='mycCommentStar'>").text( mycCommentStar1);
		                     
		                     $div.append($div1);
		                     $div1.append($div2);
		                     $div2.append($h5);
		                     $h5.append($mId);
		                     $h5.append($span);
		                     $span.append($mycCommentDate);
		                     
		                     //$h5.append($b);
		                     
		                      if(data[i].mycCommentStar >= 5){
		                           $h5.append(" ★★★★★ (완젼 적극 추천!!!)");
		                        }else if(data[i].mycCommentStar == 4){
		                           $h5.append(" ★★★★☆ (재밌었어요!)");
		                        }else if(data[i].mycCommentStar == 3){
		                           $h5.append(" ★★★☆☆ (추천합니다~)");
		                        }else if(data[i].mycCommentStar == 2){
		                           $h5.append(" ★★☆☆☆ (한번쯤은 갔다오길 추천b)");
		                        }else if(data[i].mycCommentStar == 1){
		                           $h5.append(" ★☆☆☆☆ (별로였어요.)");
		                        }else{
		                        	$h5.append(" ☆☆☆☆☆ (아닌 것 같아요...)");
		                        }
		                      
		                      console.log(data[i].mId );
		                      
		                     // 만약 아이디가 일치한다면 수정,삭제 보이게하기
		                     if(mId == data[i].mId){
		                    	 $h5.append($upbtn); 
		                    	 $h5.append($canbtn); 
			                     $h5.append($delbtn);
		                     }
		                    // $h5.append($upbtn); 
		                   //  $h5.append($delbtn);
		                     
		                     //$tr.append($mycCommentWriter);
		                     $div2.append($mycComment);
		                     //$div2.append($br);
		                     $div2.append($span2);
		                     $span2.append($UpdateStarspan);//별점 수정
		                     $UpdateStarspan.append($UpdateStar1);
		                     $UpdateStarspan.append($UpdateStar2);
		                     $UpdateStarspan.append($UpdateStar3);
		                     $UpdateStarspan.append($UpdateStar4);
		                     $UpdateStarspan.append($UpdateStar5);//별점 수정끝
		                     $span2.append($commentWrite);
		                     $span2.append($writeupbtn);
		                     //$p.append($mycCommentDate);
		                     $divborder.append($div); //(위에 코드 써있는) 파란색 댓글목록의 tablebody부분에 넣어줌
		                     
		                     
		                  }
		               }else{ //데이터가 없을때
		                  $div = $("<div>");
		                  $mycComment = $("<p>").text("등록된 댓글이 없습니다.");
		                  $div.append($mycComment);
		                  $divborder.append($div);
		               }

		            }
		         });
		      }
	
		//별점 
		 function star(obj, mycCommentStar) {
	        
				console.log(mycCommentStar);
				console.log(obj);
			
			  var starname=$(obj).attr('id');
	            //var mycCommentStar =0;
	            if(starname=="one"){
	            	mycCommentStar=1;
	            }else if(starname=="two"){
	            	mycCommentStar=2;
	            }else if(starname=="three"){
	            	mycCommentStar=3;
	            }else if(starname=="four"){
	            	mycCommentStar=4;
	            }else if(starname=="five"){
	            	mycCommentStar=5;
	            }else{
	            	mycCommentStar=0;
	            }

	            $(obj).parent().children("a").removeClass("on");  
	            /* 별점의 on 클래스 전부 제거 */
	            
	           	$(obj).addClass("on").prevAll("a").addClass("on"); 
	            /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */          
	 
	            
	           //alert(mycCommentStar);
	           //alert(starname);
	            
	           mycCommentStar1 = mycCommentStar;
	          // console.log("현진바보 : "+mycCommentStar1);
	          // console.log("그냥 : "+mycCommentStar);
	            //return mycCommentStar;
	        }
		
	//좋아요 스크립트
	/*  function likecnt(obj){
		 $.ajax({
			url: "/expro/RecUpdate.do",
             type: "POST",
             data: {
                 no: ${myCamp.mycNo},
                 id: '${mId}'
             },
             success: function () {
			        recCount();
             },
		};     
	
		
		// 게시글 추천수
	    function recCount() {
			$.ajax({
				url: "/expro/RecCount.do",
                type: "POST",
                data: {
                    no: ${myCamp.mycNo}
                },
                success: function (count) {
                	$(".rec_count").html(count);
                },
			})
	    };
	    recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출 */
	    
	    
	   /*  $(document).ready(function () {

	        var heartval = ${heart};

	        if(heartval>0) {
	            console.log(heartval);
	            $("#heart").prop("src", "/resources/imgs/greenheart.png");
	            $(".heart").prop('name',heartval)
	        }
	        else {
	            console.log(heartval);
	            $("#heart").prop("src", "/resources/imgs/blackheart.png");
	            $(".heart").prop('name',heartval)
	        }

	        $(".heart").on("click", function () {

	            var that = $(".heart");

	            var sendData = {'mycNo' : '${myCamp.mycNo}','heart' : that.prop('name')};
	            $.ajax({
	                url :'/board/heart',
	                type :'POST',
	                data : sendData,
	                success : function(data){
	                    that.prop('name',data);
	                    if(data==1) {
	                        $('#heart').prop("src", "/resources/imgs/greenheart.png");
	                    }
	                    else{
	                        $('#heart').prop("src", "/resources/imgs/blackheart.png");
	                    }


	                }
	            });
	        });
	    });
	     */
	    
		/* $(document).ready(function() {
			 var heartval = ${heart};

		        if(heartval>0) {
		            console.log(heartval);
		            $("#heart").css('color','red');
		            $("#heart").prop('name',heartval);
		        }
		        else {
		            console.log(heartval);
		            $("#heart").css('color','black');
		            $("#heart").prop('name',heartval);
		        }
		        
		        $("#heart").on("click", function() {
					
		        	var that = $("#heart");
		        	var mycNo = ${myCamp.mycNo};
		        	
		        	$.ajax({
		                url :'clicklike.do',
		                type :'POST',
		                data : {mycNo:mycNo, 'heart' : that.prop('name')},
		                success : function(data){
		                    that.prop('name',data);
		                    if(data==1) {
		                    	$("#heart").css('color','red');
		                    }
		                    else{
		                        $('#heart').css('color','black');
		                    }
		                }
		            });		
				});
		});
			 */
	    
			  //좋아요 하는중...
			 	$(document).ready(function() {
				        
				        var heartval = ${heart};
			 			//var heartval = 0;
			 			console.log("heartval : "+heartval);
			 		          if(heartval>0) {
			 		            console.log(heartval);
			 		            $("#heart").css('color','red');
			 		            $("#heart").prop('name',heartval);
			 		        }
			 		        else {
			 		            console.log(heartval);
			 		            $("#heart").css('color','black');
			 		            $("#heart").prop('name',heartval);
			 		        }   
				        
				        $("#heart").on("click", function() {
							
				        	
				        	var that = $("#heart");
				        	var mycNo = ${myCamp.mycNo};
							var u = ${myCamp.mycLikeCnt };
							console.log(u);
				        	$.ajax({
				                url :'clicklike.do',
				                type :'POST',
				                data : {mycNo:mycNo, 'heart' : that.prop('name')},
				                success : function(data){
				                    that.prop('name',data);
				                    if(data==1) {
				                    	$("#heart").css('color','red');
				                    	var cnt = u+1;
				                    	console.log(u);
				                    	console.log(cnt);
				                    	$(".likeclass").html(cnt);
				                    }
				                    else{
				                        $('#heart').css('color','black');
				                    	console.log(u);
				                        $(".likeclass").html(u);
				                    }
				                },
				                error : function(data){
				                	console.log("실ㄹ패");
				                }
				            });		
						});
			 	}); 

		 
	</script>


	<!-- Scripts -->
	<!-- <script src="resources/css/myCampcss/assets/js/browser.min.js"></script>
	<script src="resources/css/myCampcss/assets/js/breakpoints.min.js"></script>
	<script src="resources/css/myCampcss/assets/js/jquery.min.js"></script>
	<script src="resources/css/myCampcss/assets/js/util.js"></script>
	<script src="resources/css/myCampcss/assets/js/main.js"></script> -->
</body>
</html>