<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강좌등록</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<a href="lectureList.do">뒤로가기</a>
	<h1 align="center">강좌등록</h1>
	<form action="lectureRegister.do" method="post">
		<table align="center">
			<colgroup>
				<col width="150">
				<col width="*">
			</colgroup>
			<tr>
				<td>강좌명</td>
				<td><input id="lectureName" name="lectureName" 
				type="text" class="form-control"></td>
			</tr>
			<tr>
				<td>강사명</td>
				<td><input id="instructorName" name="instructorName" type="text"
				class="form-control"></td>
			</tr>
			<tr>
				<td>강좌소개</td>
				<td><textarea id="lectureIntroduce" name="lectureIntroduce"
				class="form-control" rows="7"></textarea></td>
			</tr>
		</table>
		<br>
		<div align="center">
			<input class="btn" type="reset" value="취소">
			<input class="btn btn-success" type="submit" value="저장">
		</div>
	</form>

</body>
</html>