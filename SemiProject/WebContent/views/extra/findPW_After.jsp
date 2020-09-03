
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String mId = request.getParameter("ID");
%>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>상품페이지</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        
        <style>
            .head {
                font-size: 20px;
                color: deepskyblue;
            }
            
            row {
                display: block;
            }
            
            .card {
                padding: 15px;
                text-align: center;
            }
            
            li {
                list-style: none;
                padding: 0 50px 0 0;
            }

            #mPwd {
                display: inline-block;
                margin: 15px;
                padding: 10px;
                border: solid 1px #E4E4E4;
                border-radius: 6px;
                background-color: #fff;
                height: 40px;
                width: 60%;
            }
            
            #mPwdre {
                display: inline-block;
                margin: 15px;
                padding: 10px;
                border: solid 1px #E4E4E4;
                border-radius: 6px;
                background-color: #fff;
                height: 40px;
                width: 60%;
            }

            #pw1 {
                padding: 0 0 0 32px;
            }
            
            .btn {
                background-color: #56baed;
                border: none;
                color: white;
                text-align: center;
                font-size: 15px; 
                width: 200px;
                height: 40px;
                margin: 20px 0 0 0;
            }
            .btn{
                height: 60px;
                width: 150px;
            }
        </style>
    </head>
    <body>
        <header>
        </header>
        <section>
            <div class="container">
                <span class="head">
                    - 비밀번호 변경
                </span>
                <hr>      
                <form action="/ChPwd" method="post">
                    <div class="card">
                        <ul>
                            <li>
                            	<input type="hidden" value="<%= mId %>" id="mId" name="mId">
                                <label for="password" id="pw1">비밀번호 : </label>
                                <input type="password" id="mPwd" class="fadeIn third" name="mPwd" placeholder="비밀번호"  data-toggle="tooltip" data-placement="bottom" title="비밀번호는 소문자,대문자,숫자 중 8~12글자로 입력 바랍니다." >
                            </li>
                            <li>
                                <label for="password">비밀번호 확인 : </label>
                                <input type="password" id="mPwdre" class="fadeIn fourth" name="login" placeholder="비밀번호 확인" data-toggle="tooltip" data-placement="bottom" title="비밀번호는 소문자,대문자,숫자 중 8~12글자로 입력 바랍니다.">
                            </li>
                            <li>
                                <center>
                                <input style="margin-left: 100px;" type="submit" class="btn" value="비밀번호 변경 완료" onclick="return check();">
                                </center>
                            </li>
                        </ul>
                    </div>
                </form>
                
            </div>
        </section>
        <footer>
        </footer>
        <script>
        function check() {
            if (!(/^[a-zA-Z0-9]{8,12}$/.test($("#mPwd").val()))) { 
                alert("비밀번호는 소문자,대문자,숫자 중 8~12글자로 입력 바랍니다.");
                return false;
            } else if (!($("#mPwd").val() == $("#mPwdre").val())) {
                alert("비밀번호와 비밀번호 확인 값이 같아야 합니다.");
                return false;
            }
        }
    </script>
    </body>
</html>