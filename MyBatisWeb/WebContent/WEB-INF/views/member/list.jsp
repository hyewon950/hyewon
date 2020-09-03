<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">

<title>멤버 목록</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-condensed">
					<colgroup>
						<col width="80" align="center">
						<col width="200">
						<col width="200">
						<col width="300">
						<col width="200">
						<col width="400">
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>멤버ID</th>
							<th>이름</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>주소</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${ members eq null || empty members }">
								<tr>
									<td colspan="6" align="center">등록된 정보가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${members }" var="member" varStatus="status">
									<tr>
										<td>${status.count }</td>
										<td>${member.userId }</td>
										<td><a href="memberDetail.do?id=${member.userId}">${member.userName }</a></td>
										<td>${member.email }</td>
										<td>${member.phone }</td>
										<td>${member.address }</td>
										<td>
										<a class="btn btn-xs btn-warning" href="memberModify.do?id=${member.userId }">UPDATE</a>

										</td>
										<td>
										<a class="btn btn-xs btn-danger" href="deleteMember.do?id=${member.userId }">DELETE</a>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>

				</table>
			</div>
		</div>
	</div>
</body>
</html>