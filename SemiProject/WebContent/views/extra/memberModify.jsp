<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="UTF-8" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Farms - MyPage</title>
		<meta name="description" content="Blueprint: Slide and Push Menus" />
		<meta name="keywords" content="sliding menu, pushing menu, navigation, responsive, menu, css, jquery" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" type="text/css" href="../css/default.css" />
		<link rel="stylesheet" type="text/css" href="../css/component.css" />
		<script src="../js/modernizr.custom.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<style type="text/css">
body {
   margin: 0px;
   padding: 0px;
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
   height: 570px;
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

.info{
   width: 300px;
   height: 35px;
   
}

</style>
	</head>
	<body class="cbp-spmenu-push">
		<%@ include file="SideMenuBar.jsp" %>
		<div class="container">
			<div class="main" style="margin-top: 3%">
				<h2>회원정보 수정</h2><br>
		<form action="/memberModify" method="post" id="infoForm">
         <div id="contents">
            <div style="margin-left: 15%; margin-top: 5%;">
               <div class="form-group">
                   <label for="이름" style="float: left;">이름 : </label>
                   <input type="text" readonly class="form-control" style="width: 350px; margin-left: 15%;" name="mName" value="${member.mName}">
               </div>
               <div class="form-group">
                   <label for="아이디" style="float: left;">아이디 : </label>
                      <input type="text" readonly class="form-control" style="width: 350px; margin-left: 15%;" name="mId" value="${member.mId}">
               </div>
               <div class="form-group">
                   <label for="비밀번호" style="float: left;">비밀번호 : </label>
                      <input type="password" id="pwd1" class="form-control" style="width: 350px; margin-left: 15%;" name="mPwd" placeholder="비밀번호를 입력해주세요">
               </div>
               <div class="form-group">
                   <label for="비밀번호확인" style="float: left;">비밀번호 확인 : </label>
                   <input type="password" id="pwd2" class="form-control" style="width: 350px; margin-left: 15%;" placeholder="비밀번호 확인">
               </div>
               <div class="form-group">
                      <div class="alert alert-success" id="alert-success" style="width: 350px; margin-left: 15%;">비밀번호가 일치합니다.</div> 
                      <div class="alert alert-danger" id="alert-danger" style="width: 350px; margin-left: 15%;">비밀번호가 일치하지 않습니다.</div>
               </div>
                    <div class="form-group">
               <label for="주소" style="float: left;">주소 : </label>
               <table style="margin-left: 8%;">
                  <tr>
                     <td width="50">
                        <input type="text" name="mAddress1" readonly id="sample4_postcode" placeholder="우편번호" class="form-control" style="width: 210px; margin-left: 15%;" value="${member.mAddress1}">
                     </td>
                     <td width="150">
                        <input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="margin-left: -41%;">
                     </td>
                  </tr>
                  
                  <tr>
                     <td width="50">
                        <input type="text" name="mAddress2" readonly class="form-control" id="sample4_roadAddress" placeholder="도로명 주소" style="width: 350px; margin-left: 15%;" value="${member.mAddress2}">
                     </td>
                     <td width="150">
                     </td>
                  </tr>
                  <tr>
                     <td width="50">
                        <input type="text" name="mAddress3" readonly class="form-control" id="sample4_jibunAddress" placeholder="지번주소" style="width: 350px; margin-left: 15%;" value="${member.mAddress3}">
                     </td>
                     <td width="150">
                     </td>
                  </tr>
                  <tr>
                     <td width="50">
                        <input type="text" name="mAddress4" class="form-control" id="sample4_detailAddress" placeholder="상세주소" style="width: 350px; margin-left: 15%;" value="${member.mAddress4}">
                     </td>
                     <td width="150">
                     </td>
                  </tr>
                  
               </table>
               <input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
               <span id="guide" style="color:#999;display:none"></span>
               
               </div>
               <div class="form-group">
                   <label for="전화번호" style="float: left;">전화번호 : </label>
                   <input id="phoneNum" type="text" name="mPhone" class="form-control" style="width: 350px; margin-left: 15%;" maxlength="13" value="0${member.mPhone}">
               </div>
               <div class="form-group" style="margin: auto; width: 40%;">
                   <button type="button" class="btn btn-primary" style="margin: auto;" id="submitBtn">정보수정완료</button>
               </div>
               
            </div>
         </div>
      </form>
		</div>
		
		<script>
      var autoHypenPhone = function(str) {
         str = str.replace(/[^0-9]/g, '');
         var tmp = '';
         if (str.length < 4) {
            return str;
         } else if (str.length < 7) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
         } else if (str.length < 11) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
         } else {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
         }

         return str;
      }

      var phoneNum = document.getElementById('phoneNum');

      phoneNum.onkeyup = function() {
         console.log(this.value);
         this.value = autoHypenPhone(this.value);
      }
   </script>
   
   <!-- 다음 주소 API -->
   <script>
       function sample4_execDaumPostcode() {
           new daum.Postcode({
               oncomplete: function(data) {
                   var roadAddr = data.roadAddress; // 도로명 주소 변수
                   var extraRoadAddr = ''; // 참고 항목 변수
                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                       extraRoadAddr += data.bname;
                   }
                   if(data.buildingName !== '' && data.apartment === 'Y'){
                      extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   if(extraRoadAddr !== ''){
                       extraRoadAddr = ' (' + extraRoadAddr + ')';
                   }
   
                   document.getElementById('sample4_postcode').value = data.zonecode;
                   document.getElementById("sample4_roadAddress").value = roadAddr;
                   document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                   
                   if(roadAddr !== ''){
                       document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                   } else {
                       document.getElementById("sample4_extraAddress").value = '';
                   }
   
                   var guideTextBox = document.getElementById("guide");
                   if(data.autoRoadAddress) {
                       var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                       guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                       guideTextBox.style.display = 'block';
   
                   } else if(data.autoJibunAddress) {
                       var expJibunAddr = data.autoJibunAddress;
                       guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                       guideTextBox.style.display = 'block';
                   } else {
                       guideTextBox.innerHTML = '';
                       guideTextBox.style.display = 'none';
                   }
               }
           }).open();
       }
   </script>

   <!-- 비밀번호 일치 유효성 검사 -->
   <script type="text/javascript">
      $(function() {
         $("#alert-success").hide();
         $("#alert-danger").hide();
         $("input").keyup(function() {
            var pwd1 = $("#pwd1").val();
            var pwd2 = $("#pwd2").val();
            
            if (pwd1 != "" || pwd2 != "") {
               if (pwd1 == pwd2) {
                  $("#alert-success").show();
                  $("#alert-danger").hide();
                  $("#submit").removeAttr("disabled");
               } else {
                  $("#alert-success").hide();
                  $("#alert-danger").show();
                  $("#submit").attr("disabled", "disabled");
               }
            }
         });
      });
   </script>
   
   <!-- 비밀번호 유효성 검사 -->
   <script>
      $("#submitBtn").click(function() {
          var pwd1= $("#pwd1").val();
          var num = pwd1.search(/[0-9]/g);
          var eng = pwd1.search(/[a-z]/ig);
          var spe = pwd1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

          if(pwd1.length < 8 || pwd1.length > 20){

           alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
           return false;
          }else if(pwd1.search(/\s/) != -1){
           alert("비밀번호는 공백 없이 입력해주세요.");
           return false;
          }else if(num < 0 || eng < 0 || spe < 0 ){
           alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
           return false;
          }else {
            alert("정보 수정이 완료되었습니다.");
            $("#infoForm").submit();
             return true;
          } 
      });
   </script>
	</body>
</html>
