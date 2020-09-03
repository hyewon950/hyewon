<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PWD 변경</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrapcss">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
         <!-- JSTL -->
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
        <style>
    @charset "UTF-8";
 /* BASIC */
        #idChcekArea.a{
           color : red;
        }
        body {
            font-family: "Poppins", sans-serif;
            height: 100vh;
        }
        a {
            color: #9dcc97;
            display: inline-block;
            text-decoration: none;
            font-weight: 400;
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
            max-height: 1100px;
            position: relative;
            padding: 0px;
            -webkit-box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
            box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
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
       
        /* FORM TYPOGRAPHY*/
        /*input태그 모양*/
        input[type=button],
        input[type=submit],
        input[type=reset] {
            background-color: #b1ddab;
            border: none;
            color: white;
            padding: 15px 80px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            text-transform: uppercase;
            font-size: 13px;
            -webkit-box-shadow: 0 10px 30px 0 rgba(120, 189, 111, 0.4);
            box-shadow: 0 10px 13px 0 rgba(120, 189, 111, 0.4);
            -webkit-border-radius: 5px 5px 5px 5px;
            border-radius: 5px 5px 5px 5px;
            margin: 5px 20px 40px 20px;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -ms-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
            
        }
        input[type=button]:hover,
        input[type=submit]:hover,
        input[type=reset]:hover,
        #inputEBtn1:hover,
        #inputEBtn2:hover{
            background-color: #9dcc97;
        }
        input[type=button]:active,
        input[type=submit]:active,
        input[type=reset]:active,,
        #inputEBtn1:active
        #inputEBtn2:active {
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
            padding: 15px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 5px;
            width: 80%;
            /*테두리*/
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
            background-color: #f5f5f5;
            border: none;
            color: #0d0d0d;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 5px;
            width: 80%;
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
        @-webkit-keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @-moz-keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
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
        .underlineHover:hover {
            color: #0d0d0d;
            text-decoration : none;
        }
        .underlineHover:hover:after {
            width: 100%;
        }
        /* OTHERS */
        *:focus {
            outline: none;
        }
        
        label {
/*            font-size: 1em;*/
            font-family: "돋움";
            font-weight: 600;
            
        }
    </style>
</head>
<body>

<!--  네비바들어가는 부분-->
 <jsp:include page="../common/menuBar.jsp"></jsp:include>
<!-- 네비 끝 -->

<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->
            <b style="font-size:1.7em; padding-top:7px; color:#667866;">비밀번호 변경</b>
                <hr style="background-color:#b1ddab;">

			<!-- Login Form -->
			<form action="findPwdUpdate.do" method="post" id="formInfo"> 
				
                <br>
                <label for="mId">아이디 </label>
                <input type="text" id="mId" class="fadeIn" name="mId" value="${member.mId }" readonly>
                <br><a style="color: red"><label id="idChcekArea"></label></a><!-- 중복체크 --> <br>
                
                <label for="mPwd">비밀번호 </label>
                <input type="password" id="mPwd" class="fadeIn" name="mPwd" placeholder="비밀번호는 소문자,대문자,숫자 중 4글자이상으로 입력 바랍니다."  data-toggle="tooltip" data-placement="bottom" title="비밀번호는 소문자,대문자,숫자 중 8~12글자로 입력 바랍니다." >
                <br><br>
                
                <label for="mPwdre">비밀번호 확인 </label>
                <input type="password" id="mPwdre" class="fadeIn" name="mPwdre" placeholder="비밀번호는 소문자,대문자,숫자 중 4글자이상으로 입력 바랍니다." data-toggle="tooltip" data-placement="bottom" title="비밀번호는 소문자,대문자,숫자 중 8~12글자로 입력 바랍니다.">
                <br><br>
                
                <input type="reset" class="fadeIn" value="취소">
                <input type="button" class="fadeIn" value="비밀번호 변경" onclick="check();" name="submitBtn">
                
                
			 </form> 

			<!-- Remind Passowrd -->
			<div id="formFooter" class="link">
				<a class="underlineHover" href="home.do">메인페이지</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="underlineHover" href="loginView.do">로그인</a>
                
			</div>
		</div>
	</div>

<script>
          //유효성검사
        function check() {
             if (!(/^[a-zA-Z0-9]{4,}$/.test($("#mPwd").val()))) { 
               alert("비밀번호는 소문자,대문자,숫자 중 4글자이상으로 입력 바랍니다.");
             
            } else if (!($("#mPwd").val() == $("#mPwdre").val())) {
                alert("비밀번호와 비밀번호 확인 값은 같아야 합니다.");
              
            }  else{
               
                  alert("비밀번호 변경 완료!");
                  $("#formInfo").submit();
            }
        }
    </script>

</body>
</html>