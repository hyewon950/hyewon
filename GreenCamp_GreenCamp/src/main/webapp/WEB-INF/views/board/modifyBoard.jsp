<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 작성</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="../../../../resources/css/nav.css" />
<style>
#btn1, #btn2 {
	float: right;
	background: #b1ddab;
}

#btn1:hover, #btn2:hover {
	background: #9dcc97;
}

#main {
	background: #fff;
	border-top: solid 5px #b1ddab;
	/*        border-bottom: solid 5px #c1cac5;*/
	border-top-width: 35px;
	/*        border-bottom-width: 10px;*/
	padding: 6em 0 6em 0;
}

#header .myPage {
	position: relative;
	text-align: center;
	border-top: solid 5px #e7eae8;
	top: 0.65em;
}

#header .myPage div {
	background: #fff;
	position: relative;
	display: inline-block;
	padding: 0 1.5em 0 1.5em;
	top: -1.5em;
}

#header .myPage h1 {
	display: inline;
	color: #787777;
}

#sl {
	position: relative;
	bottom: 40px;
	right: 50px;
}

#fileName {
	position: relative;
	left: 3px;
}

#btn1 {
	position: relative;
	left: 5px;
}
</style>

</head>
<body>
	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	<br>
	<br>


	<header id="header">
		<div class="myPage">
			<div>
				<h1 id="BoardName">게시글 작성</h1>
			</div>
		</div>
	</header>
	<br>

	<section id="main">
		<div class="container">
			<form id="form_data" method="POST" action="updateBoard.do">
				<table class="table table-bordered">
					<thead>
						<input type="hidden" name="bType" value="${selectOneBoard.bType }" />
						<input type="hidden" name="bNo" value="${selectOneBoard.bNo }" />
						<br>

					</thead>
					<tbody>
						<tr>
							<th>제목 :</th>
							<td><input type="text" name="bTitle" id="bTitle"
								class="form-control" value="${selectOneBoard.bTitle }"></td>
						</tr>
						<tr>
							<th>작성자 :</th>
							<td>${selectOneBoard.mId }</td>
						</tr>
						<tr>
							<th>내용 :</th>
							<td><textarea cols="60" rows="10" name="bDetail"
									id="bDetail" class="form-control">${selectOneBoard.bDetail }</textarea></td>
						</tr>
						<!-- <tr>
                        <th>첨부 파일 </th>
                        <td><button type="button" style="float:left;">업로드</button>
                        <input type="text" id="fileName">
                        
                        </td>
                    </tr> -->
					</tbody>
				</table>

				<br>
				<button type="submit" class="btn btn-info" id="btn1">수정하기</button>
				<button type="button" class="btn btn-secondary" id="btn2">목록으로</button>

			</form>
		</div>

	</section>
<script>
	$("#btn2").click(function(){
		window.history.back();
	})
</script>

	<!--<script>
        $(document).ready(function() {
            $('#form_data').submit(function(e) {
                e.preventDefault();
                $.ajax({
                    type: 'POST',
                    url: 'http://wamp서버ip주소:80/test/notice_board/insert',
                    data: $(this).serialize(),
                    success: function(result) {
                        if (result == "success") {
                            alert("글 쓰기 저장 성공");
                            location.replace('http://wamp서버ip주소:80/test/main')
                        } else if (result == "Fail:save") {
                            alert("글 쓰기 저장 실패...다시 시도 해주세요.");
                        } else if (result == "Fail:title") {
                            alert("제목이 없습니다. 제목을 입력하세요.");
                        } else if (result == "Fail:contents") {
                            alert("글 내용이 없습니다. 글 내용을 입력하세요.");
                        }
                    },
                    error: function(xtr, status, error) {
                        alert(xtr + ":" + status + ":" + error);
                    }
                });
            });
        });
    </script>-->
</body>
</html>