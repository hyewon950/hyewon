<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrapcss">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<!--툴팁-->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<style>
/* BASIC */
#idChcekArea.a {
	color: red;
}

body {
	font-family: "Poppins", sans-serif;
	height: 100vh;
}

a {
	color: #92badd;
	display: inline-block;
	text-decoration: none;
	font-weight: 400;
}

h2 {
	text-align: center;
	font-size: 16px;
	font-weight: 600;
	text-transform: uppercase;
	display: inline-block;
	margin: 40px 8px 10px 8px;
	color: #cccccc;
}

/* STRUCTURE */
.wrapper {
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
	width: 100%;
	min-height: 100%;
	padding: 20px;
}

#formContent {
	-webkit-border-radius: 10px 10px 10px 10px;
	border-radius: 10px 10px 10px 10px;
	background: #fff;
	padding: 30px;
	width: 90%;
	max-width: 700px;
	max-height: 700px;
	position: relative;
	padding: 0px;
	-webkit-box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	text-align: center;
}

#formFooter {
	background-color: #f6f6f6;
	border-top: 1px solid #dce8f1;
	padding: 25px;
	text-align: center;
	-webkit-border-radius: 0 0 10px 10px;
	border-radius: 0 0 10px 10px;
}

/* TABS */
h2.inactive {
	color: #cccccc;
}

h2.active {
	color: #0d0d0d;
	border-bottom: 2px solid #5fbae9;
}

