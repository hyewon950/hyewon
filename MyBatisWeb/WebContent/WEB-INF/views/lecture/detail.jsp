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
	<a href="lectureList.do">강좌목록</a>
	<h3>상세조회</h3>
	<table class="table">
		<colgroup>
			<col width="150">
			<col width="*">
		</colgroup>
			<tr>
				<td>강좌명</td>
				<td><input id="lectureName" name="lectureName" 
				type="text" class="form-control" value="${lecture.lectureName}" readonly></td>
			</tr>
			<tr>
				<td>강사명</td>
				<td><input id="instructorName" name="instructorName" type="text"
				class="form-control"value="${lecture.instructor }"  readonly ></td>
			</tr>
			<tr>
				<td>강좌소개</td>
				<td><textarea id="lectureIntroduce" name="lectureIntroduce"
				class="form-control" rows="7"  value="${lecture.introduce}" readonly >${lecture.introduce}</textarea></td>
			</tr>
	</table>
</body>
</html>