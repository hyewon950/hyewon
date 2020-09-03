<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나만의 캠핑장 jsp</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<link rel="stylesheet" href="../../../resources/css/nav.css" />
<link rel="stylesheet"
	href="../../../resources/css/myCampcss/assets/css/myCampMain.css" />

<link rel="stylesheet" href="../../../resources/css/footer.css" /> 

<style>
/* 태그 버튼 스타일 */
.inputs{
	background-color: white;
	box-shadow: none;
	width: 100px;
	height: 50px;
	margin:5px;
	opacity: 0.8;
	border: none;
}

/* 상세보기 버튼 */
#detailbtn:hover {
	background-color: #b5e5ac;
}
</style>

</head>
<body id="top">

	<!-- Nav -->
	<!--  네비바들어가는 부분-->
	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	<!-- 네비 끝 -->


	<!-- Banner -->
	<!--
				To use a video as your background, set data-video to the name of your video without
				its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
				formats to work correctly.
			-->
	<section id="banner">
		<div class="inner">
			<header>
				<h1 style="color:white;">MY CAMP</h1>
				<p>사용자들이 여행을 다녀왔지만 잘 알려지지 않은 명소를 올려 사람들과 정보를 나누는 공간입니다.</p>
				
				<!--태그-->
		<div class="myCampTag">
		<form action="mycTagSearch.do" name="mycSearchForm" method="get">
			<fieldset>
				<legend style="color:white;">태그를 선택하고 검색 버튼을 눌러 해당 태그를 가진 게시물들을 추려보세요!</legend>
				<button type="button" value="#봄" id="inputs" class="inputs">봄</button>
				<button type="button" value="#여름" id="inputs1" class="inputs">여름</button>
				<button type="button" value="#가을" id="inputs2" class="inputs">가을</button>
				<button type="button" value="#겨울" id="inputs3" class="inputs">겨울</button>
				<button type="button" value="#물맑은" id="inputs4" class="inputs">물맑은</button>
				<button type="button" value="#공기좋은" id="inputs5" class="inputs">공기좋은</button>
				<button type="button" value="#힐링" id="inputs6" class="inputs">힐링</button>
				<button type="button" value="#도심" id="inputs7" class="inputs">도심</button>
				<button type="button" value="#산" id="inputs8" class="inputs">산</button>
				<button type="button" value="#바다" id="inputs9" class="inputs">바다</button>
				<button type="button" value="#깨끗한" id="inputs10" class="inputs">깨끗한</button>
				<br>
				<button type="button" value="#그늘많은" id="inputs11" class="inputs">그늘많은</button>
				<button type="button" value="#익스트림" id="inputs12" class="inputs">익스트림</button>
				<button type="button" value="#따뜻한" id="inputs13" class="inputs">따뜻한</button>
				<button type="button" value="#차대기편한" id="inputs14" class="inputs">차대기편한</button>
				<button type="button" value="#물놀이" id="inputs15" class="inputs">물놀이</button>
				<button type="button" value="#온수" id="inputs16" class="inputs">온수</button>
				<button type="button" value="#조용한" id="inputs17" class="inputs">조용한</button>
				<button type="button" value="#분위기있는" id="inputs18" class="inputs">분위기있는</button>
				<button type="button" value="#가족" id="inputs19" class="inputs">가족</button>
				<button type="button" value="#연인" id="inputs20" class="inputs">연인</button>
			</fieldset>
			<br>
			<!--  <input type="text" class="form-control" name ="mycTag" id="mycTag" required="required"> -->
			<p style="display: none" id="mycTag1">태그나와요요요</p>
			<!--   <input type="text" class="form-control"  id="print4" ></p> -->
			<!-- <input type="text" class="form-control" name="mycTag" id="mycTag"
				required="required" readonly> -->
			 <input type="mycSearch" name="mycSearchValue" class="tagblock" id="mycTag" value="${mycSearch.mycSearchValue }" readonly style="background-color:transparent; color:white;">
				<%-- <input type="mycSearch" name="mycSearchValue" value="${mycSearch.mycSearchValue }" style="margin-left:40px;">
				 <input type="text" class="form-control" name="mycTag" id="mycTag"
								required="required" readonly> --%>
		   <!--  <input type="mycTagSearch" class="form-control" name="mycSearchValue" name="mycTag" id="mycTag" required="required" readonly> -->
			<!--  <div id="result1"> </div> -->
			<!-- <button type="button" onclick="printTest();">태그 저장 </button> -->
			<script>
                var data = new Array();
                var hi = null;
                
                 $(document).ready(function() { 

                    $(".inputs").click(function() {

                        //var print2 = document.getElementById("mycTag1");

                        hi = $(this).attr('value');
                        if ($.inArray(hi, data) > -1) {
                            console.log("있다네");

                            var search = data.indexOf(hi);
                            if (search != -1) {
                                data.splice(search, 1); // "A"를 찾아서 삭제한다.
                            }
                            var str = data.join(" ");
                            mycTag1.innerHTML = str;
                            
                            if(str.length > 30) {
                                alert("태그를 너무 많이 적용하셨습니다.");
                            }else{
                            	 $('#mycTag').val(str);
                            }
                           
                           
                        } else {
                            data.push($(this).attr('value'));
                            var str = data.join(" ");
                            mycTag1.innerHTML = str;
                            $('#mycTag').val(str);
                            if(str.length > 30) {
                                alert("태그를 너무 많이 적용하셨습니다.");
                            }else{
                            	 $('#mycTag').val(str);
                            }
                        }

                    });

                 }); 

                /*한번에 출력되는지 보는거*/
               /*   function printTest() {
                    //var print2 = document.getElementById("print4");
                    var str = data.join(" ");
                    print4.innerHTML = str;
                    $('#mycTag').val(str);
                    
                    
                }*/
            </script>
            <button style="border:none;box-shadow: none;background-color: white;opacity:0.8;">검색</button>
           </form>
		</div>
		<!-- 태그여기까지 -->
		
			</header>
			<!-- <a href="#main" class="more">Learn More</a> -->
			<div style="text-align:center;color:white;">게시글 보러가기</div>
			<a href="#boarder" class="more">Learn More</a>	
		</div>
	</section>

	<!-- Main -->
	<div id="main">
		<br>
		<%--  <h1 id="myCampCnt" style="text-align:center"> 총 ${mycpi.mycListCount } 의 숨겨진 명소가 등록되어있습니다</h1> --%>
		<h1 id="myCampCnt" style="text-align: center">총
			${mycpi.mycListCount } 곳의 숨겨진 명소가 등록되어있습니다</h1>
		<br>
		<div style="text-align:center">지역을 클릭하여 해당 지역에 등록된 게시글을 볼수 있습니다.</div>
		<br>
		<div class="mainmap" style="text-align: center; color: black;">
			<!-- <img src="resources/css/myCampcss/assets/css/images/pic01.jpg">이거슨지도입니당 -->
			<!-- 지도 -->
			<jsp:include page="mapprac.jsp"></jsp:include>

		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<hr>

