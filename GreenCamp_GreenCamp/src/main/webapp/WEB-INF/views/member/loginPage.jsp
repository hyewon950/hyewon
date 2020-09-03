<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrapcss">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
        <style>
            
/* BASIC */
html {
  background-color: white;
}
body {
  font-family: "Poppins", sans-serif;
  height: 100vh;
}
a {
  color: #9dcc97;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}
/*
h2 {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 40px 8px 10px 8px; 
  color: #cccccc;
}
*/
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
  max-width: 450px;
  position: relative;
  padding: 0px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}
#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #b1ddab;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}
/* TABS */
/*
h2.inactive {
  color: #cccccc;
}
h2.active {
  color: #0d0d0d;
  border-bottom: 2px solid #ff0026;
}
*/
/* FORM TYPOGRAPHY*/
input[type=button], input[type=submit], input[type=reset]  {
  background-color: #b1ddab;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(120, 189, 111,0.4);
  box-shadow: 0 10px 30px 0 rgba(120, 189, 111,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #9dcc97;
}
input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}
input[type=text] {
  background-color: #f5f5f5;
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
  border-bottom: 2px solid #9dcc97;
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
  border-bottom: 2px solid #9dcc97;
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
@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}
@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}
/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;
  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;
  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}
.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}
.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}
.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}
.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}
/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #9dcc97;
  content: "";
  transition: width 0.2s;
}
/*아이디찾기클릭시색상*/
.underlineHover:hover {
  color: #6f706f;
    text-decoration : none;
}
.underlineHover:hover:after{
  width: 100%;
}
/* OTHERS */
*:focus {
    outline: none;
} 
#icon {
  width:60%;
}
#idChcekArea.a{
        	color : red;
        }
        </style>
</head>
    
<body>

<!--  네비바들어가는 부분-->
 <jsp:include page="../common/menuBar.jsp"></jsp:include>
<!-- 네비끝 -->

<div class="wrapper fadeInDown">
              <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Login Form -->
                <form action="login.do" method="post" id="loginForm">
                <br><br>
                  <input type="text" id="login" class="fadeIn second" name="mId" placeholder="아이디를 입력해주세요">
                  <br><br>
                  <input type="password" id="password" class="fadeIn third" name="mPwd" placeholder="비밀번호를 입력해주세요">
                 <br><br><a style="color: red"><label id="idChcekArea"></label></a><!-- 중복체크 -->
                  <br><input type="button" class="fadeIn fourth" value="로그인" id="submitBtn">
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                  <a class="underlineHover" href="findIDView.do">아이디 찾기</a>
                  <br>
                  <a class="underlineHover" href="findPwdView.do">비밀번호 찾기</a>
                </div>

              </div>
        </div>
        
        <script>
        //버튼클릭시 로그인
    	$("#submitBtn").click(function(key) {
    		if($("#login").val() == ""){
    			alert("아이디를 입력해주세요.");
    		}else if($("#password").val()==""){
    			alert("비밀번호를 입력해주세요.");
    		}else{
	    		$.ajax({
	                url : "idpwdCheck.do", //아이디 비밀번호 맞는지 확인 
	                type : "POST",
	                data:{
	                      mId : $("#login").val(),
	                      mPwd : $("#password").val()
	                      
	                   },
	                success : function(result) {
	                   if(result == "true"){
	                	   $("#idChcekArea").text("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
	                	   
	                   }else{
	                	   console.log(result);
	                	   $("#loginForm").submit();
	                	   
	                   }
	                }
	             });
    		}
		});
    	
    	
    	//엔터시 로그인
		$(document).keypress(function(key) {
		
			if (key.keyCode == 13) { //13 : "Enter"
				if($("#login").val() == ""){
	    			alert("아이디를 입력해주세요.");
	    		}else if($("#password").val()==""){
	    			alert("비밀번호를 입력해주세요.");
	    		}else{
		    		$.ajax({
		                url : "idpwdCheck.do", //아이디 비밀번호 맞는지 확인 
		                type : "POST",
		                data:{
		                      mId : $("#login").val(),
		                      mPwd : $("#password").val()
		                      
		                   },
		                success : function(result) {
		                   if(result == "true"){
		                	   $("#idChcekArea").text("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
		                	   
		                   }else{
		                	   console.log(result);
		                	   $("#loginForm").submit();
		                	   
		                   }
		                }
		             });
	    		}
			
			
			}
			
		});



    </script>
        
</body>
</html>