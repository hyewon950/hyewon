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
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
	</head>
	<body class="cbp-spmenu-push">
		<%@ include file="SideMenuBar.jsp" %>
		<div class="container">
			<div class="main" style="margin-top: 3%">
				<h2>회원정보 조회</h2><br>
				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">이름</h3>
				  </div>
				  <div class="panel-body">
				  	<div class="panel-body">${sessionScope.member.mName}</div>
				  </div>
				</div>
				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">아이디</h3>
				  </div>
				  <div class="panel-body">
				  	<div class="panel-body">${sessionScope.member.mId}</div>
				  </div>
				</div>
				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">주소</h3>
				  </div>
				  <div class="panel-body">
				  	<div class="panel-body">(${sessionScope.member.mAddress1 }) ${sessionScope.member.mAddress2} ${sessionScope.member.mAddress3} ${sessionScope.member.mAddress4}</div>
				  </div>
				</div>
				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">휴대폰 번호</h3>
				  </div>
				  <div class="panel-body">
				  	<c:set var="pNum" value="${sessionScope.member.mPhone}"/>
				  	<div class="panel-body">0${fn:substring(pNum,0,2)}-${fn:substring(pNum,2,6)}-${fn:substring(pNum,6,10)} </div>
				</div>
				</div>
			</div>
		</div>
	</body>
</html>
