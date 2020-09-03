<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>캠핑장 예약페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--메뉴바 푸터 메인 css  -->
		<link rel="stylesheet" href="../../../resources/css/camping/assets/css/main.css" />
		<link rel="stylesheet" href="../../../resources/css/nav.css" />
		<link rel="stylesheet" href="../../../resources/css/footer.css" />
	

    	 <!-- 합쳐지고 최소화된 최신 CSS -->
       		<script src="../../../resources/css/camping/assets/js/jquery.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/jquery.dropotron.min.js"></script>
			<script src="../../../resources/css/camping/assets/js/jquery.scrolly.min.js"></script>
       
       
           <!--datePicker-->
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
 		<!-- <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>-->
        <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

       <!--부트스트랩 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
         <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"/> 
    
			<!-- 폰트어썸 -->
      	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" rel="stylesheet">
        
           <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        
    <!--결제-->
<!--        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>-->
<!--        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>-->

    <style>
        
        #containbox{
            border: 1px solid lightgray;
            margin: 15px 2px 2px 100px;
            padding: 10px 20px 20px 50px;
            margin-bottom: 10px;
            padding-bottom: 20px;
             /*display:table-cell;*/
            
        }
        
        .form-group{
          /*  display: inline-block;*/
           /* text-align: center;
            float: left;*/
            margin: 2px 2px 2px 10px;
          
        }
        
        body {
          position: relative;
        }
        .container-fluid{
          /*  display:table;*/
            padding: 100px 30px 30px 0px ;
        }
       ul li{
       list-style: none;
        }
	 #bankBookBox {
        display: block;
    }
     .box1 {
 	display: none; 
	border:none;
	}
	#paySystem{
	display: none;
	margin: 20px 2px 2px 0px;
	}
    </style>

	
	<body class="is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<h1><a href="index.html" id="logo"></a></h1>
							<p>Green camp</p>
						</div>
					</div>
				</header>

			<!-- Nav -->
			
			<jsp:include page="../common/menuBar.jsp"></jsp:include>
			
			<!-- Main -->
			
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="content">

									<!-- Content -->

										<article class="box page-content">

											

				                    <section>
											
                                        <div class="container-fluid">
                                                <div class="col-md-10" id="containbox">
                                                    <form action="insertReservation.do" method="post">
                                                    <h3>${camping.cName }</h3>
                                                    
                                                    
                                                    <input type="hidden" name="cNo" value="${camping.cNo }">
                                                    <c:set var="numbercamp" value="${camping.cNo }"/>
                                                    <input type="hidden" name="mId" value="${loginUser.mId }"> <!-- 회원아이디 -->
                                                     <div class="form-group">
                                                    <label for="startDate">체크인 </label>
                                                   <input type="text" id="startDate" class="datepicker" name="startDate"  onclick="button1_click();">
                                                  </div>
                                                  <div class="form-group">
                                                    <label for="endDate">체크아웃</label>
                                                        <input type="text" id="endDate" class="datepicker" name="endDate"  onclick="button1_click();">
                                                  </div>
                                                   <div class="form-group">
                                                    <label for="name">이름</label>
                                                    <input type="text" class="form-control" id="name" name="name">
                                                  </div>
                                                  <div class="form-group">
                                                    <label for="phone">연락처</label>
                                                    <input type="text" id="tel" name="phone" class="form-control">
                                                  </div> 
                                                   <div class="form-group">
                                                    <label for="sumPeople">인원</label>
                                                     <input data-brackets-id="591" type="number"  onclick="button1_click();" name="sumPeople" id="sumPeople" min="1" max="100" step="1" value="1" style="border-color:lightgray" class="form-control">
                                                  </div>  
                                                      <div class="form-group">
                                                    <label for="sumCar">차량</label>
                                                     <input data-brackets-id="591" type="number" name="sumCar" id="number" min="1" max="100" step="1" value="1" style="border-color:lightgray" class="form-control">
                                                  </div>
                                                  <hr>
								
												<span class="sumAmount">총 결제 금액 :<span id="sumCount"></span> &nbsp;
												</span> 
												<input type="button" class="button submitBtn" value="결제하기"  onclick="showPayscreen();" style="float:right;font-size: 15px">
								                                                  
                                                      
                                                   
                                                </div>
                                                
                                                <div id="paySystem">
                                                	 <div class="col-md-10" id="containbox" >
													<div class="paySystem">
														<h5> 결제 방식</h5>
														<input type="radio" name="pay" id="bankBook"onclick="showBankbook();" checked> <label for="bankBook">무통장입금</label>
														<input type="radio" name="pay" id="card" onclick="showCard();">
														<label for="card">카드결제</label> 
														<input type="radio" name="pay"id="transfer" onclick="showTransfer();"> 
														<label for="transfer">계좌이체</label>
													</div>
													<br>
									
													<div id="bankBookBox" class="box1" >
														<ul>
															<li>예금주 : greencamp</li>
															<li>입금할 계좌번호 : 355-0601-9291-94(농협)</li>
														</ul>
													</div>
									
													<div id="cardBox" class="box1">
														<ul>
															<li><label for="bank" >은행 </label> <input type="text"
																id="bank" list="Banks" placeholder="은행 입력/선택" class="col-3 form-control" > <datalist
																	id="Banks">
																	<option value="신한"></option>
																	<option value="농협"></option>
																	<option value="우리"></option>
																	<option value="하나"></option>
																	<option value="기업"></option>
																	<option value="국민"></option>
																</datalist></li>
																<br>
															<li><label>카드번호</label> <input type="text" maxlength="4"
																size="4px;"> - <input type="text" maxlength="4"
																size="4px;"> - <input type="text" maxlength="4"
																size="4px;"> - <input type="text" maxlength="4"
																size="4px;"></li>
									
															<li><label>유효기간 </label> Month : <input type="text"
																maxlength="2" size="2px;"> &nbsp; Year : <input
																type="text" maxlength="2" size="2px;"></li>
														</ul>
													</div>


								
												<div id="transferBox" class="box1">
													<label for="bank">은행 </label> 
													<input type="text" id="bank" 
														list="Banks" placeholder="은행 입력/선택">
													
													<datalist id="Banks" >
														<option value="신한"></option>
														<option value="농협"></option>
														<option value="우리"></option>
														<option value="하나"></option>
														<option value="기업"></option>
														<option value="국민"></option>
													</datalist>
												</div>
									<!-- 			<div style="float:right;margin:0px 10px 10px 0px;"> -->
												<input type="submit" class="button submitBtn" value="결제완료하기" style="font-size: 15px; margin:0px 0px 0px 680px;">
											<!-- 	</div> -->
												</div>
												
                                                </div>
                                                 </form>
                                                
                                        </div>
                                    </section>
				                </article>
							</div>
						
					
				</div>
					
					</div>
					
                    </div>
                    
				</section>

			<!-- Footer -->
				<jsp:include page="../common/footer.jsp"></jsp:include>
		</div>

	<!--달력관련 option함수  -->
			<script>
                            
                $(document).ready(function () {
        	    $.datepicker.setDefaults($.datepicker.regional['ko']); 
        	    $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy.mm.dd",
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option" , "minDate", selectedDate );
           	      },
                //최소,최대날짜 선택 범위 D(날짜), M(달),Y(년)
                    minDate: "0D", 
                    maxDate: "+100D"
 
            });
                    
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy.mm.dd",
                 maxDate: 0,       
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 },
                 minDate: "0D", 
                maxDate: "+100D"
                
            });    
    });
                

        </script>
        <script>

        /*결제 금액 계산함  */
    	function button1_click(){ //체크인, 체크아웃, 인원수 클릭할때마다 변수에 저장함
			
			var count=$('#sumPeople').val(); //인원수 받아오고
				console.log(count);  
		
			var startDate=$('#startDate').val(); //시작날짜 받아옴
				var	startstr=startDate.replace(".","");   //string 에 .을 없애서 비교하기 위해
					var	startstr2=	startstr.replace(".","");
						var start=parseInt(startstr2);
						
			console.log(startDate);
			
			var endDate=$('#endDate').val(); //끝날짜 받아옴
				var	endstr=endDate.replace(".","");   //string 에 .을 없애서 비교하기 위해
					var	endstr2=endstr.replace(".","");
						var end=parseInt(endstr2);
			
			var day= end-start;
			
			if(count == 1){
				$('#sumCount').text("원");    //날짜를 선택할시에 span태그에 null값 들어가는것을 방지하기위해
				
			}else{
				
				$('#sumCount').text(count*15000+day*40000+" 원");
			}
		}
        
			/* 결제 방식 */
				function showBankbook() {
					var bankBook = document.getElementById("bankBook");
					if (bankBook.checked) {
						document.getElementById("bankBookBox").style.display = "block";
						document.getElementById("cardBox").style.display = "none";
						document.getElementById("transferBox").style.display = "none";
					}
				}
				
				function showCard() {
					var card = document.getElementById("card");
					if (card.checked) {
						document.getElementById("bankBookBox").style.display = "none";
						document.getElementById("cardBox").style.display = "block";
						document.getElementById("transferBox").style.display = "none";
					}
				}
				
				function showTransfer() {
					var transfer = document.getElementById("transfer");
					if (transfer.checked) {
						document.getElementById("bankBookBox").style.display = "none";
						document.getElementById("cardBox").style.display = "none";
						document.getElementById("transferBox").style.display = "block";
					}
				}   
				
				
				function showPayscreen(){
					
				var paybox=document.getElementById("paySystem");
				if(paybox.style.display = "none"){
					document.getElementById("paySystem").style.display = "block";
					}
				}
				
			
		
				
				
				
</script>
        

	</body>
</html>