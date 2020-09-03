	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	

<!DOCTYPE html >

<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../../resources/css/usedBoard/assets/css/main.css" />
                	 <!-- 합쳐지고 최소화된 최신 CSS -->
       		<script src="../../../resources/css/camping/assets/js/jquery.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/jquery.dropotron.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/jquery.scrolly.min.js"></script>
       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- 부가적인 테마 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
		<!--폰트어썸-->
    	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" rel="stylesheet">
    
    	<!-- 부트스트랩 -->
   		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> 
       <link href="https://fonts.googleapis.com/css2?family=Song+Myung&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
    <title>글쓰기</title>
    <style>
    
        button {
            float: right;
        }
    
    </style>
    
    
    
     <meta charset="utf-8">
        <title>게시글 수정 페이지</title>

     <script src="/resources/ckeditor/ckeditor.js"></script>
</head>

<body>

    <div class="container"  style="font-family: 'Song Myung';font-size: 25px">
     <jsp:include page="../common/menuBar.jsp"></jsp:include>
        <form id="form_data" method="POST">
        <input type="hidden" name="usedNo" id="usedNo"  value="${usedBoard.usedNo}"/>
        <input type="hidden" name="usedStatus" value="${usedBoard.usedStatus}"/>
 
            <table class="table table-bordered" style="font-family: 'Song Myung';font-size: 20px">
                <thead>
                    <p>게시물 수정</p>
            
                    <br>
                    
                </thead>
                <tbody>
                <tr>
                        <th>제목 : </th>
                        <td><input type="text" name="usedTitle" id="usedTitle" class="form-control" placeholder="제목을 입력해주세요."></td>
                    </tr>
                	<tr>
                        <th>조회 수 : </th>
                        <td><input type="text" name="usedCount" id="usedCount" class="form-control" value="${usedBoard.usedCount}" readonly></td>
                    </tr>
                    <tr>
                        <th>제목 : </th>
                        <td><input type="text" name="usedTitle" id="usedTitle" class="form-control" value="${usedBoard.usedTitle}" placeholder="제목을 입력해주세요."></td>
                    </tr>
                    <tr>
                        <th>작성자 : </th>
                        <td><input type="text" name="usedWriter" id="usedWriter" class="form-control" value="${loginUser.mId}" placeholder="작성자"readonly></td>
                    </tr>
                    <tr>
                        <th>지역 : </th>
                        <td ><input type="text" name="usedArea" id="usedArea" class="form-control" value="${usedBoard.usedArea}" placeholder="지역을 입력해주세요."></td>
                    </tr>
                    <tr>
                        <th>판매완료 여부 : </th>
                        <td>
                        	<select name="usedYn" style="font-family: 'Song Myung'; font-size: 20px;">
                        		<option value="Y" ${usedBoard.usedYn == 'Y' ? 'selected': ''}>판매완료</option>
                        		<option value="N" ${usedBoard.usedYn == 'N' ? 'selected': ''}>판매중</option>
                        	</select>
						</td>
                    </tr>
                    
                    
                    <tr>
                        <th>내용 : </th>
                        <td><form>
            <textarea name="usedContent" id="editor1" rows="10" cols="80">
            ${usedBoard.usedContent}
                내용을 입력하세요.
            </textarea>
             <script>
            	var ckditor_config={
            			resize_enaleb : false,
            			enterMode:CKEDITOR.ENTER_BR,
            			filebrowserUploadUrl:"fileupload.do"
            	};
                // Replace the <textarea id="editor1"> with a CKEditor 4
                // instance, using default configuration.
                CKEDITOR.replace( 'editor1',ckditor_config);
                
                $("#usedYn").change(function(){
                    var selop =  $(this).val();
                    selop.val() == "Y";
                    
                })


                
                
            </script> 
           
           
 
        </form></td>
                    </tr>
                    
                </tbody>
            </table>

            <br>
            
            <a href="ulist.do"><button type="button" class="btn btn-secondary" style="font-family: 'Song Myung'; font-size: 20px">>목록으로</button></a>
            
        	<c:url var="useNo" value="udelete.do">
        		<c:param name="usedNo" value="${usedBoard.usedNo}" />
        	</c:url>
        	<a href="${useNo}"><button type="button" class="btn btn-secondary" style="font-family: 'Song Myung'; font-size: 20px">>삭제하기</button></a>
        	
        	
            <c:url var="useNo" value="uModify.do">
        		<c:param name="usedNo" value="${usedBoard.usedNo}" />
        	</c:url>
        	<a href="${useNo}"><button type="submit" class="btn btn-info" style="font-family: 'Song Myung'; font-size: 20px; bg-color:#b1ddab">>수정하기</button>



 <hr>
     <%--    <h2>댓글목록</h2>
        <ul class="replyList">
        </ul>

        <input type="hidden" name="usedNo" value="${param.usedNo}"/>
        <textarea name="usedRContent" cols="30" rows="10"></textarea>
        <input type="button" name="replyBtn" value="답글등록">

        <script src="/resources/js/jquery.min.js"></script>
        <script>
   
        
         $(document).ready(function () {
        		var usedNo = $('#usedNo').val();

            function replyList() {
                $.ajax({
                    url: "replyList.do",
                    data: {'usedNo': usedNo},
                    success: function (response) {
                        var str = '';
                        $.each(response.list, function (idx, vo) { 
                             str += '<li style="line-height: 250%;" commentNo=' + vo.commentNo + '>[' + vo.usedRId +'] '+ vo.usedRContent;
                             str += '<span style="display:none; text-align:left;padding-left:50px;">';
                             str += '<button class="deleteReply" data-comment-no=' + vo.commentNo + '>' + vo.commentNo + '-삭제</button>';
                             str += '</span>';
                             str += '</li>';
                        });
                        $('.replyList').html(str);
                    }, 
                    error: function (response) {
                        debugger
                    }
                });
            }

            replyList();

            $(document).on('mouseleave', '.replyList li', function() {
                $(this).find('span').css({'display':'none'});
            })
            $(document).on('mouseenter', '.replyList li', function() {
                $(this).find('span').css({'display':'inline-block'});
            }) 

//----------------------------------------------------------------------------
// 댓글 삭제
            $(document).on('click', '.deleteReply', function() {
                var commentNo = $(this).data('commentNo');
                if(commentNo == '') {
                    alert('댓글 번호가 없습니다');
                    return;
                }
                var conf = confirm('댓글 삭제할래요?');
                if(conf) {
                    $.ajax({
                        type: "post",
                        url: "deleteUsedReply.do",
                        data: {'usedNo': $('[name="usedNo"]').val(), 'commentNo': commentNo},
                        success: function (response) {
                            alert(response.MESSAGE);    
                            replyList(); 

                        },
                        error: function(response) {
                            alert('error');
                        }
                    });
                    //  end ajax
                }

            })

//-------------------------------------------------------------------------
// 댓글 등록
            $('[name="replyBtn"]').on('click', function() {
                if( $('[name="usedRContent"]').val() == '') {
                    alert('댓글 내용이 없습니다');
                    return;
                }
                if( $('[name="usedNo"]').val() == '') {
                    alert('글 번호가 없습니다');
                    return;
                }
                $.ajax({
                    type: "post",
                    url: "/insertUsedReply.do",
                    data: {'usedNo': $('[name="usedNo"]').val(), 'usedRContent': $('[name="usedRContent"]').val()},
                    success: function (response) {
                        alert(response.MESSAGE);
                        replyList();
                    }, 
                    error: function(response) {
                        alert('error');
                    }
                });

                // 댓글 입력부분 초기화
                $('[name="usedRContent"]').val('');
            });
            

        });
        </script> --%>
        

        		<footer id="footer">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-12">

						<!-- About -->
						<section>
							<h2 class="major">
								<span>What's this about?</span>
							</h2>
							<p>
								This is <strong>TXT</strong>, yet another free responsive site
								template designed by <a href="http://twitter.com/ajlkn">AJ</a>
								for <a href="http://html5up.net">HTML5 UP</a>. It's released
								under the <a href="http://html5up.net/license/">Creative
									Commons Attribution</a> license so feel free to use it for whatever
								you're working on (personal or commercial), just be sure to give
								us credit for the design. That's basically it :)
							</p>
						</section>
					</div>
					<div class="col-12">

						<!-- Contact -->
						<section>
							<h2 class="major">
								<span>Get in touch</span>
							</h2>
							<ul class="contact">
								<li><a class="icon brands fa-facebook-f" href="#"><span
										class="label">Facebook</span></a></li>
								<li><a class="icon brands fa-twitter" href="#"><span
										class="label">Twitter</span></a></li>
								<li><a class="icon brands fa-instagram" href="#"><span
										class="label">Instagram</span></a></li>
								<li><a class="icon brands fa-dribbble" href="#"><span
										class="label">Dribbble</span></a></li>
								<li><a class="icon brands fa-linkedin-in" href="#"><span
										class="label">LinkedIn</span></a></li>
							</ul>
						</section>
					</div>
				</div>
				<!-- Copyright -->
				<div id="copyright">
					<ul class="menu">
						<li> Untitled. All rights reserved</li>
						<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</div>
		</footer>
		</form>
	</div>



   </body>
   </html>