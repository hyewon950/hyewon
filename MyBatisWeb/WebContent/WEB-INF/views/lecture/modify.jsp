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
	<form action="lecturemodify.do" method="post">
		<input id="lecId" name="lecId" type="hidden" value="${lecture.id}">
	<table class="table">
		<colgroup>
			<col width="150">
			<col width="*">
		</colgroup>
			<tr>
				<td>강좌명</td>
				<td><input id="lectureName" name="lectureName" 
				type="text" class="form-control" value="${lecture.lectureName}"></td>
			</tr>
			<tr>
				<td>강사명</td>
				<td><input id="instructorName" name="instructorName" type="text"
				class="form-control" value="${lecture.instructor }" ></td>
			</tr>
			<tr>
				<td>강좌소개</td>
				<td><textarea id="lectureIntroduce" name="lectureIntroduce"
				class="form-control" rows="7" value="${lecture.introduce}">${lecture.introduce}</textarea></td>
			</tr>
	</table>	
			<div>
		<a href="lectureDetail.do?id=${lecture.id }" class="btn btn-sm btn-danger">취소</a>
		<input type="submit" class="btn btn-sm btn-success" value="저장">
	</div>
		
	</form>

</body>
</html>