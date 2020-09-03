<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE HTML>


<html>
<head>
    <title>Bootstrap Search Box, Search Panel Like Amazon</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!--  <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>  -->
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->

			<style >
	    #searchMap{
                margin: 10px;
                padding: 10px 10px;
            }
		li a{
		border: none;
		}
		
			</style>
</head>
<body>

      		<form action="searchcamping.do" method="post" name="searchForm">
				<div class="container" style="margin-bottom: 40px;margin-top: 55px;">
				    <div class="row">    
				        <div class="col-xs-8 col-xs-offset-2">
						    <div class="input-group">
				                <div class="input-group-btn search-panel">
				                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				                    	<span id="search_concept">선택</span>
				                    </button>
				                    <ul class="dropdown-menu" role="menu">
				                      <li><a href="#cName">캠핑장명</a></li>
				                      <li><a href="#cAddr">위치</a></li>
				                      <li class="divider"></li>
				                    </ul>
				                </div>
				                <input type="hidden" name="cName" value="" id="search_param1">         
				                <input type="hidden" name="cAddr" value="" id="search_param2">    
					                <input type="text" class="form-control" name="content" placeholder="검색어를 입력해주세요." id="input_search" > 
				               
				            <span class="input-group-btn">
					     <button class="btn btn-default" type="submit">
					       <span class="glyphicon glyphicon-search"></span>
					     </button>
					     </span>
				            </div>
				        </div>
					</div>
				</div>
			</form>
	<script>
					$(document).ready(function(e){
  					  $('.search-panel .dropdown-menu').find('a').click(function(e) {
						e.preventDefault();
							var param = $(this).attr("href").replace("#","");   //=>cName, cAddr  로들어옴
							var concept = $(this).text();
							
							  $('.search-panel span#search_concept').text(concept);
							  
							  if(param == 'cName'){
							  $('.input-group #search_param1').val(param); //선택값을 input의hidden값으로 보내줌 name이 cName
							  $('.input-group #search_param2').val("");
							  }else if(param =='cAddr'){
							  $('.input-group #search_param2').val(param); //선택값을 input의hidden값으로 보내줌 name이 cAddr
							  $('.input-group #search_param1').val("");
							  }else{
							
						//	  $('.input-group #search_param2').val("");
						//	  $('.input-group #search_param1').val("");
							  alert('카테고리를 선택해 주세요!');
							  }
							
							console.log("확인"+param);
								
								});
						
					
					}); 
					
			</script>
</body>
</html>