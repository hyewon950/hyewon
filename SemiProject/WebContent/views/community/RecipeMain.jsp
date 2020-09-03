<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <title>레시피 게시판</title>
    <style>
        div {
            border: 1px solid black;
        }

        hr {
            border: solid 1px lightgray;
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
            width: 60%;
        }

        #content_writer {
            width: 10%;
        }
		/* 데이트추가 */
		#content_date {
            width: 10%;
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
    <header>
    </header>
    <section>
        <div class="container">
            <h3>레시피</h3>
            <hr>
            
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" style="padding: 0 100;">
                    <div class="carousel-item active" id="test">
                        <h3>BEST STORY1</h3>
                        <figure>
                            <img src="img/tom.jpg" width="300" height="150" style = "float:left">
                            <figcaption style="font-size : 20px;"><b>에그인헬 만들기</b></figcaption>
                            <article>에그인헬을 만들어봅시다.<br>어떻게 만들 수 있을까요</article>
                        </figure>
                        
                        
                    </div>
                    <div class="carousel-item" id="test">
                        <h3>BEST STORY2</h3>
                        <figure>
                            <img src="img/pap.jpg" width="300" height="150" style = "float:left">
                            <figcaption style="font-size : 20px;"><b>피망 샐러드를 만들어봅시다.</b></figcaption>
                            <article>맛있는 파프리카입니다.<br>정말 맛있는 파프리카입니다.</article>
                        </figure>
                    </div>
                    <div class="carousel-item" id="test">
                        <h3>BEST STORY3</h3>
                        <figure>
                            <img src="img/sal.jpg" width="300" height="150" style = "float:left">
                            <figcaption style="font-size : 20px;"><b>맛있는 샐러드</b></figcaption>
                            <article>맛있는 샐러드입니다.<br>정말 맛있는 샐러드입니다.</article>
                        </figure>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <br>
            <hr>
        </div>
        <div class="container">
            <h4>레시피 게시판</h4>
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
                    <c:forEach items="${pageData.pageList }" var="recipe" varStatus="i">
						<tr>
							<td id="content_no"><c:out value="${recipe.postNo }" /></td>
							<td id="content_sub"><a href="/communityContent?postNo=${recipe.postNo}&postKinds=${recipe.postKinds}"><c:out value="${recipe.postSubject }" /></a></td>
							<td id="content_writer"><c:out value="${recipe.postWriter}" /></td>
							<td id="content_date"><c:out value="${recipe.postRegDate }" /></td>
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
                    <input type="hidden" name ="postKinds" value="${pageData.pageList[0].postKinds}">
                    <input type="submit" value="검색">
                    
                </form>
                <button class=""style="margin-left:auto; margin-right:150; display:block;"><a href="/views/community/RecipeWrite.jsp">글쓰기</a></button>
            </div>
            <div class="justify-content-center">
                <ul class="pagination justify-content-center" style="clear:both;">
                    ${pageData.pageNavi}
                </ul>
            </div>
        </div>
    </section>
    <footer>
    </footer>
</body>
</html>