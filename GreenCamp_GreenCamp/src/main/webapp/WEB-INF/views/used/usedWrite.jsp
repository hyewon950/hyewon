	<%@ page language="java" contentType="text/html; charset=UTF-8"
  	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>


<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>글쓰기</title>
    <link rel="stylesheet" href="/test/css/bootstrap.css">
    <link rel="stylesheet" href="../../../resources/css/usedBoard/assets/css/main.css" />
                	 <!-- 합쳐지고 최소화된 최신 CSS -->
       		<script src="../../../resources/css/camping/assets/js/jquery.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/jquery.dropotron.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/jquery.scrolly.min.js"></script>
       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- 부가적인 테마 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
		<!--폰트어썸-->
    	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" rel="stylesheet">
    
    	<!-- 부트스트랩 -->
   		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> 
       <link href="https://fonts.googleapis.com/css2?family=Song+Myung&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
    <style>
    
        button {
            float: right;
        }
    

    </style>
    
    
     <meta charset="utf-8">
        <title>글 작성 페이지</title>
        <!-- Make sure the path to CKEditor is correct. -->
      <!-- <script src="//cdn.ckeditor.com/4.14.1/full/ckeditor.js"></script>
        <script src="../ckeditor.js"></script>  -->
    
     <%-- <script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script> --%>  
    <script src="/resources/ckeditor/ckeditor.js"></script>
    
	</head>
	
	

			<body>
			     <div class="container">
			     <jsp:include page="../common/menuBar.jsp"></jsp:include>
			     <br><br><br><br><br><br>
	         <form  id="form_data" method="POST">
	            <table class="table table-bordered">
                <thead>
                <div class="text-center"
			style="width: 100%; font-family: 'Song Myung', serif;">
			<h2 class="section-heading text-uppercase">중고거래 게시판입니다.</h2>
			<h3 class="section-subheading text-muted">허가받지 않은 자의 거래가 금지되는
				주류, 담배, 헌혈증과 같은 제품은 금지합니다.</h3>
		</div>
		<br> <br> <br>
		
                    <p>게시물 작성</p>
                    <br>
                </thead>

         
                <tbody>
                    <tr>
                        <th>제목 : </th>
                        <td><input type="text" name="usedTitle" id="usedTitle" class="form-control" placeholder="제목을 입력해주세요."></td>
                    </tr>
                    <tr>
                        <th>작성자 : </th>
                        <td><input type="text" name="usedWriter" id="usedWriter" class="form-control" value="${loginUser.mId}"placeholder="${usedBoard.usedWriter}" readOnly></td>
                    </tr>
                    <tr>
                        <th>지역 : </th>
                        <td><input type="text" name="usedArea" id="usedArea" class="form-control" value="${usedBoard.usedArea}" placeholder="지역을 입력하라우"></td>
                    </tr>
                    	
                    	<!-- 드랍바 선택
                    	 서울, 경기, 인천, 강원, 세종, 대전, 충북, 충남, 경북, 경남, 전북, 전남, 광주, 대구, 제주 -->

                    <tr>
                        <th>가격 : </th>
                        <td><input type="text" name="usedPrice" id="usedPrice" class="form-control" value="${usedBoard.usedPrice}" placeholder="가격을 입력하라우"></td>
                    </tr>
                    
                    <tr>
                        <th>판매완료 여부 : </th>
                        <td>
                        	<select name="usedYn" >
                        		<option value="N" <c:if test="${usedBoard.usedYn == '판매중' }" >selected</c:if>>판매중</option>
                        		<option value="Y" <c:if test="${usedBoard.usedYn == '판매완료' }" >selected</c:if>>판매완료</option>
                        	</select>
						</td>
                    </tr>
                    <tr>
                        <th>내용 : </th>
                        <td><form>
            <textarea name="usedContent" id="editor1" rows="10" cols="80">
            ${usedBoard.usedContent}
                내용을 입력하세요.
            </textarea>
             <script>
            	var ckditor_config={
            			resize_enaleb : false,
            			enterMode:CKEDITOR.ENTER_BR,
            			filebrowserUploadUrl:"fileupload.do"
            	};
                // Replace the <textarea id="editor1"> with a CKEditor 4
                // instance, using default configuration.
                CKEDITOR.replace( 'editor1',ckditor_config);
                
                $("#usedYn").change(function(){
                    var selop =  $(this).val();
                    selop.val() == "Y";
                    
                })


                
                
            </script> 
           
           
 
        </form></td>
                    </tr>
                    
                </tbody>
            </table>
            
            <br>
            <a href="ulist.do"><button type="button" class="btn btn-secondary">취소하기</button></a>
        
            <button type="submit" class="btn btn-info">등록하기</button>
            

        </form>
    </div>

    
    
    			<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../../../resources/js/jquery.dropotron.min.js"></script>
        <script src="../../../resources/js/jquery.scrolly.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>
    
    
    
    
    
    		<footer id="footer">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-12">

						<!-- About -->
						<section>
							<h2 class="major">
								<span>What's this about?</span>
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
					<div class="col-12">

						<!-- Contact -->
						<section>
							<h2 class="major">
								<span>Get in touch</span>
							</h2>
							<ul class="contact">
								<li><a class="icon brands fa-facebook-f" href="#"><span
										class="label">Facebook</span></a></li>
								<li><a class="icon brands fa-twitter" href="#"><span
										class="label">Twitter</span></a></li>
								<li><a class="icon brands fa-instagram" href="#"><span
										class="label">Instagram</span></a></li>
								<li><a class="icon brands fa-dribbble" href="#"><span
										class="label">Dribbble</span></a></li>
								<li><a class="icon brands fa-linkedin-in" href="#"><span
										class="label">LinkedIn</span></a></li>
							</ul>
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


</body>

</html>
