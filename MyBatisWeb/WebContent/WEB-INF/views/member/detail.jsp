<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<title>멤버 상세</title>

</head>
<body>
	<a href="memberList.do">멤버목록</a>
	<h3>상세조회</h3>
	<table class="table">
		<colgroup>
			<col width="150">
			<col width="*">
		</colgroup>
		<tr>
			<th>멤버Id</th>
			<td><input id="userId" name="userId" class="form-control"
			type="text" value="${member.userId }" readonly>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input id="email" name="email" class="form-control"
			type="text" value="${member.email }" readonly>
			</td>
		</tr>
		<tr>
			<th>폰번호</th>
			<td><input id="phoneNum" name="phoneNum" class="form-control"
			type="text" value="${member.phone }" readonly>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input id="address" name="address" class="form-control"
			type="text" value="${member.address }" readonly>
			</td>
		</tr>
	
	</table>
</body>
</html>