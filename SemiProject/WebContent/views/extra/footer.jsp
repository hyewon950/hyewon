<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

   footer {
   background: #d9ead8;
   }
   
   .footerLogo{
   margin :0 auto;
   width: 100px;
   height: 100px;
   }
   
   .divLeftLine{
      border-right: 1px solid lightgrey;
   }
   
   footer li {
   list-style: none;
   /* 불릿없앰*/
   display: inline-table;
   /* 테이블스타일로배치*/
   padding: 10px;
   /* 안여백은각각10px로*/
}
</style>

</head>
<body>
<!-- Footer -->
<footer class="page-footer font-small mediumseagreen pt-4" >

  <!-- Footer Links -->
  <div class="container-fluid"> <!-- container-fluid :전체원할때 -->

    <!-- Grid row -->
    <div class="row">

      <!-- Grid column -->
      <div class="col-md-3 divLeftLine">
      <center>
      <img alt="로고" src="../img/bigLogo.png" class="footerLogo">
      </center>
      </div>
       <!-- Grid column -->
      <div class="col-md-5 divLeftLine">

        <!-- Content -->
        <b style="font-size: 20px;">팜스(주)</b>
        <p>  팜스는 farm + SNS의 합성어로, 신선한 농산물을 직거래하고 사용자간 네트워크를 제공하는 공간입니다.<br>
          주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F - D클래스 <br>
          Tel : 1544-9970
      </p>

      </div>
      
      <!-- Grid column -->
      <hr class="clearfix w-100 d-md-none pb-3">

      <!-- Grid column -->
      <div class="col-md-4">

        <!-- Links -->
        <b style="font-size: 20px;">팀원</b>

        <ul class="list-unstyled">
          <li>
            <a href="#!">김혜원</a>
          </li>
          <li>
            <a href="#!">박희영</a>
          </li>
          <li>
            <a href="#!">송범진</a>
          </li>
          <li>
            <a href="#!">이다은</a>
          </li>
          <li>
            <a href="#!">이두경</a>
          </li>
          <li>
            <a href="#!">이승원</a>
          </li>
          <li>
            <a href="#!">홍채은</a>
          </li>
        </ul>

      </div>
      <!-- Grid column -->


    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">
     © 2020 Copyright: 봉테일(1조) 
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->
</body>
</html>