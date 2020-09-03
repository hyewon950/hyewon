<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴페이지</title>

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <style>
        .form-group input{
            width: 350px;
            margin-left: 18%;
        }
        
        .form-group label {
            float: left;
        }
    </style>

</head>
<body>

<!--  네비바들어가는 부분-->
 <jsp:include page="../common/menuBar.jsp"></jsp:include>
<!-- 네비끝 -->

<!--시작-->
    <br>

    <header id="header">
        <div class="myPage">
            <div>
                <h1>${loginUser.mName }님 마이페이지</h1>
            </div>
        </div>
    </header>


	<!-- Main -->
	<section id="main">
		<div class="container">
			<div class="row">

				<!-- 마이페이지 네비바 -->
				<jsp:include page="myPageNav.jsp"></jsp:include>

				<!-- 내용 -->
				<div class="col-9 col-12-medium imp-medium">
					<div class="content">

						<!-- Content -->

						<article class="box page-content">

							<header id="contentHead">
								<b>회원 정보 탈퇴</b>

							</header>



							<section>
								<div class="container">

									<form action="mdelete.do" method="post" id="infoForm">
										<div id="contents">


											<div class="form-group">
												<label>아이디 : </label> <input type="text" readonly
													class="form-control" name="mId" value="${loginUser.mId}">
											</div>
											<div class="form-group">
												<label for="mPwd">비밀번호 : </label> <input type="password"
													id="mPwd" class="form-control" name="mPwd"
													placeholder="비밀번호를 입력해주세요">
											</div>


											<div class="form-group" style="margin: auto; width: 40%;">
												<button type="button" class="btn btn-secondary"
													style="margin: auto;" id="submitBtn">탈퇴하기</button>
											</div>

										</div>

									</form>



								</div>


							</section>



						</article>

					</div>
				</div>

			</div>
		</div>
	</section>


	<script>
		      $("#submitBtn").click(function() {
		    	 var pw = "${loginUser.mPwd}"
		    	 var pwCheck = $("#mPwd").val();
		    	 if(pwCheck == pw){
		    	 var result = confirm("탈퇴하시겠습니까?"); 
		    		 if(result == true){
			         alert("이용해 주셔서 감사합니다.");
			         $("#infoForm").submit();
		    		 }else{
		    			 alert("탈퇴를 취소하였습니다.");
		    		 }
		    	 }else{
		    		 alert("비밀번호가 정확하지 않습니다.");
		    	 }
		    	
		      });
    </script>


</body></html>