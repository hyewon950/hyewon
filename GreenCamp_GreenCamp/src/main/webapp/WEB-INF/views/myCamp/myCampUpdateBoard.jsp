<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나만의 캠핑장 게시글 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" href="../../resources/css/myCampcss/assets/css/myCampDetail.css" />
</head>
<body class="single is-preload">

		<!-- Nav -->
	<!--  네비바들어가는 부분-->
	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	<!-- 네비 끝 -->

		<!-- Wrapper -->
			<div id="wrapper">
                <h1>나만의 캠핑장_게시글 수정</h1>
				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<article class="post">
								<!--<header>
									<div class="title">
										<h2><a href="#">차박할만한곳 추천합니드아</a></h2>
										<p>태그는 뭐시꺵이 #분위기좋은 #공기좋은</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2015-11-01">November 1, 2015</time>
										<a href="#" class="author"><span class="name">Jane Doe</span><img src="images/avatar.jpg" alt="" /></a>
									</div>
								</header>-->
                                <!--메인사진 -->
                            
                                <span class="mycampmainimg">
                                   <!--  <img src="../../resources/css/myCampcss/assets/css/images/pic01.jpg" width="400px;" height="300px"> -->
                                </span>
                                
                                <form enctype="multipart/form-data" action="updatemycboard.do" method="post" >  
        <div class="row"> 
            <div class="col-md-6"> 
            <div class="form-group"> 
            <label for="writer">작성자</label> 
            <%-- <input type="text" class="form-control" name="writer" id="writer" value="${sessionScope.memberVO.memberName }" readonly>  --%>
            <input type="text" class="form-control" name="writer" id="writer" value="${myCamp.mId}" readonly> 
            </div> 
            </div>
           <%--  <input type="hidden" id="id" name="id" value="${sessionScope.memberVO.id }"> --%>
            <input type="hidden" name="mycNo" value="${myCamp.mycNo }">
			<input type="hidden" name="mycWriteDate" value="${myCamp.mycWriteDate }">
			<input type="hidden" name="mycModifyDate" value="${myCamp.mycModifyDate }">
			<input type="hidden" name="mycViewCnt" value="${myCamp.mycViewCnt }">
			<input type="hidden" name="mycLikeCnt" value="${myCamp.mycLikeCnt }">
			<input type="hidden" name="mycStatusYN" value="${myCamp.mycStatusYN }">
			<input type="hidden" name="mycNo" value="${mycf.mycNo }">
			<%-- <input type="text" class="form-control" name="writer" id="writer" value="${mycf.mycNo}" readonly>  --%>
		
			<%-- <input type="hidden" name="fileName" value="${file.mycStatusYN }"> --%>
        </div>
		<br>
        <div class="form-group" style="margin-right: 70px"> 
        <label for="mycTitle">글제목</label> 
        <input type="text" class="form-control" name ="mycTitle" id="mycTitle" value="${myCamp.mycTitle}" required="required"> 
        </div> 
        <br>
        
        <div class="form-group" style="margin-right: 70px">
						<label for="mycPlace">위치</label>
						<span>수정 전</span>
						<input type="text" class="form-control" name ="mycPlace" id="mycPlace" value="${myCamp.mycPlace}" required="required"> 
						<br>
						<span>수정 후</span>
						 <select class="select">
							<option value="서울특별시" selected="selected">서울특별시</option>
							<option value="인천광역시">인천광역시</option>
							<option value="경기도">경기도</option>
							<option value="강원도">강원도</option>
							<option value="충청북도">충청북도</option>
							<option value="충청남도">충청남도</option>
							<option value="경상북도">경상북도</option>
							<option value="경상남도">경상남도</option>
							<option value="전라북도">전라북도</option>
							<option value="전라남도">전라남도</option>
							<option value="제주도">제주도</option>
							<option value="대구광역시">대구광역시</option>
							<option value="부산광역시">부산광역시</option>
							<option value="울산광역시">울산광역시</option>
							<option value="대전광역시">대전광역시</option>
							<option value="광주광역시">광주광역시</option>
						</select> 
						<input type="text hidden" class="form-control" name="addr1" id="oneaddr"
							class="select" required="required" style="border:none;visibility:hidden;" readonly >
						<script>
					        $(document).ready(function() {
					            var $sel = $(".select");

        					    $sel.change(function() {
             					   var select = $("option").filter("option:selected");
               						 var pname= select.text();
               						 console.log(select.text());
               							 console.log(pname);
              	  
               					 $("#oneaddr").val(pname);
                
            					});

        					});
   						 </script>

						<input type="text" class="form-control" name="addr2"  placeholder="상세 위치를 적어주세요." 
							class="select" required="required">
					</div>
        
        
        <br>
        <div class="form-group" style="margin-right: 70px"> 
        <label for="mycDetail">글내용</label> 
        <!-- 다시 br을 공백으로 바꿔서 나오게함 -->
		<c:set var="mycDetail" value="${fn:replace(myCamp.mycDetail,'<br>','') }"/>
        <textarea class="form-control" rows="10" name="mycDetail" id="mycDetail" required="required">${myCamp.mycDetail }</textarea> 
        </div>
        <br>
        <div class="form-group" style="margin-right: 70px"> 
        <label for="mycTag">태그 (임시)</label> 
        
        <!--태그-->
        <div class="myCampTag">
            <fieldset> 
                <legend>태그 선택</legend>
                <button type="button" value="#봄" id="inputs" class="inputs">봄</button>
                <button type="button" value="#여름" id="inputs1" class="inputs">여름</button>
                <button type="button" value="#가을" id="inputs2" class="inputs">가을</button>
                <button type="button" value="#겨울" id="inputs3" class="inputs">겨울</button>
                <button type="button" value="#물맑은" id="inputs4" class="inputs">물맑은</button>
                <button type="button" value="#공기좋은" id="inputs5" class="inputs">공기좋은</button>
                <button type="button" value="#힐링" id="inputs6" class="inputs">힐링</button>
                <button type="button" value="#도심" id="inputs7" class="inputs">도심</button>
                <button type="button" value="#산" id="inputs8" class="inputs">산</button>
                <button type="button" value="#바다" id="inputs9" class="inputs">바다</button>
                <button type="button" value="#깨끗한" id="inputs10" class="inputs">깨끗한</button>
                <button type="button" value="#그늘많은" id="inputs11" class="inputs">그늘많은</button>
                <button type="button" value="#익스트림" id="inputs12" class="inputs">익스트림</button>
                <button type="button" value="#따뜻한" id="inputs13" class="inputs">따뜻한</button>
                <button type="button" value="#차대기편한" id="inputs14" class="inputs">차대기편한</button>
                <button type="button" value="#물놀이" id="inputs15" class="inputs">물놀이</button>
                <button type="button" value="#온수" id="inputs16" class="inputs">온수</button>
                <button type="button" value="#조용한" id="inputs17" class="inputs">조용한</button>
                <button type="button" value="#분위기있는" id="inputs18" class="inputs">분위기있는</button>
                <button type="button" value="#가족" id="inputs19" class="inputs">가족</button>
                <button type="button" value="#연인" id="inputs20" class="inputs">연인</button>
            </fieldset>
            <br>
          <!--  <input type="text" class="form-control" name ="mycTag" id="mycTag" required="required"> -->
            <p  style="display:hidden" id="mycTag1">태그나와요요요</p>
          <!--   <input type="text" class="form-control"  id="print4" > -->
            <input type="text" class="form-control" name ="mycTag" id="mycTag"  value="${myCamp.mycTag }" required="required" > 
           <!--  <div id="result1"> </div> -->
            <!-- <button type="button" onclick="printTest();">태그 저장 </button> -->
            <script>
                var data = new Array();
                var hi = null;
                
                 $(document).ready(function() { 

                    $(".inputs").click(function() {
						
                        //var print2 = document.getElementById("mycTag1");
						
                        hi = $(this).attr('value');
                        if ($.inArray(hi, data) > -1) {
                            console.log("있다네");

                            var search = data.indexOf(hi);
                            if (search != -1) {
                                data.splice(search, 1); // "A"를 찾아서 삭제한다.
                            }
                            var str = data.join(" ");
                            mycTag1.innerHTML = str;
                            
                            if(str.length > 30) {
                                alert("태그를 너무 많이 적용하셨습니다.");
                            }else{
                            	 $('#mycTag').val(str);
                            }
                           
                           
                        } else {
                            data.push($(this).attr('value'));
                            var str = data.join(" ");
                            mycTag1.innerHTML = str;
                            $('#mycTag').val(str);
                            if(str.length > 30) {
                                alert("태그를 너무 많이 적용하셨습니다.");
                            }else{
                            	 $('#mycTag').val(str);
                            }
                        }
						
                    });

                 }); 

                /*한번에 출력되는지 보는거*/
               /*   function printTest() {
                    //var print2 = document.getElementById("print4");
                    var str = data.join(" ");
                    print4.innerHTML = str;
                    $('#mycTag').val(str);
                    
                    
                }*/
            </script>
        </div>
		<!-- 태그여기까지 -->
        </div> 
        <br>
       <!-- //내 첨부 파일 -->
					<div class="form-group"  required="required">
						
					<label for="File">첨부파일</label>
					 <a href="javascript:void(0);" onclick="addImage();">
					 <i class="far fa-images"></i> 이미지 추가하기 (이미지를 더추가하시려면 눌러주세요)</a>
					</div>

					<div class="card shadow mb-4">
						<div class="card-header">
							<div id="filebox1" class="filebox" >
								<!--  <input id="upload-name1" class="upload-name" value="파일선택"
									disabled="disabled " required="required"> -->  <label for="image1"
									class="image-label">첫번째 사진 (메인사진 필수 등록)</label> 
									<input type="file" id="image1"
									name="fileImage"   required="required">
								<!-- <button class="btn btn-success" id="remove1">취소</button> -->
								&nbsp;&nbsp;<a id="close_link" href="javascript:void(0);"
									onclick="removeImage1();"><!-- <i
									class="far fa-2x fa-times-circle"></i> -->
									</a>

							</div>
							<br>
							<div id="filebox2" class="filebox" style="display: none">
								<!-- <input id="upload-name2" class="upload-name" value="파일선택"
									disabled="disabled"> --> <label for="image2"
									class="image-label">두번째 사진</label> <input type="file" id="image2"
									name="fileImage" class="upload-hidden" disabled="disabled" required="required">
								<!-- <button class="btn btn-success" id="remove2">취소</button>  -->
								&nbsp;&nbsp;<a id="close_link" href="javascript:void(0);"
									onclick="removeImage2();"><i
									class="far fa-2x fa-times-circle"></i></a>
							</div>
							<br>
							<div id="filebox3" class="filebox" style="display: none">
								<!-- <input id="upload-name3" class="upload-name" value="파일선택"
									disabled="disabled"> --> <label for="image3"
									class="image-label">세번째 사진</label> <input type="file" id="image3"
									name="fileImage" class="upload-hidden" disabled="disabled" required="required">
								<!-- <button class="btn btn-success" id="remove3">취소</button> -->
								&nbsp;&nbsp;<a id="close_link" href="javascript:void(0);"
									onclick="removeImage3();"><i
									class="far fa-2x fa-times-circle"></i></a>
							</div>
						</div>
						<div class="card-body row">
								<!-- <img src="../../resources/imgs/noimage.jpg" style="width:250px;" id="input-img" /> -->
								
								
								<div id="img-box1" class="img-box"
								style="height: 70%; margin: 30px auto; visibility:visible">
								<p>첫번째 사진 (메인 사진 등록)</p>
								<img src="../../resources/imgs/noimage.jpg" style="width:250px;" id="input-img" />
							</div>
							<div id="img-box2" class="img-box"
								style="height: 70%; margin: 30px auto; visibility: hidden">
								<p>두번째 사진</p>
								<img src="../../resources/imgs/noimage.jpg" style="width:250px;" id="input-img" />
							</div>
							<div id="img-box3" class="img-box"
								style="height: 70%; margin: 30px auto; visibility: hidden">
								<p>세번째 사진</p>
								<img src="../../resources/imgs/noimage.jpg" style="width:250px;" id="input-img" />
							</div>
								
								
								<p>전에 등록했던 사진>></p>
								<c:forEach var="mycf" items="${myCampFile}">
									<img src="../../resources/myCampFiles/${mycf.mycFileName}" alt="안나오넹" width="250px">
								</c:forEach>
								
								<!-- 몰라나듀 이게 쪼개져서 봤던거 -->
								 <%-- <c:forEach var="mycf" items="${myCampFile}" varStatus="i">
								 	<c:if test="${i.index eq 0 }">
										<div id="img-box1" class="img-box"
											style="height: 70%; margin: 30px auto;">
											<p>첫번째 사진 (메인 사진 등록)</p>
											<img src="../../resources/myCampFiles/${mycf.mycFileName}" alt="안나오넹" width="250px" id="input-img">
										</div>
								 	</c:if>
								 	
								 	<c:if test="${i.index eq 1 }">
										<div id="img-box2" class="img-box"
											style="height: 70%; margin: 30px auto;">
											<p>두번째 사진</p>
											<img src="../../resources/myCampFiles/${mycf.mycFileName}" alt="안나오넹" width="250px" id="input-img">
										</div>
								 	</c:if>
								 	
								 	<c:if test="${i.index eq 2 }">
										<div id="img-box3" class="img-box"
											style="height: 70%; margin: 30px auto;">
											<p>세번째 사진</p>
											<img src="../../resources/myCampFiles/${mycf.mycFileName}" alt="안나오넹" width="250px" id="input-img">
										</div>
								 	</c:if>
								 	
								</c:forEach>  --%>
						</div>
					</div> 
				
					<!-- 첨부파일 여기까지 -->
 				
        <!-- <div class="form-group"> 
        <label for="File">첨부파일 1</label> 
        <input type="file" name="file[0]"> 
        </div> 
        <div class="form-group"> 
        <label for="File">첨부파일 2</label> 
        <input type="file" name="file[1]"> 
        </div> 
        <div class="form-group"> 
        <label for="File">첨부파일 3</label> 
        <input type="file" name="file[2]"> 
        </div>  -->
        <br><br>
        <div class="center-block" style='width:400px' align="center"> 
        <input type="submit" class="btn btn-info" value="등록하기" style="background-color: #2dcb73">&nbsp;&nbsp;
      <!--   <input type="reset" class="btn btn-info"  value="다시쓰기" style="background-color: #2dcb73">&nbsp;&nbsp; -->
        <input type="button" class="btn btn-info"  value="취소" id="cancelBtn" style="background-color: #2dcb73">
        </div>