<div  id="boarder" > 
		<!-- <a href="MyCampInsert.html" style="float:right;color:black">글쓰기</a> -->
		
		<!-- 로그인 상태에서만 보이게 -->
		<c:if test="${!empty loginUser }">
		<button onclick="location.href='mycInsertBoardView.do';"
			style="float: right">글쓰기</button>
		<br>
		</c:if>
		
		<!-- 로그인 안했을때 -->
		<c:if test="${empty loginUser }">
			<div style="text-align:right">※ 글작성은 로그인 후 이용가능 합니다.</div>
		</c:if>
		
		<!-- 검색 -->
		<div id="mycSearchArea" align="center"  >
			<form action="mycSearch.do" name="mycSearchForm" method="get" >
				<select id="mycSearchCondition" name="mycSearchCondition" style="display:inline;width:70px;height:45px;">
					<option value="mycAll"
						<c:if test="${mycSearch.mycSearchCondition =='mycAll' }">selected</c:if>>전체</option>
					<option value="mycTitle"
						<c:if test="${mycSearch.mycSearchCondition =='mycTitle' }">selected</c:if>>제목</option>
						<option value="mycDetail"
						<c:if test="${mycSearch.mycSearchCondition =='mycDetail' }">selected</c:if>>내용</option>
					<%-- <option value="mycTag"
						<c:if test="${mycSearch.mycSearchCondition =='mycTag' }">selected</c:if>>태그</option> --%>
				</select> 
				
				<input type="mycSearch" name="mycSearchValue" value="${mycSearch.mycSearchValue }" >
				<button>검색</button>
				<input type="checkbox" name="mycExistFile" <c:if test="${!empty mycSearch.mycExistFile}">checked</c:if>>
				<br> 
			<%-- 	<input type="checkbox" name="mycExistFile"
					<c:if test="${!empty mycSearch.mycExistFile}">checked</c:if>> --%>
			</form>
		</div>
