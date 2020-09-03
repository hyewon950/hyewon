<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<title>강좌 목록</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-condensed">
					<colgroup>
						<col width="80" align="center">
						<col width="100">
						<col width="30%">
						<col width="*">
						<col width="100">
						<col width="100">
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th>강좌ID</th>
							<th>강좌명</th>
							<th>강사</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
					<!-- 나는 주석이다. -->
						<c:choose>
							<c:when test="${ lectures eq null || empty lectures }">
								<tr>
									<td colspan="6" align="center">등록된 정보가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${lectures }" var="lecture" varStatus="status">
									<tr>
										<td>${status.count }</td>
										<td><a href="lectureDetail.do?id=${lecture.id }" >${lecture.id }</a></td>
										<td><a href="#">${lecture.lectureName }</a></td>
										<td>${lecture.instructor }</td>
										<td>
										<a class="btn btn-xs btn-warning" 
										href="lecturemodify.do?id=${lecture.id }">UPDATE</a>
										</td>
										<td>
										<a class="btn btn-xs btn-danger" 
										href="#">DELETE</a>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<a class="btn btn-sm" href="lectureRegister.do">등록</a>
			</div>
		</div>
	</div>
</body>
</html>