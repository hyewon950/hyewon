<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">

<title>멤버 정보 수정</title>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	<a href="memberList.do">목록으로</a>
	<h3>정보수정</h3>
	<form action="memberModify.do" method="post">
		<input id="userId" name="userId" type="hidden"
			value="${member.userId }">
		<table class="table">
			<colgroup>
				<col width="150">
				<col width="*">
			</colgroup>
			<tr>
				<th>비밀번호</th>
				<td><input id="userPwd" name="userPwd" class="form-control"
					type="password" value="">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input id="email" name="email" class="form-control"
				type="text" value="${member.email }">
				</td>
			</tr>
			<tr>
				<th>폰번호</th>
				<td><input id="phoneNum" name="phoneNum" class="form-control"
				type="text" value="${member.phone }">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input id="address" name="address" class="form-control"
				type="text" value="${member.address }">
				</td>
			</tr>
		</table>	
			<div>
		<a href="memberDetail.do?id=${member.userId}" class="btn btn-sm btn-danger">취소</a>
		<input type="submit" class="btn btn-sm btn-success" value="저장">
	</div>
		
	</form>

</body>
</html>