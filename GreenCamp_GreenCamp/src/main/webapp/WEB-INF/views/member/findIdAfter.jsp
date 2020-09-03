<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 찾기 성공</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrapcss">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        <!-- JSTL -->
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
        <style>
        /*CSS*/
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
        }
        .underlineHover:hover:after{
          width: 100%;
        }
        /* OTHERS */
        *:focus {
            outline: none;
        } 
       
         
        /*밑줄 없애기*/
         .link a {
                text-decoration : none;
            }
            .link div a:hover {
                color : #FFF;
            }
            
        /*아이디 찾기css*/
            .textId{
                height: 50px;
                line-height: 50px;
                font-size:1.1em;
                background-color:#F2FBEF;
                margin-left:100px;
                margin-right:100px;
                color: darkblue;
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


			<!-- Login Form -->
			<form action="/FindIDAfter" method="post" id="formInfo"> 
				<b style="font-size:1.7em; padding-top:7px; color:#667866;">ID 찾기</b>
                <hr style="background-color:#b1ddab;">
                <br>
                <p>고객님의 정보와 일치하는 아이디</p>
                <br>
                <div class="textId">${member.mId }</div>
            <br><br>    
                
			 </form> 

			<!-- Remind Passowrd -->
			<div id="formFooter" class="link">
				<a class="underlineHover" href="home.do">메인페이지</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="underlineHover" href="loginView.do">로그인</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="underlineHover" href="findPwdView.do">비밀번호찾기</a>
			</div>
		</div>
	</div>

</body>
</html>