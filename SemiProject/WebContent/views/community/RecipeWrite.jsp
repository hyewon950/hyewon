<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        div {
           /* border: 1px solid black;*/
        }

        hr {
            border: solid 1px lightgray;
        }

        .container {
            padding: 10px;
        }

        .container>form>h3 {
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

        ul {
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

        img {
            width: 100%;
            height: 100%;

        }
        body{
        font-family: 'Nanum Gothic', sans-serif;
        }
    </style>
</head>

<body>
<jsp:include page="/views/extra/header.jsp"/>
    <header>
    </header>
    <section>
        <div class="container" style="margin:auto">
            <form action="/recipeWrite" method="post" enctype="multipart/form-data">
                <h3>레시피게시판</h3>
                <hr>
                <label>
                    <h3>글 제목</h3>
                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name ="recipeTitle" placeholder="글제목을 입력해주세요" style="width:70%; height : 5%; display: inline-block;">
                <br>
                <hr>
                <section>
                    <div class="row" style="margin:auto;height:300px; ">
                        <div class="col-4" style="text-align : center;padding-bottom:20px;">
                            <div id="img-box" style="width:70%;height:70%; margin: 30px auto;">
                                <img src="/img/logo.png" style="height:200px;weight:200px;" />
                                <br>
                                <button style="margin-top:10px;" class="btn btn-success" id="remove">취소</button>
                            </div>
                            <br>
                            <input  style="display:block;" type="file" accept="image/png, image/jpeg" name="imageUpload" id="image">

                        </div>
                        <div class="col-8" style="padding:30px;">
                            <h3>요리설명</h3>
                            <div>
                                <textarea class="form-control" name="content" style="width:100%;" rows="3" placeholder="요리의 설명을 입력해주세요"></textarea>
                            </div>
                            <h3 style="margin-top:30px;">재료</h3>
                            <div>
                                <textarea class="form-control" name = "step0" style="width:100%;" rows="3" placeholder="재료를 입력해주세요"></textarea>
                            </div>
                        </div>
                    </div>

                </section>
                <br>
                <br>
                 <br>
                 <br>
                 <br>
                <hr>
                <div id="wrapper">
                    <div style="padding:30px" id="step">
                        <h3>단계1</h3>
                        <textarea class="form-control" style="width:70%;" rows="5" name="step1"></textarea>
                        <br>
                    </div>

                    <div style="padding:30px">
                        <button class="button btn-dark" id="plusbutton" style="">+</button>&nbsp;&nbsp;
                        <button class="button btn-dark" id="minusbutton" >&ndash;</button>
                    </div>
                    <br>
                    <br>
                    <br>
                    <br>
                    <button class="button" type="submit" style="width:200px;display:block;margin:0 auto;">작성하기</button>
                </div>
                <hr>
            </form>
        </div>
    </section>
    <footer>
    </footer>
    <script>
        /*function plus(){
                            $("#step").children("div").eq(0).after("");
                        }*/
        var count = 0;
        var step = 2;
        $(document).ready(function() {});
        $("#plusbutton").click(function(e) {
            e.preventDefault();
            if(count<6){
            	$("#wrapper").children("div").eq(count).after(
                        "<div style='padding:30px' id='step'><h3>단계" + (step) + "</h3><textarea class='form-control' name=" + "'step" + (step) + "' style='width:70%;' rows='5'></textarea> <br></div>");
            	console.log($("#wrapper").children("div").eq(count).children("textarea").eq(step-1).attr("name"));    
            	count++;
                    step++;
           
            }else{
            	alert("단계를 더 늘릴수 없습니다.");
            	
            }
            
        });
        $("#minusbutton").click(function(e) {
            e.preventDefault();
            if (count == 0) {
                alert("단계1에서는 더 줄일수 없습니다.");
            } else {
                $("#wrapper").children("div").eq(count).remove();
               	count--;
                step--;
            }

        });
        $('#image').on('change', function() {

            ext = $(this).val().split('.').pop().toLowerCase(); //확장자

            //배열에 추출한 확장자가 존재하는지 체크
            if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                resetFormElement($(this)); //폼 초기화
                window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
            } else {
                file = $('#image').prop("files")[0];
                blobURL = window.URL.createObjectURL(file);
                $('#img-box img').attr('src', blobURL);
                $('#img-box').slideDown(); //업로드한 이미지 미리보기 
                $(this).slideUp(); //파일 양식 감춤
            }
        });
        $('#remove').click(function(e) {
            e.preventDefault();
            $("#image").val("");
            $('#img-box img').attr('src', '/img/logo.png');
        });
    </script>
</body>
</html>