<br><br>

		<div class="inner">

			<!-- Boxes -->
			<div class="thumbnails" >
		<%-- 		 <c:forEach var="fileList" items="${fileList }">
						<a href="${mycdetail }" class="image fit">
						<c:if test="${fileList.mycNo eq list.mycNo}"> 
						<p>hi${fileList.mycNo}</p>
						<img src="../../resources/myCampFiles/${fileList.mycFileName}" alt="안나오넹" width="500px">
						</c:if>
						  <c:if test="${fileList.mycNo ne list.mycNo}"> 
						<img src="resources/css/myCampcss/assets/css/images/pic01.jpg" alt="" />
						</c:if>  
						</a>
				</c:forEach>  --%>
			
				
				<c:forEach var="myc" items="${list }">
				
				<div class="box" style="box-shadow: none;">
				
				<%-- <c:if test="${empty myc }">
					<p>해당 검색과 일치하는 게시글이 없습니다.</p>
				</c:if> --%>
				
				<c:set var="loop_flag" value="false" />
			    
			    <c:forEach var="fileList" items="${fileList }">
			    	<c:choose>
			    		<c:when test="${fileList.mycNo eq myc.mycNo}">
			    		<c:url var="mycdetail" value="mycdetail.do">
								<c:param name="mycNo" value="${myc.mycNo }" />
								<c:param name="page" value="${mycpi.mycCurrentPage }" />
							</c:url>
			    			<a href="${mycdetail }" class="image fit" >
							<img src="../../resources/myCampFiles/${fileList.mycFileName}" alt="" style="width: 100%;
				height:200px;!important"/>
							</a>
							<c:set var="loop_flag" value="true" />
			    		</c:when>
			    	</c:choose>
				 </c:forEach>
				 
						
						<!-- 파일 있을 떄 -->
					<%-- 	<c:if test="${fileList.mycNo eq myc.mycNo}">
							<a href="${mycdetail }" class="image fit" style="width:500x;">
							<img src="../../resources/myCampFiles/${fileList.mycFileName}" alt="" />
							</a>

						</c:if> 
 --%>						
						<!-- 파일 없을때 -->
						<%-- <c:if test="${fileList.mycNo eq null}">
							<a href="${mycdetail }" class="image fit">
							<img src="resources/css/myCampcss/assets/css/images/pic01.jpg" alt="" />
							</a>
							<c:set var="loop_flag" value="true" />
						</c:if>  --%>
						
					
						 <div class="inner">
							<%-- <p style="color: black;">${myc.mycNo}</p> --%>
							<h3>${myc.mycTitle}</h3>
							<p style="color: #595959;margin-bottom:10px;">${myc.mycPlace}</p>
							<%-- <p style="color: black;">${myc.mycDetail}</p> --%>
							<c:if test="${myc.mycTag==null}">
								<h3 style="color: #595959;margin-bottom:10px;">등록되지 않음</h3>
							</c:if>
							<c:if test="${myc.mycTag!=null}">
								<p style="color:#595959;margin-bottom:10px;background-color:#eafaea;">${myc.mycTag}</p>
							</c:if>
							<p style="color: #595959;margin-bottom:10px;font-size:0.8em;"> 조회수 : ${myc.mycViewCnt}</p>
							<c:url var="mycdetail" value="mycdetail.do">
								<c:param name="mycNo" value="${myc.mycNo }" />
								<c:param name="page" value="${mycpi.mycCurrentPage }" />
							</c:url>
							<a href="${mycdetail }"  id="detailbtn" class="button fit detailbtn" style="box-shadow:none;background-color:white;border:solid #b5e5ac 1px;color: #4C7146!important;">상세보기</a>
						</div> 
					</div>
				 
				</c:forEach>
				
				<!-- 페이징 처리 -->
				<table align="center" border="1" cellspacing="0" width="700" id="tb">
				<tr align="center" height="20">
			<td> 
				<div class="paging">
				
					<!-- [이전] -->
				<c:if test="${mycpi.mycCurrentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${mycpi. mycCurrentPage > 1 }">
					<c:url var="before" value="myclist.do">
					<c:param name="page" value="${mycpi.mycCurrentPage - 1 }" />
				</c:url>
				<a href="${before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- [이전]과 [다음]사이 페이지 처리  -->
				<c:forEach var="p" begin="${mycpi.mycStartPage }" end="${mycpi.mycEndPage }">
					<c:if test="${p eq mycpi.mycCurrentPage }">
						<font color="red" size="4"><b>[${p }]</b></font>
					</c:if>
					<c:if test="${p ne mycpi.mycCurrentPage }">
						<c:url var="pagination" value="myclist.do">
							<c:param name="page" value="${p }" />
						</c:url>
						<a href="${pagination }">${p }</a> &nbsp;
					</c:if>
				</c:forEach>	

				<!-- [다음] -->
				<c:if test="${mycpi.mycCurrentPage >= mycpi.mycMaxPage }">
					[다음] &nbsp;
				</c:if>
				<c:if test="${mycpi.mycCurrentPage < mycpi.mycMaxPage }">
					<c:url var="after" value="myclist.do">
					<c:param name="page" value="${mycpi.mycCurrentPage + 1 }" />
					</c:url>
					<a href="${after }">[다음]</a> &nbsp;
				</c:if>
				
				</div>
				
		 	</td>
		</tr> 
	

			</div>
				</table>

		</div>



	</div>

</div>
	<!-- Scripts -->
	<script src="resources/css/myCampcss/assets/js/jquery.min.js"></script>
	<script src="resources/css/myCampcss/assets/js/jquery.scrolly.min.js"></script>
	<script src="resources/css/myCampcss/assets/js/jquery.poptrox.min.js"></script>
	<script src="resources/css/myCampcss/assets/js/skel.min.js"></script>
	<script src="resources/css/myCampcss/assets/js/util.js"></script>
	<script src="resources/css/myCampcss/assets/js/main.js"></script>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>