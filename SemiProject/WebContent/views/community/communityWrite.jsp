<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="community.model.vo.*"%>
<% Community community = (Community)request.getAttribute("community");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
    <head>
    <meta charset="utf-8">
        <title>커뮤니티 글 작성</title>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../../css/allCss.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  
    <style>
		#reset{
            float: right;
        }
        #submit{
            float: right;
        }
        img{
        	width: 100px;
        	height: 100px;
        }
        body{
        	font-family: 'Nanum Gothic', sans-serif;
        }
        hr {
            background-color: lightgray;
            height: 2px;
        }
    </style>
</head>
<body>

    <section>
        <div class="container">
            <span class="head">
                <h3>게시글 작성</h3>
            </span>
            <hr>
            <div class="col-sm-12 col-md-12">
                <form action="/insertCommunity" method="post" enctype="multipart/form-data">
                    <label for="subject">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
                    <input type="text" id="subject" name="subject" size="20px;" placeholder="제목을 입력해주세요">
                        <fieldset>
                            <label for="communityKind">게시판종류</label>
                            <select id="communityKind" name="communityKind">
                                <option value = "공동구매">공동구매</option>
                                <option value = "스토리">스토리</option>
                            </select>
                        </fieldset>
                        <div class = "row">
                        <div class="col-1" style="text-align : center;padding-bottom:20px;">
                            <div id="img-box" style="width:70%;height:70%; margin: 30px auto;float:right;">
                                <img src="/img/logo.png" />
                                <br>
                            </div>
                            <br>
                            <input style="display:block;" type="file" accept="image/png, image/jpeg" name="imageUpload" id="image">
                                <button style="margin-top:5px;" id="remove">&nbsp;&nbsp;취소&nbsp;&nbsp;</button>
                        </div>
                        <div class="col-1" style="text-align : center;padding-bottom:20px; margin-left:150px;">
                            <div id="img-box" style="width:70%;height:70%; margin: 30px auto;float:right;">
                                <img src="/img/logo.png" />
                                <br>
                            </div>
                            <br>
                            <input style="display:block;" type="file" accept="image/png, image/jpeg" name="imageUpload2" id="image2">
                                <button style="margin-top:5px;" id="remove2">&nbsp;&nbsp;취소&nbsp;&nbsp;</button>
                        </div>
                        <div class="col-1" style="text-align : center;padding-bottom:20px; margin-left:150px;">
                            <div id="img-box" style="width:70%;height:70%; margin: 30px auto;float:right;">
                                <img src="/img/logo.png" />
                                <br>
                            </div>
                            <br>
                            <input style="display:block;" type="file" accept="image/png, image/jpeg" name="imageUpload3" id="image3">
                                <button style="margin-top:5px;" id="remove3">&nbsp;&nbsp;취소&nbsp;&nbsp;</button>
                        </div>
                        </div>
                        <br>
                        <hr>
                    <label for="content">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</label><br>
                    <!--<textarea id="content" name="content" rows="20" cols=90%; placeholder="내용을 입력해주세요"></textarea>-->
                     <textarea id="summernote" name="editordata" class="summernote"></textarea>
                    <br>
                    <input id="reset" class="button" type="reset"></input>
                    <span class="buttonspan"><input id="submit" class="button" type="submit" value="작성하기"></span>
                    
                </form>
            </div>
        </div>
        <br><br><br>
    </section>
    <footer>
    </footer>
 <script>
      $('#summernote').summernote({
        placeholder: '내용을 작성해주세요',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['view', ['fullscreen']],
        ]
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
              $('#img-box img').eq(0).attr('src', blobURL);
              $('#img-box img').eq(0).attr('style', "width:100px;");
              $('#img-box img').eq(0).attr('style', "height:100px;");
              $('#img-box').eq(0).slideDown(); //업로드한 이미지 미리보기 
              $(this).slideUp(); //파일 양식 감춤
          }
      });
      $('#image2').on('change', function() {

          ext = $(this).val().split('.').pop().toLowerCase(); //확장자

          //배열에 추출한 확장자가 존재하는지 체크
          if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
              resetFormElement($(this)); //폼 초기화
              window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
          } else {
              file = $('#image2').prop("files")[0];
              blobURL = window.URL.createObjectURL(file);
              $('#img-box img').eq(1).attr('src', blobURL);
              $('#img-box img').eq(1).attr('style', "width:100px;");
              $('#img-box img').eq(1).attr('style', "height:100px;");
              $('#img-box').eq(1).slideDown(); //업로드한 이미지 미리보기 
              $(this).slideUp(); //파일 양식 감춤
          }
      });
      $('#image3').on('change', function() {

          ext = $(this).val().split('.').pop().toLowerCase(); //확장자

          //배열에 추출한 확장자가 존재하는지 체크
          if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
              resetFormElement($(this)); //폼 초기화
              window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
          } else {
              file = $('#image3').prop("files")[0];
              blobURL = window.URL.createObjectURL(file);
              $('#img-box img').eq(2).attr('src', blobURL);
              $('#img-box img').eq(2).attr('style', "width:100px;");
              $('#img-box img').eq(2).attr('style', "height:100px;");
              $('#img-box').eq(2).slideDown(); //업로드한 이미지 미리보기 
              $(this).slideUp(); //파일 양식 감춤
          }
      });
      
      $('#remove').click(function(e) {
          e.preventDefault();
          $("#image").val("");
          $('#img-box img').attr('src', '/img/logo.png');
      });
      $('#remove2').click(function(e) {
          e.preventDefault();
          $("#image").val("");
          $('#img-box img').attr('src', '/img/logo.png');
      });
      $('#remove3').click(function(e) {
          e.preventDefault();
          $("#image").val("");
          $('#img-box img').attr('src', '/img/logo.png');
      });
    </script>
</body></html>