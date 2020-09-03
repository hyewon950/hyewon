<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보조회</title>

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <style>

        .memTable {
        width: 100%;
        max-width: 100%;
        margin-bottom: 20px;
        }
        
        .memTable .tabl > thead > tr > th,
        .memTable > tbody > tr > th,
        .memTable > tfoot > tr > th,
        .memTable > thead > tr > td,
        .memTable > tbody > tr > td,
        .memTable > tfoot > tr > td {
        padding: 10px;
        line-height: 1.42857143;
        }
        
        .memTable  tr {
        vertical-align: bottom;
        border-bottom: 2px solid #ddd;
        }
        
        .memTable th {
            background: #f2f2f2;
        }
    </style>

</head>
<body>

<!--  네비바들어가는 부분-->
 <jsp:include page="../common/menuBar.jsp"></jsp:include>
<!-- 네비끝 -->

<!--시작-->
    <br>

    <header id="header">
        <div class="myPage">
            <div>
                <h1>${loginUser.mName }님 마이페이지</h1>
            </div>
        </div>
    </header>


    <!-- Main -->
    <section id="main">
        <div class="container">
            <div class="row">
                
                <!-- 마이페이지 네비바 -->
                 <jsp:include page="myPageNav.jsp"></jsp:include>
                
                <!-- 내용 -->
                <div class="col-9 col-12-medium imp-medium">
                    <div class="content">

                        <!-- Content -->

                        <article class="box page-content">

                            <header id="contentHead">
                                <b>회원 정보</b>

                            </header>



                            <section>
                                <div class="container">
                                  <table class="memTable">
                                      <tr>
                                     <th>ID</th>
                                      <td>${loginUser.mId }</td>
                                          </tr>
                                      
                                      <tr>
                                      <th>이름</th>
                                          <td>${loginUser.mName }</td>
                                      </tr>
                                      
                                      <tr>
                                      <th>생년월일</th>
                                          <td>${loginUser.mBirthday }</td>
                                      </tr>
                                      
                                      <tr>
                                      <th>이메일</th>
                                          <td>${loginUser.mEmail }</td>
                                      </tr>
                                      
                                      <tr>
                                      <th>폰번호</th>
                                          <td>${loginUser.mPhone }</td>
                                      </tr>
                                      
                                      <tr>
                                      <th>가입날짜</th>
                                          <td>${loginUser.mEnrollDate }</td>
                                      </tr>
                                      
                                  </table>
                                    
                                </div>
                                
                                <div style="text-align: center;">
                                    <a class="btn btn-secondary" href="memberDeleteView.do" role="button">탈퇴</a>
                                    <a class="btn btn-success" href="memberModifyView.do" role="button">수정</a>
                                     
                                    </div>
                            </section>



                        </article>

                    </div>
                </div>

            </div>
        </div>
    </section>


</body>
</html>