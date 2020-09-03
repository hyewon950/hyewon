<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="sale.model.vo.*"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
<!doctype html>
<html>
    <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <title>productlist</title>
         <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="../../css/allCss.css">
        
        <style>
			.btn1 {  width:120px; height:60px; margin:2px;
			       border:none; margin:15px auto;
			   	  background-color:#d9ead8;
				  text-align:center; 
 				  cursor: pointer;
  				  font-weight: 700; /*글자 진하기 100 - 900*/
  				  letter-spacing: 2.5px; /*글자 간격*/
              		color:#033C00;
  				   border-radius: 15px;
  				  transition:all 0.9s, color 0.3;
   				 }
				.hover3:hover{ 
				box-shadow: 0 80px 0 0 lightgray inset,
				 0 -80px 0 0 lightgray inset;
				  } 
				.hover4:hover{ box-shadow:
				 200px 0 0 0 lightgray inset,
				 -200px 0 0 0 lightgray inset;
				  }
				  .hover3{
				  border:3px solid #d9ead8;
				  color:#033C00;
				  background-color: white;
				   }
				        	
	        hr {
	            background-color: lightgray;
	            height: 2px;
	        }
        	  font-family{
               font-family: 'Nanum Gothic', sans-serif;
        	}
         	#imgcontent img{
		/* 	position: absolute; top:0; left: 0;
			width: 85%;
			height: 100%; */
			    display:block;
  				  margin-left:auto;
  					  margin-right:auto;
			} 
			
            li{
            	display : inline-block;
            }
             .head {
                font-size: 20px;
                color: deepskyblue;
            }
            a{
                list-style-type: none;
                 display: block;
                text-decoration: none;
                color: black;
            }
            a:hover{
               text-decoration: none;
               list-style-type: none;
            }
            #menuContent:hover{
                list-style-type: none;
                 text-decoration: none;
                 background-color: #d9ead8;
            }
            .btn btn{
            background-color: #d9ead8;
            color: #d9ead8;
            }

            #menu{
                height: 50px;
                
            }
            #content{
                height: 500px;
                
            }
            #line{
                border-bottom: 0.6px solid black;
            }
            .menu{
                background-color: #F3F3F3;
                height: 60px;
            }
            /* .row div{
              float: left;
            height: 100%;
            width: 100%;
            } */

             #menuContent{
             line-height:48px;
             padding:5px 7px;
             display:block; 
              }
              
        </style>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    </head>
    <body>
        <header>
        <jsp:include page="/views/extra/header.jsp"/>
        </header>
        <section>
            
          <div class="container">
            <hr>
             <span class="head">
               <%-- <img src="${}"> --%>
            </span>
              <br>
              
              <hr>
             <div class="row" id="topcontent">
                <div class="col-md-6" id="imgcontent">
               	 <img src="productImg/${salePage.saleImgName}" width="430" height="350">
                </div>
                <div class="col-md-6" id="productContent">
                    
                        <table class="table">
                            <tr><td><p style="font-size:30px; font-weight: bold">${salePage.saleSubject}</p></td><td></td></tr>
                           <tr><td colspan="2">-${salePage.prdClass}</td></tr>
                            <tr><td colspan="2">판매자  :      ${salePage.prdBrand}</td></tr>
                            <tr><td colspan="2">${salePage.prdPrice}원</td></tr>
                            
                             <tr><td colspan="2">수량  :  <input type="number" name="prdAmount" id="number" min="1" max="100" step="1" value="1">
                             							<input type="hidden" name="prdNo" id="prdNo" value="${salePage.prdNo}">
                             </td></tr>
                             <tr><td colspan="2" style="text-align:center;"> <button class="btn1 hover3 " id="jQbtn1" onclick="action1();">장바구니</button>&nbsp;&nbsp;&nbsp;&nbsp;
                             	<button class="btn1 hover4" id="jQbtn2" onclick="action2();">구매하기</button>
                                 
                               
                                 </td>
                               </tr>
                        </table>
                      
                    </div>
              </div>
              
              
              <hr>
              
            <div class="row menu">
                
                 <div class="col-md-4 text-center" onclick="productImg();" ><a href="#imgpage" id="menuContent">상품정보</a></div>
                    <div class="col-md-4 text-center" onclick="QAList();" ><a href="#qnaList" id="menuContent">Q&A</a></div> 
                    <div class="col-md-4 text-center" onclick="reviewsList();"><a href="#reviewList" id="menuContent">구매후기(${reviwData.countNum})</a></div>  
                
               
            </div>
               <hr>
 

                <div class="col-md-12" id="productImg">
                    <a name="imgpage"></a>
                  <!--   <img src="img/tomato%EC%83%81%EC%84%B8.jpg"> -->
                <!--판매할상품상세설명이미지 넣는곳!!!!-->
                 <img src="contentImg/${salePage.saleContent}">
                </div>
                <div class="col-md-12" id="q&aList">
                    <hr>
                <div class="row menu">
                 <div  class="col-md-4 text-center" onclick="productImg();" ><a href="#imgpage" id="menuContent">상품정보</a></div>
                    <div class="col-md-4 text-center" onclick="QAList();" ><a href="#qnaList" id="menuContent">Q&A</a></div> 
                    <div class="col-md-4 text-center" onclick="reviewsList();"><a href="#reviewList" id="menuContent">구매후기(${reviwData.countNum})</a></div>
                </div>
                     <hr>
                    <a name="qnaList"></a>
                    <button class="button" onclick="location.href='/qnaForm?saleNo=${salePage.prdNo}'">Q&A작성하기</button><br><br>
                     <table class="table">
                        <a name="qnaList"></a>
 					 <tr><th>답변 상태</th><th>글번호</th><th>제목</th><th>문의자</th></tr>
 					<c:forEach items ="${pageData.salePage}" var = "comment" varStatus = "i">
                    <tr>
                    	<c:if test="${empty comment.qAnswer}" >
                    	<td>답변대기</td>
                    	</c:if>
                    	<c:if test="${not empty comment.qAnswer }" >
                    	<td>답변완료</td>
                    	</c:if>
                        <td >${comment.qnaNo}</td>
                        <td><a href="javascript:void(0)" onclick="cotitle(this, '${comment.qAnswer }')" >${comment.qTitle}</a></td>
                        <td >${comment.mId}</td>
                      </tr>
                      <tr style="display:none;"><td colspan="4" >Question :     ${comment.qContents}</td></tr>
                      <tr  style="display:none;"><td td colspan="4"  >Answer :       ${comment.qAnswer}</td></tr>
                      </c:forEach>
                        
                    </table>
					<div style="text-align: center;">
              		 	 <ul class="pagination justify-content: center;" style="display:inline-block" >
               				     ${pageData.pageNavi}
               		 	</ul>
           			</div>
                </div>
					
                <div class="col-md-12" id="reviewList">
                     <hr>
                   <div class="row menu">
                  <div class="col-md-4 text-center" onclick="productImg();" ><a href="#imgpage" id="menuContent">상품정보</a></div>
                    <div class="col-md-4 text-center" onclick="QAList();" ><a href="#qnaList" id="menuContent">Q&A</a></div> 
                    <div class="col-md-4 text-center" onclick="reviewsList();"><a href="#reviewList" id="menuContent">구매후기(${reviwData.countNum})</a></div>
                    </div>
                     <hr>
                    <a name="reviewList"></a>
                    <caption>총 ${reviwData.countNum} 개의 상품평이 작성되어 있습니다.</caption>
                    
                    <div class="row table">
                    <table class="table" id="line" border="0">
                     <tr><th>글번호</th><th>작성자</th><th>내용</th><th>작성날짜</th></tr>   
                     <c:forEach items ="${reviwData.reviewList}" var = "review" varStatus = "i">
                    <tr><td>${review.rvNo}</td>
                    	<td>${review.mId }</td>
                    	<td>${review.rvContent}</td>
                   		 <td>${review.rvRegDate}</td>
	                   	<c:if test="${reviewWrite.mId eq review.mId}">	
                   		 <td>
							<a href="javascript:void(0)" onclick="showModifyComment();">수정</a>
							 <input type="hidden" name="reviewContentOne" id="reviewContentOne" value="${review.rvContent}">
							 
						</td>
						 <td>
						 <a href="/DeleteReview?rvNo=${review.rvNo}&saleNo=${review.saleNo}" >삭제</a>
						 </td>
                   		</c:if>
                    </tr>
                         </c:forEach>
                         
                    </table> 
                    </div>
                     <c:if test="${not empty reviewWrite and reSum==0}">
                   <div class="col-sm-12 col-md-12">
                    <form action="/PdReviewInsert">
                        <textarea id="Q_Contents" class="DOC_TEXT" name="rvContent" rows="4" cols="60" placeholder="구매하신 상품의 후기를 입력해주세요 최대 50자"></textarea>
                   	   </textarea><br>
						<span style="color:#aaa;" id="counter">(0 / 최대 50자)</span>
 					
                   	    <input type="hidden" name="saleNo" value="${salePage.saleNo}">
                   	    
                      	<input type="submit" class="btn btn-success" value="등록">
                        <input type="reset" class="btn" value="취소">
                    </form>
                    </div>
                    </c:if>
                    <c:if test="${not empty reviewWrite and reSum>0 }">
                   <div id="modifyreview" style="display:none;" class="col-sm-12 col-md-12">
                    <form action="/reviewModify" method="post">
                        <textarea id="Q_Contents1" class="DOC_TEXT" name="rvContent1" rows="4" cols="60"  value=""></textarea>
                   	   <br>
						<span style="color:#aaa;" id="counter">(0 / 최대 50자)</span>

                   	    <input type="hidden" name="saleNo" id="saleNo" value="${salePage.saleNo}">
                   	   <inpupt type="hidden" name="modifyrvMid1" id="modifyrvMid1" value="">
                        <input type="submit"   class="btn btn-success" id="modifycommit" value="수정완료">
                          <input type="reset" class="btn" value="취소">
                    </form>
                    </div>
                    </c:if>
                
                </div>  
             </div>
        </section>
		 <footer>
        <jsp:include page="/views/extra/footer.jsp" />
        
        
        </footer>
        
    <script>

 	 function action1() {
		//alert("test");//테스트
		var prdAmount = $("#number").val();
		var prdNo=$("#prdNo").val();
		location.href="/AddBasketList?prdAmount="+prdAmount+"&prdNo="+prdNo;
		}

	 function action2() {

		var prdAmount = $("#number").val();
		var prdNo=$("#prdNo").val();
		location.href="/orderListpay?prdAmount="+prdAmount+"&prdNo="+prdNo;
    
  }
	 
		function cotitle(obj,anser){
	 		status = $(obj).parents("tr").nextAll().eq(0).css("display");
	 		status1 = $(obj).parents("tr").nextAll().eq(1).css("display");
	 		
			if(status=="none"){
				$(obj).parents("tr").nextAll().eq(0).css("display","");
			}else{
				$(obj).parents("tr").nextAll().eq(0).css("display","none");
			}
			if(status1=="none" && anser != ""){
					$(obj).parents("tr").nextAll().eq(1).css("display","");
			}else{
				$(obj).parents("tr").nextAll().eq(1).css("display","none");
			}
			
		}
			
		 $('.DOC_TEXT').keyup(function (e){
			e.preventDefault();
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 최대 50자)");    //글자수 실시간 카운팅

		    if (content.length > 50){
		        alert("최대 50자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 50));
		        $('#counter').html("(50 / 최대 50자)");
		    }
		});

		function showModifyComment(){
		 $('#modifyreview').css("display",""); 
		 var rvcontent=$("#reviewContentOne").val()
		 $("#Q_Contents1").val(rvcontent);
		}
			

			
    </script>
    
    
    
    
    
    
    
    </body>



</html>