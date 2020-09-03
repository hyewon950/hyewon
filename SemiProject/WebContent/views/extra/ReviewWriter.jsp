<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
body {
   margin: 0px;
   padding: 0px;
}
.head{
        
    }

#wrapper {
   width: 1200px;
   padding: 10px;
   position: absolute;
   top: 130px;
   left: 50%;
   margin-left: -538px;
}

#sidebar {
   width: 220px;
   float: left;
   padding: 10px;
}

#contents {
   border: 1px solid #dfe1e5;
   border-radius: 10px;
   width: 920px;
   height: 500px;
   float: left;
   padding: 10px;
   margin-left: 10px;
   margin-top: 1%;
}

.logo {
   font-size: 50px;
   /*text-shadow: 0 0 10px #666;*/
   color: #01DFA5;
   margin-top: 20px;
   margin-left: 100px;
   text-align: left;
   /*text-transform: capitalize;*/
}

ul {
   list-style-type: none;
   margin: 0;
   padding: 0;
   width: 200px;
   background-color: #01DFA5;
   line-height: 5em;
   text-align: center;
}

li a {
   display: block;
   color: #000;
   padding: 8px 16px;
   text-decoration: none;
}

li a.active {
   background-color: #660099;
   color: white;
}

li a:hover:not(.active) {
    background-color: #660099;
    color: white;
    text-decoration: none;
    border-radius: 10px;
}


.info {
   width: 300px;
   height: 35px;
}
</style>
</head>
<body>
   <header>
      <h1 class="logo">Farm's</h1>
   </header>

   <div id="wrapper">
      <div id="sidebar">
         <ul style="border: 1px solid #dfe1e5; border-radius: 10px;">
            <li><a href="/myInfo?mId=${sessionScope.member.mId}">회원정보 조회</a></li>
            <li><a href="memberModify.jsp">회원정보 수정</a></li>
            <li><a href="ReviewWriter.jsp">리뷰작성</a></li>
            <li><a href="searchBasket.jsp">장바구니 조회</a></li>
            <li><a href="searchBuy.jsp">구매내역 조회</a></li>
            <li><a href="MemberDelete.jsp">회원탈퇴</a></li>
         </ul>
      </div>
      <form action="#" method="post" id="infoForm">
         <div id="contents">
            <div style="margin-left: 10%; margin-top: 6%;">
               <span class="head"> Review </span>
               <hr>
               <select style="margin-left: 75%;">
                     <option>평점</option>
                     <option>매우 좋음</option>
                     <option>좋음</option>
                     <option>중간</option>
                     <option>나쁨</option>
                     <option>매우 나쁨</option>
               </select> <br>
               <textarea id="r_Contnets" style="resize: none;" rows="13" cols="95"placeholder="리뷰하실 내용을 입력해주세요"></textarea>
               <br><br>
               <div style="margin-bottom: 10%; margin-right: 15%;">
                     <center>
                        <input type="button" id="submitBtn" class="btn btn-primary" value="작성하기">
                        <input type="reset" class="btn btn-default" value="취소" style="margin-left: 1%;">
                     </center>
               </div>
            </div>
            
         </div>
                  
      </form>
   </div>
   <script>
      
      $("#submitBtn").click(function() {
        var result = confirm("작성하시겠습니까?");
          if(result){
              alert("리뷰 작성이 완료되었습니다.");
              $("#infoForm").submit();
          }
               
          
         
      });
   
   </script>

</body>

</html>