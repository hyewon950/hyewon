<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Farms - MyPage</title>
		<meta name="description" content="Blueprint: Slide and Push Menus" />
		<meta name="keywords" content="sliding menu, pushing menu, navigation, responsive, menu, css, jquery" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	</head>
	<body class="cbp-spmenu-push">
		<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
			<h3>MyPage</h3>
			<a href="#" style="text-decoration: none;">회원정보 조회</a>
			<a href="#" style="text-decoration: none;">회원정보 수정</a>
			<a href="#" style="text-decoration: none;">구매내역</a>
			<a href="#" style="text-decoration: none;">장바구니</a>
			<a href="#" style="text-decoration: none;">회원탈퇴</a>
		</nav>
		<div class="container">
			<div class="main">
				<div class="panel panel-primary" style="margin-top: 5%;">
					<div class="panel-heading">
						<h3 class="panel-title">이름</h3>
					</div> 
					<div class="panel-body">
						내용
					</div>
				</div>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">아이디</h3>
					</div>
					<div class="panel-body">
						내용
					</div>
				</div>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">주소</h3>
					</div>
					<div class="panel-body">
						내용
					</div>
				</div>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">휴대폰 번호</h3>
					</div>
					<div class="panel-body">
					</div>
				</div>
			</div>
		</div>
		<!-- Classie - class helper functions by @desandro https://github.com/desandro/classie -->
		<script src="js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				body = document.body;

			$(function () {
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
			});
		</script>
	</body>
</html>
