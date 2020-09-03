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
		<link rel="stylesheet" type="text/css" href="/css/default.css" />
		<link rel="stylesheet" type="text/css" href="/css/component.css" />
		<script src="/js/modernizr.custom.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	</head>
	<body class="cbp-spmenu-push">
		<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1" style="background: #c8eac6;">
			<h3 style="color: white; background: #14b3b3;">MyPage</h3>
			<a href="/views/extra/searchMember.jsp" style="text-decoration: none;" class="aAll">회원정보 조회</a>
			<a href="/views/extra/memberModify.jsp" style="text-decoration: none;" class="aAll">회원정보 수정</a>
			<a href="/myOrderList" style="text-decoration: none;" class="aAll">구매내역</a>
			<a href="/searchBasket" style="text-decoration: none;" class="aAll">장바구니</a>
			<a href="/views/extra/MemberDelete.jsp" style="text-decoration: none;" class="aAll">회원탈퇴</a>
			<a href="/" style="width: 50px; height: 50px; text-decoration: none; border-bottom: 0px solid;" id="linkArea"><img src="/css/homeIco.png" style="width: 50px; height: 50px;"></a>
		</nav>
		<!-- Classie - class helper functions by @desandro https://github.com/desandro/classie -->
		<script src="/js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				body = document.body;

			$(function () {
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				$('.aAll').css("border-bottom", "1px solid rgb(154, 197, 152)");
				$('.aAll').css("color", "black");
			});
			
			$('#linkArea').hover(function() {
				  $(this).css("background", "#c8eac6");
				}, function(){
				  $(this).css("background", "#c8eac6");
			});
			
			$('.aAll').hover(function() {
				  $(this).css("background", "#16adad");
				}, function(){
				  $(this).css("background", "#c8eac6");
			});
		</script>
	</body>
</html>
