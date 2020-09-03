<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../css/allCss.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet"> 
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <style>
    /* figure로 묶인 이미지 밑에 div class=overlay를 작성  */
    /* div class overlay는 오버레이의 배경색을 담당 */
    /* div class description은 오버레이에 나타낼 글자를 담당함*/
    /* div class overlay위에 글자가 없으면 오버레이가 되지않음.*/
    figure {
    
        position: relative;
    }
    
    figure img {
        display: block;
      
    }   
    figure .overlay {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        overflow: hidden;
        width: 100%;
        height: 0;
        color: #fff;
        background: rgba(0, 0, 0, 0.6);
        -webkit-transition: .6s ease;
        transition: .6s ease;
    }
    figure .overlay .description {
        font-size: 20px;
        position: absolute;
        top: 50%;
        left: 50%;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        text-align: center;
    }
    

    figure:hover .overlay {
        display: block;
        height: 100%;
    }
    /*여기까지가 오버레이 스타일*/
    ul{
    	text-align: center;
    }
li {
            list-style: none;
            /* 불릿없앰*/
            display: inline-table;
            /* 테이블스타일로배치*/
            padding: 10px;
            /* 안여백은각각10px로*/
           margin-left : 100px;
           
        }
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

        .container>h3 {0
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
        /* 데이트추가 */
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
        th{
        	background-color: whitesmoke;
        }
    </style>
</head>

<body>
	<jsp:include page="/views/extra/header.jsp"/>
    <header>
    </header>
    <section>
        <div class="container">
            <h3>${pageData.pageList[0].postKinds}</h3>
            <hr>
            <c:if test="${pageData.pageList[0].postKinds eq '스토리'}">
             <div style="justify-content: center; text-align: center;">
             	<h3>BEST STORY</h3>
             	<br>
                    <ul class="row">
                       	<li>
                    	<div style="width:200px;height:200px;"><figure>
                        	<a href = "/communityContent?postNo=${communityList[0].postNo }&postKinds=${communityList[0].postKinds}">
	                        <c:choose>
	                    	<c:when test="${empty bestimage[0].getCookImgName()}">
	                    	<img src="/img/logo.png" width="200" height="200" style = "float:left">
	                    	BEST1
	                    	<div class="overlay">
                        		<div class="description">
                            		${communityList[0].postSubject}
                        		</div>
                    		</div>
	                    	</c:when>
	                    	
	                    	<c:when test="${not empty bestimage[0].getCookImgName()}">
	                    	<img src="/img/${bestimage[0].getCookImgName()}" width="200" height="200" style = "float:left">
	                    	BEST1
	                    	<div class="overlay">
                        		<div class="description">
                            		${communityList[0].postSubject}
                        		</div>
                    		</div>
	                    	
	                    	</c:when>
	                    	</c:choose>
	                    	
                            <%-- <figcaption style="font-size : 20px;"><c:out value="${communityList[0].postSubject}" /></figcaption> --%>
                            </a>
                        </figure></div>
                    	</li>
                    	<li>
                    	<div style="width:200px;height:200px;"><figure>
                        	<a href = "/communityContent?postNo=${communityList[1].postNo }&postKinds=${communityList[1].postKinds}">
	                        <c:choose>
	                    	<c:when test="${empty bestimage[1].getCookImgName()}">
	                    	<img src="/img/logo.png" width="200" height="200" style = "float:left"></c:when>
	                    	<c:when test="${not empty bestimage[1].getCookImgName()}">
	                    	<img src="/img/${bestimage[1].getCookImgName()}" width="200" height="200" style = "float:left">
	                    	</c:when>
	                    	</c:choose>
	                    	BEST2
	                    	<div class="overlay">
                        		<div class="description">
                            		${communityList[1].postSubject}
                        		</div>
                    		</div>
                            <%-- <figcaption style="font-size : 20px;"><c:out value="${communityList[1].postSubject}" /></figcaption> --%>
                            </a>
                        </figure></div>
                    	
                    	</li>
                		<li>
                    	<div style="width:200px;height:200px; " ><figure>
                        	<a href = "/communityContent?postNo=${communityList[2].postNo }&postKinds=${communityList[2].postKinds}">
	                        <c:choose>
	                    	<c:when test="${empty bestimage[2].getCookImgName()}">
	                    	<img src="/img/logo.png" width="200" height="200" style = "float:left"></c:when>
	                    	<c:when test="${not empty bestimage[2].getCookImgName()}">
	                    	<img src="/img/${bestimage[2].getCookImgName()}" width="200" height="200" style = "float:left">
	                    	</c:when>
	                    	</c:choose>
	                    	BEST3
	                    	<div class="overlay">
                        		<div class="description">
                            		${communityList[2].postSubject}
                        		</div>
                    		</div>
                            <%-- <figcaption style="font-size : 20px;"><c:out value="${communityList[2].postSubject}" /></figcaption> --%>
                            </a>
                        </figure></div>
                    	
                    	</li>
                    </ul>
                </div>
            <br>
            <hr>
            </c:if>
            <c:if test="${pageData.pageList[0].postKinds eq '레시피'}">
            <div style="justify-content: center; text-align: center;">
             	<h3>BEST RECIPE</h3>
             	<br>
                    <ul class="row">
                       	<li>
                    	<div style="width:200px;height:200px;"><figure>
                        	<a href = "/communityContent?postNo=${communityList[0].postNo }&postKinds=${communityList[0].postKinds}">
	                        <c:choose>
	                    	<c:when test="${empty bestimage[0].getCookImgName()}">
	                    	<img src="/img/logo.png" width="200" height="200" style = "float:left"></c:when>
	                    	<c:when test="${not empty bestimage[0].getCookImgName()}">
	                    	<img src="/img/${bestimage[0].getCookImgName()}" width="200" height="200" style = "float:left">
	                    	</c:when>
	                    	</c:choose>
	                    	BEST1
	                    	<div class="overlay">
                        		<div class="description">
                            		${communityList[0].postSubject}
                        		</div>
                    		</div>
                            <%-- <figcaption style="font-size : 20px;"><c:out value="${communityList[0].postSubject}" /></figcaption> --%>
                            </a>
                        </figure></div>
                    	</li>
                    	<li>
                    	<div style="width:200px;height:200px;"><figure>
                        	<a href = "/communityContent?postNo=${communityList[1].postNo }&postKinds=${communityList[1].postKinds}">
	                        <c:choose>
	                    	<c:when test="${empty bestimage[1].getCookImgName()}">
	                    	<img src="/img/logo.png" width="200" height="200" style = "float:left"></c:when>
	                    	<c:when test="${not empty bestimage[1].getCookImgName()}">
	                    	<img src="/img/${bestimage[1].getCookImgName()}" width="200" height="200" style = "float:left">
	                    	</c:when>
	                    	</c:choose>
	                    	BEST2
	                    	<div class="overlay">
                        		<div class="description">
                            		${communityList[1].postSubject}
                        		</div>
                    		</div>
                            <%-- <figcaption style="font-size : 20px;"><c:out value="${communityList[1].postSubject}" /></figcaption> --%>
                            </a>
                        </figure></div>
                    	
                    	</li>
                		<li>
                    	<div style="width:200px;height:200px; " ><figure>
                        	<a href = "/communityContent?postNo=${communityList[2].postNo }&postKinds=${communityList[2].postKinds}">
	                        <c:choose>
	                    	<c:when test="${empty bestimage[2].getCookImgName()}">
	                    	<img src="/img/logo.png" width="200" height="200" style = "float:left"></c:when>
	                    	<c:when test="${not empty bestimage[2].getCookImgName()}">
	                    	<img src="/img/${bestimage[2].getCookImgName()}" width="200" height="200" style = "float:left">
	                    	</c:when>
	                    	</c:choose>
	                    	BEST3
	                    	<div class="overlay">
                        		<div class="description">
                            		${communityList[2].postSubject}
                        		</div>
                    		</div>
                            <%-- <figcaption style="font-size : 20px;"><c:out value="${communityList[2].postSubject}" /></figcaption> --%>
                            </a>
                        </figure></div>
                    	
                    	</li>
                    </ul>
                </div>
            <br>
            <hr>
            </c:if>
        </div>
        <div class="container">
            <h4>${pageData.pageList[0].postKinds} 게시판</h4>
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
                	 	<c:if test="${pageData.pageList[0].postKinds eq '공지사항'}"> 
                			<tr>
                				<td id="content_no"><c:out value="1" /></td>
								<td id="content_sub"><a href="/communityContent?postNo=1&postKinds=공지사항"><c:out value="★팜스 이용자 만족도 조사 이벤트★"/></a></td>
								<td id="content_writer"><c:out value="관리자" /></td>
								<td id="content_date"><c:out value="2020-06-04" /></td>
							</tr>
						</c:if>
                    <c:forEach items="${pageData.pageList }" var="story" varStatus="i">
						<tr>
							<td id="content_no"><c:out value="${story.postNo }" /></td>
							<td id="content_sub"><a href="/communityContent?postNo=${story.postNo}&postKinds=${story.postKinds}"><c:out value="${story.postSubject }" /></a></td>
							<td id="content_writer"><c:out value="${story.postWriter}" /></td>
							<td id="content_date"><c:out value="${story.postRegDate }" /></td>
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
                    <input type="submit" class="button" value="검색">
                    
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
            <div class="justify-content-center" style="text-align: center">
                <ul class="pagination justify-content-center" style="clear:both;">
                    ${pageData.pageNavi}
                </ul>
            </div>
        </div>
    </section>
    <jsp:include page="/views/extra/footer.jsp" />
</body>
</html>