<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="community.model.vo.*"%>%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <title>공동구매 게시글</title>
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

        .button_wrapper {
            text-align: right;
        }

        #content_no {
            width: 20%;
        }

        #content_sub {
            width: 60%;
        }

        #content_writer {
            width: 20%;
        }

        #content_contoller {
            width: 20%;
        }
        ul{
            margin-left: 30px;
        }
        li {
            list-style: none;
            /* 불릿없앰*/
            display: inline-table;
            /* 테이블스타일로배치*/
            padding: 10px;
            /* 안여백은각각10px로*/
        }
        img{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    <header>
    </header>
    <section>
        <div class="container">
            <h3>공동구매 게시판</h3>
            <hr>
            <h>제목 : 마늘 공동구매합니다!</h2>
            
            <h6>글번호 : 121 &nbsp;&nbsp; 작성자 : 아무리생강캐도난마늘 &nbsp;&nbsp; 작성일 2020-05-25</h6>
               <hr>
            
            <article>
                <p>
                한국인의 대표 식재료 마늘!! 마늘 공동구매하실 분들 찾습니다! 댓글 달아주세요!
                </p>
            </article>
         
            
            <hr>
            <div class="button_wrapper">
                <button>추천하기</button>
                <button><a href="/modifyCommunity?postNo=2">글수정</a></button>
                <button><a href="/deleteCommunity?postNo=8">글삭제</button>
            </div>
            <hr>
            <div class="comment" style="margin-top:10px;">
                <form>
                    <textarea rows="3" style="float:left; width:80%; margin-left: 80px;"></textarea>
                    <input class="btn-lg" type="submit" value="등록하기" style="margin:5px;">
                </form>
            </div>
            <br>
            <hr>
            <table class="table">
                <thead>
                    <tr>

                        <th id="content_sub">글 내용</th>
                        <th id="content_writer" colspan="2">작성자</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>

                        <td id="content_sub">글 내용</td>
                        <td id="content_writer">작성자</td>
                        <td id="content_contoller">
                            <button>댓글수정</button>
                            <button>댓글삭제</button>
                        </td>
                    </tr>
                    <tr>

                        <td id="content_sub">글 내용</td>
                        <td id="content_writer">작성자</td>
                        <td id="content_contoller">
                            <button>댓글수정</button>
                            <button>댓글삭제</button>
                        </td>
                    </tr>
                    <tr>

                        <td id="content_sub">글 내용</td>
                        <td id="content_writer">작성자</td>
                        <td id="content_contoller">
                            <button>댓글수정</button>
                            <button>댓글삭제</button>
                        </td>
                    </tr>
                    <tr>

                        <td id="content_sub">글 내용</td>
                        <td id="content_writer">작성자</td>
                        <td id="content_contoller">
                            <button>댓글수정</button>
                            <button>댓글삭제</button>
                        </td>
                    </tr>
                    <tr>

                        <td id="content_sub">글 내용</td>
                        <td id="content_writer">작성자</td>
                        <td id="content_contoller">
                            <button>댓글수정</button>
                            <button>댓글삭제</button>
                        </td>
                    </tr>
                    <tr>

                        <td id="content_sub">글 내용</td>
                        <td id="content_writer">작성자</td>
                        <td id="content_contoller">
                            <button>댓글수정</button>
                            <button>댓글삭제</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </section>
    <footer>
    </footer>
</body></html>