</form> 
                    
                        
                        </article>
                        
                        
                </div>
				<!-- Footer -->
					<section id="footer">
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon solid fa-rss"><span class="label">RSS</span></a></li>
							<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
					</section>

			</div>

<script>
		var count = 0;
		var image = 0;
/* 		$(document).ready(function() {

		});
	 */
		function addImage() {
			if (count < 3 && image == 0) {
				$("#filebox1").css("display","block");
				$("#img-box1").css("visibility","visible");
				//$("#image1").removeAttr("disabled");
				count++;
				image = 1;
				var status1 = $("#image2").attr("disabled");
				if (!status1) {
					image = 2;

				}
				console.log(image);
			} else if (count < 3 && image == 1) {
				$("#filebox2").css("display","block");
				$("#img-box2").css("visibility","visible");
				$("#image2").removeAttr("disabled");
				count++;
				image = 2;
				var status = $("#image1").attr("disabled");
				if (status) {
					image = 0;
				}
			} else if (count < 3 && image == 2) {
				var status = $("#image2").attr("disabled");
				if (status) {
					image = 1;
				}
				$("#filebox3").css("display","block");
				$("#img-box3").css("visibility","visible");
				$("#image3").removeAttr("disabled");
				count++;
				image = 0;
				var status = $("#image2").attr("disabled");
				if (status) {
					image = 1;
				}
			} else {
				alert("이미지는 3개까지 추가할 수 있습니다.");
			}
		}

		function removeImage1() {

			$("#filebox1").css("display","none");
			$("#img-box1").css("visibility","hidden");
			$("#image1").attr("disabled", true);
			$("#image1").val("");
			$('#upload-name1').val("파일선택");
			$('#img-box1 img').attr("src", '/resources//imgs/noimage.jpg');
			count--;
			image = 0;
		}

		function removeImage2() {

			$("#filebox2").css("display","none");
			$("#img-box2").css("visibility","hidden");
			$("#image2").attr("disabled", true);
			$("#image2").val("");
			$('#upload-name2').val("파일선택");
			$('#img-box2 img').attr("src", '/resources//imgs/noimage.jpg');
			count--;
			image = 1;
		}

		function removeImage3() {

			$("#filebox3").css("display","none");
			$("#img-box3").css("visibility","hidden");
			$("#image3").attr("disabled", true);
			$("#image3").val("");
			$('#upload-name3').val("파일선택");
			$('#img-box3 img').attr("src", '/resources//imgs/noimage.jpg');
			count--;
			image = 2;
			var status = $("#image2").attr("disabled");
			if (status) {
				image = 1;
			}
			var status = $("#image1").attr("disabled");
			if (status) {
				image = 0;
			}
		}

		$('#image1').on('change', function() {
			var name = $(this).val().split('/').pop().split('\\').pop();
			ext = $(this).val().split('.').pop().toLowerCase(); //확장자
			//배열에 추출한 확장자가 존재하는지 체크
			if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				$("#image1").val("");
				window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
			} else {
				file = $('#image1').prop("files")[0];
				blobURL = window.URL.createObjectURL(file);
				$('#img-box1 img').attr('src', blobURL);
				$('#img-box1').slideDown(); //업로드한 이미지 미리보기 
				$('#upload-name1').val(name);
			}
		});
		$('#remove1').click(function(e) {
			e.preventDefault();
			$("#image1").val("");
			$('#upload-name1').val("파일선택");
			$('#img-box1 img').attr('src', '/resources//img/noimage.jpg');
		});
		$('#image2').on('change', function() {
			var name = $(this).val().split('/').pop().split('\\').pop();
			ext = $(this).val().split('.').pop().toLowerCase(); //확장자
			//배열에 추출한 확장자가 존재하는지 체크
			if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				$("#image2").val("");
				window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
			} else {
				file = $('#image2').prop("files")[0];
				blobURL = window.URL.createObjectURL(file);
				$('#img-box2 img').attr('src', blobURL);
				$('#img-box2').slideDown(); //업로드한 이미지 미리보기 
				$('#upload-name2').val(name);
			}
		});
		$('#remove2').click(function(e) {
			e.preventDefault();
			$("#image2").val("");
			$('#upload-name2').val("파일선택");
			$('#img-box2 img').attr('src', '/resources//img/noimage.jpg');
		});
		$('#image3').on('change', function() {
			var name = $(this).val().split('/').pop().split('\\').pop();
			ext = $(this).val().split('.').pop().toLowerCase(); //확장자
			//배열에 추출한 확장자가 존재하는지 체크
			if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				$("#image3").val("");
				window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
			} else {
				file = $('#image3').prop("files")[0];
				blobURL = window.URL.createObjectURL(file);
				$('#img-box3 img').attr('src', blobURL);
				$('#img-box3').slideDown(); //업로드한 이미지 미리보기 
				$('#upload-name3').val(name);
			}
		});
		$('#remove3').click(function(e) {
			e.preventDefault();
			$("#image3").val("");
			$('#upload-name3').val("파일선택");
			$('#img-box3 img').attr('src', '/img/noimage.jpg');
		});
	</script>


		<!-- Scripts -->
			<script src="resources/css/myCampcss/assets/js/browser.min.js"></script>
			<script src="resources/css/myCampcss/assets/js/breakpoints.min.js"></script>
			<script src="resources/css/myCampcss/assets/js/jquery.min.js"></script>
			<script src="resources/css/myCampcss/assets/js/util.js"></script>
			<script src="resources/css/myCampcss/assets/js/main.js"></script>

	</body>
</html>