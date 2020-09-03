<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 Q&A 작성</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    
    <link rel="stylesheet" href="../../css/allCss.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"rel="stylesheet" >

    <style>
    body {
     font-family: 'Nanum Gothic', sans-serif;
    }
        .head {
            font-size: 30px;
            color: deepskyblue;
        }
        .line {
            border: 0.5px solid lightgray;
            background: lightgray;
        }
    </style>
</head>

<body>
    <header>
	<jsp:include page="/views/extra/header.jsp"/>
    </header>

    <section>
        <div class="container">
            <span class="head">
                상품 Q&A 작성
            </span>
            
            <br>
            <div class="line"></div><br><br>

            <div class="body">

                <form action="/qnaSaleWrite?saleNo=${saleNo }" method="post">
                    <div class="col-sm-2 col-md-2">
                        <label for="Q_Title" style="font-size: 18px;">제목</label>
                    </div>
                    <div class="col-sm-10 col-md-10">
                        <input type="text" id="Q_Title" name="qTitle" size="100px;" placeholder="제목을 입력해주세요">
                    </div>

                    <br><br>
                    <div class="col-sm-2 col-md-2">
                        <label for="Q_CONTENTS" style="font-size: 18px;">내용</label>
                    </div>
                    <div class="col-sm-10 col-md-10">
                        <textarea id="Q_Contents"  name="qContents" rows="20" cols="100" placeholder="문의하실 내용을 입력해주세요"></textarea>
                    </div>

                    <br><br>

                    <div class="col-sm-12 col-md-12">
                        <center>
                        <input type="submit" id="submitBtn" class="button" value="작성하기" style="font-size: 16px;">
                            &nbsp;
                        <input type="reset" class="button" value="취소" style="font-size: 16px;">
                            </center>
                    </div>


                </form>

            </div>

        </div>



        <br><br><br>

    </section>

    <footer>
	<jsp:include page="/views/extra/footer.jsp"/>
    </footer>
</body>
</html>