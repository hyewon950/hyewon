<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../css/allCss.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <title>검색결과</title>
    <style>
    body{
font-family: 'Nanum Gothic', sans-serif;
}
        a{
        	color : black;
        }
        a:hover{
        	color : black;
        	text-decoration: none;
        }
        a:viste{
        	color : black;
        }
        .container {
            padding: 10px;
        }

        .container>h3 {
            color: darkturquoise;
        }

        #test {
            height: 200px;
        }

        #content_no {
            width: 20%;
        }

        #content_sub {
            width: 55%;
        }

        #content_writer {
            width: 10%;
        }
		#content_date {
            width: 15%;
        }
        input {
            display: inline-block;
            margin-left: auto;
            margin-right: 5px;
        }
        #carouselExampleControls{
            background-color: gray;
        }
    </style>
</head>

<body>
	<jsp:include page="/views/extra/header.jsp"/>
    <header>
    </header>
    <section>
        <div class="container">
            <h4>${postKinds }게시판 검색결과</h4>
            <br>
            <hr>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th id="content_no">글 번호</th>
                        <th id="content_sub">글 제목</th>
                        <th id="content_writer">작성자</th>
                        <th id="content_date">작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pageData.pageList }" var="view" varStatus="i">
						<tr>
							<td id="content_no"><c:out value="${view.postNo }" /></td>
							<td id="content_sub"><a href="/communityContent?postNo=${view.postNo}&postKinds=${view.postKinds}"><c:out value="${view.postSubject }" /></a></td>
							<td id="content_writer"><c:out value="${view.postWriter}" /></td>
							<td id="content_date"><c:out value="${view.postRegDate }" /></td>
						</tr>
			</c:forEach>
                </tbody>
            </table>
            <div id="searchArea">
                <form action="/searchCommunity" style="display:block; width : 70%; float:left;">
                    <select name = "searchOption">
                        <option>제목</option>
                        <option>제목+내용</option>
                        <option>작성자</option>
                    </select>
                    <input type="text" name ="searchKey">
                    <input type="hidden" name ="postKinds" value="${postKinds }">
                    <input class="button" type="submit" value="검색">
                    
                </form>
               <c:choose>
                <c:when test="${pageData.pageList[0].postKinds eq '레시피'}">
                	<button class="button"style="margin-left:auto; margin-right:150; display:block;"><a href="/views/community/RecipeWrite.jsp">글쓰기</a></button>
                </c:when>
                <c:otherwise>
                	<button class="button"style="margin-left:auto; margin-right:150; display:block;"><a href="/views/community/communityWrite.jsp">글쓰기</a></button>
                </c:otherwise>
                </c:choose>
            </div>
            <div class="justify-content-center">
                <ul class="pagination justify-content-center" style="clear:both;">
                    ${pageData.pageNavi}
                </ul>
            </div>
        </div>
    </section>
    <jsp:include page="/views/extra/footer.jsp" />
</body>
</html>