/* FORM TYPOGRAPHY*/
input[type=button], input[type=submit], input[type=reset] {
	background-color: #56baed;
	border: none;
	color: white;
	padding: 15px 80px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 13px;
	-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
	margin: 5px 20px 40px 20px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover
	{
	background-color: #39ace7;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active
	{
	-moz-transform: scale(0.95);
	-webkit-transform: scale(0.95);
	-o-transform: scale(0.95);
	-ms-transform: scale(0.95);
	transform: scale(0.95);
}

input[type=text] {
	background-color: #f6f6f6;
	border: none;
	color: #0d0d0d;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 5px;
	width: 85%;
	border: 2px solid #f6f6f6;
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus {
	background-color: #fff;
	border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder {
	color: #cccccc;
}

input[type=password] {
	background-color: #f6f6f6;
	border: none;
	color: #0d0d0d;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 5px;
	width: 85%;
	border: 2px solid #f6f6f6;
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
}

input[type=password]:focus {
	background-color: #fff;
	border-bottom: 2px solid #5fbae9;
}

input[type=password]:placeholder {
	color: #cccccc;
}

/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
	-webkit-animation-name: fadeInDown;
	animation-name: fadeInDown;
	-webkit-animation-duration: 1s;
	animation-duration: 1s;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
}

@
-webkit-keyframes fadeInDown { 0% {
	opacity: 0;
	-webkit-transform: translate3d(0, -100%, 0);
	transform: translate3d(0, -100%, 0);
}

100%
{
opacity
:
 
1;
-webkit-transform
:
 
none
;

                
transform
:
 
none
;

            
}
}
@
keyframes fadeInDown { 0% {
	opacity: 0;
	-webkit-transform: translate3d(0, -100%, 0);
	transform: translate3d(0, -100%, 0);
}

100%
{
opacity
:
 
1;
-webkit-transform
:
 
none
;

                
transform
:
 
none
;

            
}
}

/* Simple CSS3 Fade-in Animation */
@
-webkit-keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
-moz-keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.fadeIn {
	opacity: 0;
	-webkit-animation: fadeIn ease-in 1;
	-moz-animation: fadeIn ease-in 1;
	animation: fadeIn ease-in 1;
	-webkit-animation-fill-mode: forwards;
	-moz-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
	-webkit-animation-duration: 1s;
	-moz-animation-duration: 1s;
	animation-duration: 1s;
}

.fadeIn.first {
	-webkit-animation-delay: 0.2s;
	-moz-animation-delay: 0.2s;
	animation-delay: 0.2s;
}

.fadeIn.second {
	-webkit-animation-delay: 0.4s;
	-moz-animation-delay: 0.4;
	animation-delay: 0.4s;
}

.fadeIn.third {
	-webkit-animation-delay: 0.6s;
	-moz-animation-delay: 0.6s;
	animation-delay: 0.6s;
}

.fadeIn.fourth {
	-webkit-animation-delay: 0.8s;
	-moz-animation-delay: 0.8s;
	animation-delay: 0.8s;
}

.fadeIn.fifth {
	-webkit-animation-delay: 1s;
	-moz-animation-delay: 1s;
	animation-delay: 1s;
}

.fadeIn.sixth {
	-webkit-animation-delay: 1.2s;
	-moz-animation-delay: 1.2s;
	animation-delay: 1.2s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
	display: block;
	left: 0;
	bottom: -10px;
	width: 0;
	height: 2px;
	background-color: #56baed;
	content: "";
	transition: width 0.2s;
}

.underlineHover:hover {
	color: #0d0d0d;
}

.underlineHover:hover:after {
	width: 100%;
}

/* OTHERS */
*:focus {
	outline: none;
}

#icon {
	width: 40%;
}
</style>
</head>

<body>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<img src="/img/logo.png" id="icon" alt="User Icon" />
			</div>
			<div id="check"></div>
			<!-- Login Form -->
			<form action="/enroll" method="post" id="form">
				<input type="text" id="mId" class="fadeIn second" name="mId"
					placeholder="아이디" data-toggle="tooltip" data-placement="bottom"
					title="아이디는 소문자, 숫자만 가능하고 4~12글자 입력바랍니다."> <br>
				<a style="color: red"><label id="idChcekArea"></label></a>
				<!-- 중복체크 -->
				<br>
				<input type="password" id="mPwd" class="fadeIn third" name="mPwd"
					placeholder="비밀번호" data-toggle="tooltip" data-placement="bottom"
					title="비밀번호는 소문자,대문자,숫자 중 8~12글자로 입력 바랍니다."> <input
					type="password" id="mPwdre" class="fadeIn fourth" name="mPwdre"
					placeholder="비밀번호 확인" data-toggle="tooltip" data-placement="bottom"
					title="비밀번호는 소문자,대문자,숫자 중 8~12글자로 입력 바랍니다."> <input
					type="text" id="mName" class="fadeIn fifth" name="mName"
					placeholder="이름" data-toggle="tooltip" data-placement="bottom"
					title="이름은 한글(최소1글자)만 가능합니다."> <input type="text"
					id="mPhone" class="fadeIn sixth" name="mPhone" placeholder="전화번호"
					data-toggle="tooltip" data-placement="bottom"
					title="숫자만 입력바랍니다(ex.01012345678)">

				<!-- <br><a style="color: red"><label id="pHoneChcekArea"></label></a>중복체크 -->

				<input type="button" class="fadeIn sixth" value="회원가입"
					onclick="check();" name="submitBtn"> <input type="reset"
					class="fadeIn seventh" value="취소">
			</form>

			<!-- Remind Password -->
			<div id="formFooter">
				<a class="underlineHover" href="findID.jsp">ID를 잊으셨나요?</a>
			</div>

		</div>
	</div>

	<script>
        $('.btn.danger').button('toggle').addClass('fat')

        function check() {

            if (!(/^[a-z][a-z0-9_-]{3,11}$/.test($("#mId").val()))) {
                alert("아이디는 소문자, 숫자만 가능하고 4~12글자 입력바랍니다.");
              

            } else if (!(/^[a-zA-Z0-9]{8,12}$/.test($("#mPwd").val()))) { 
               alert("비밀번호는 소문자,대문자,숫자 중 8~12글자로 입력 바랍니다.");
             

            } else if (!($("#mPwd").val() == $("#mPwdre").val())) {
                alert("비밀번호와 비밀번호 확인 값은 같아야 합니다.");
              
            } else if (!(/[가-힣]+$/.test($("#mName").val()))) {
                alert("이름은 한글(최소1글자)만 가능합니다.");
               
            } else if (!(/^010[0-9]{3,4}[0-9]{4}$/.test($("#mPhone").val()))) {
                alert("폰번호를 재확인 해주세요");
           
            } else{
            	var result = confirm("가입하시겠습니까");
            	if(result == true){
            		$("#form").submit();
            	} else{
            		alert("가입을 취소하셨습니다.");
            	}
            	
            }
        }
    </script>

	<script type="text/javascript">
    	$("#mId").keyup(function () {
    		$.ajax({
                url : "/IdCheck",
                type : "POST",
                data:{
                      mId : $("#mId").val()
                   },
                success : function(data) {
                   if(data >= 1){
                	   $("#idChcekArea").text("이미 있는 아이디입니다.");
                   }else{       
                	   $("#idChcekArea").text("사용 가능한 아이디 입니다.");
                   }
                }
             });
		});
    </script>
</body>
</html>
