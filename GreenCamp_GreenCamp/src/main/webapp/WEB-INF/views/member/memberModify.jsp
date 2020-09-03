<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>

 <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        
        
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrapcss">
    
    <!--    input날짜선택    -->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


        <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
        
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
								<b>회원 정보 수정</b>

							</header>



							<section>
                                <div class="container">

                                    
                                    <form action="mupdate.do" method="post" id="infoForm">
                                        <div id="contents">

                                            <div class="form-group">
                                                <label>이름 : </label>
                                                <input type="text" readonly class="form-control" name="mName" value="${loginUser.mName}">
                                            </div>
                                            <div class="form-group">
                                                <label>아이디 : </label>
                                                <input type="text" readonly class="form-control" name="mId" value="${loginUser.mId}">
                                            </div>
                                            <div class="form-group">
                                                <label for="pwd1">비밀번호 : </label>
                                                <input type="password" id="pwd1" class="form-control" name="mPwd" placeholder="비밀번호를 입력해주세요">
                                            </div>
                                            <div class="form-group">
                                                <label for="pwd2">비밀번호 확인 : </label>
                                                <input type="password" id="pwd2" class="form-control" placeholder="비밀번호 확인">
                                            </div>
                                            <div class="form-group">
                                                <div class="alert alert-success" id="alert-success" style="width: 350px; margin-left: 15%;">비밀번호가 비밀번호 확인하고 일치합니다.</div>
                                                <div class="alert alert-danger" id="alert-danger" style="width: 350px; margin-left: 15%;">비밀번호가 비밀번호 확인하고 일치하지 않습니다.</div>
                                            </div>
                                            
                                           <!--  <div class="form-group">
                                                <input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
                                                <span id="guide" style="color:#999;display:none"></span>

                                            </div> -->
                                            <div class="form-group">
                                                <label for="phoneNum">전화번호 : </label>
                                                <input id="phoneNum" type="text" name="mPhone" class="form-control" maxlength="13" value="${loginUser.mPhone}">
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="mEmail">이메일 : </label>
                                                <input id="mEmail" type="text" name="mEmail" class="form-control" value="${loginUser.mEmail}">
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="startDate">생년월일 : </label>
                                                 <input type="text" id="startDate" class="form-control" name="mBirthday" value="${loginUser.mBirthday }" data-toggle="tooltip" data-placement="bottom" title="클릭해주세요">
                                                
                                                
                                            </div>
                                            
                                            <div class="form-group" style="margin: auto; width: 40%;">
                                                <button type="button" class="btn btn-success" style="margin: auto;" id="submitBtn">정보수정완료</button>
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
       //비밀번호 일치 유효성 검사
      $(function() {
         $("#alert-success").hide();
         $("#alert-danger").hide();
         $("input").keyup(function() {
            var pwd1 = $("#pwd1").val();
            var pwd2 = $("#pwd2").val();
            
            if (pwd1 != "" || pwd2 != "") {
               if (pwd1 == pwd2) {
                  $("#alert-success").show();
                  $("#alert-danger").hide();
                  $("#submit").removeAttr("disabled");
               } else {
                  $("#alert-success").hide();
                  $("#alert-danger").show();
                  $("#submit").attr("disabled", "disabled");
               }
            }
         });
      });
   
   //비밀번호 유효성 검사 
      $("#submitBtn").click(function() {
          var pwd1= $("#pwd1").val();
          var num = pwd1.search(/[0-9]/g);
          var eng = pwd1.search(/[a-z]/ig);
          var spe = pwd1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
          if(pwd1.length < 8 || pwd1.length > 20){
           alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
           return false;
          }else if(pwd1.search(/\s/) != -1){
           alert("비밀번호는 공백 없이 입력해주세요.");
           return false;
          }else if(num < 0 || eng < 0 || spe < 0 ){
           alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
           return false;
          }else {
            alert("정보 수정이 완료되었습니다.");
            $("#infoForm").submit();
             return true;
          } 
      });
       

        
        /*달력생성*/
        $(function() {
            $("#startDate").datepicker({

                //버튼생성
                /*showOn: "both",
                buttonText: "달력",*/
                //월선택
                changeMonth: true,
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],

                //년선택
                changeYear: true,
                yearRange: "100",
                //<,>으로 이전 다음 달로 넘어가기
                nextText: '다음 달',
                prevText: '이전 달',

                //최소,최대날짜 선택 범위 D(날짜), M(달),Y(년)
                minDate: "-100Y",
                maxDate: "-1D",
                //표시할 날짜 형식 바꿈
                dateFormat: "yy.mm.dd",
                closeText: "닫기"
            });
        });
    
       
   </script>

</body>
</html>