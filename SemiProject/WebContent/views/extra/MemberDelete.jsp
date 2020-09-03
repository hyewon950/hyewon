<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="UTF-8" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Farms - MyPage</title>
		<meta name="description" content="Blueprint: Slide and Push Menus" />
		<meta name="keywords" content="sliding menu, pushing menu, navigation, responsive, menu, css, jquery" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" type="text/css" href="../css/default.css" />
		<link rel="stylesheet" type="text/css" href="../css/component.css" />
		<script src="../js/modernizr.custom.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<style type="text/css">
			body {
				margin: 0px;
				padding: 0px;
			}
			
			#wrapper {
				width: 1200px;
				padding: 10px;
				position: absolute;
				top: 130px;
				left: 50%;
				margin-left: -538px;
			}
			
			#sidebar {
				width: 220px;
				float: left;
				padding: 10px;
			}
			
			#contents {
				border: 1px solid #dfe1e5;
				border-radius: 10px;
				width: 920px;
				height: 500px;
				float: left;
				padding: 10px;
				margin-left: 10px;
				margin-top: 1%;
			}
			
			.logo {
				font-size: 50px;
				/*text-shadow: 0 0 10px #666;*/
				color: #01DFA5;
				margin-top: 20px;
				margin-left: 100px;
				text-align: left;
				/*text-transform: capitalize;*/
			}
			
			ul {
				list-style-type: none;
				margin: 0;
				padding: 0;
				width: 200px;
				background-color: #01DFA5;
				line-height: 5em;
				text-align: center;
			}
			
			li a {
				display: block;
				color: #000;
				padding: 8px 16px;
				text-decoration: none;
			}
			
			li a.active {
				background-color: #660099;
				color: white;
			}
			
			li a:hover:not (.active ) {
				background-color: #660099;
				color: white;
				text-decoration: none;
				border-radius: 10px;
			}
			
			.info {
				width: 300px;
				height: 35px;
			}
		</style>
	</head>
	<body class="cbp-spmenu-push">
		<%@ include file="SideMenuBar.jsp" %>
		<div class="container">
			<div class="main" style="margin-top: 3%; margin-left: 240px;">
				<h3><img src="img/Icon/search.png" width="35px;" height="35px;">회원 탈퇴</h3>
	                <hr class="hrLine">
				<form action="/mDelete" method="post" id="infoForm">
					<div id="contents">
						<div style="margin-left: 15%; margin-top: 10%;">
							<div class="form-group">
								<label for="이름" style="float: left;">아이디 : </label> 							
									<input type="text" readonly class="form-control" style="width: 350px; margin-left: 15%;" value="${member.mId}" name="mId">
							</div>
							<div class="form-group">
								<label for="이름" style="float: left;">비밀번호 : </label> <input
									type="password" class="form-control"
									style="width: 350px; margin-left: 15%;" name="mPwd"
									placeholder="비밀번호를 입력해주세요">
							</div>
							<div class="form-group" style="margin: auto; width: 40%;">
								<button type="button" class="btn btn-primary"
									style="margin: auto; width: 100px" id="submitBtn">탈퇴하기</button>
							</div>
		
		
						</div>
					</div>
				</form>
		</div>
		
		<script>
	
	
		$("#submitBtn").click(function() {
			
			var result = confirm("탈퇴하시겠습니까");
        	if(result == true){
        		$("#infoForm").submit();
        		alert("이용해 주셔서 감사합니다.");
        	} else{
        		alert("탈퇴를 취소하셨습니다.");
        	}
		});
	</script>
	</body>
</html>





















