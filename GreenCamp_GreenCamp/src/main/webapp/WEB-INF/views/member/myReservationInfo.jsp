<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약정보</title>
<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 현재 날짜가져오기 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="today" value="<%=new java.util.Date()%>"/>

<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy.MM.dd"/>

</head>
<body>

<!--  네비바들어가는 부분-->
 <jsp:include page="../common/menuBar.jsp"></jsp:include>
<!-- 네비끝 -->

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
                                <b>예약정보</b>

                            </header>


                            <section>
                                <div class="container">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th width="250px">
                                                    캠핑장명
                                                </th>
                                                <th width="100px">
                                                    상태
                                                </th>
                                                <th width="50px">
                                                    예약일
                                                </th>
                                                <th width="150px">
                                                    주소
                                                </th>
                                                <th width="140px">
                                                    전화번호
                                                </th>
                                                <th width="150px">
                                                기타
                                                </th>

                                            </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach var="rlist" items="${resList }">
                                        
                                        <!-- for문 한번만 돌아가기위해서 쓰인것 -->
                                        <c:set var="loop_flag" value="false" />
                                        
                                        <c:forEach var="clist" items="${campList }">
                                        
                                        
                                        <c:if test="${not loop_flag }">
                                        <c:if test="${clist.cNo eq rlist.cNo }">
                                            <tr>
                                                <td>
                                                	
                                                    <a href="campingDetail.do?cNo=${clist.cNo}">${clist.cName }</a>
                                                    
                                                </td>
                                                
                                                <td>
													<c:set var="startDate1" value="${rlist.startDate}"/>
													<fmt:parseDate var="startDate2" value="${startDate1}" pattern="yyyy.MM.dd"/>	
													<fmt:formatDate var="startDate3" type="date" value="${startDate2}" pattern="yyyy.MM.dd"/>	
													
													<c:set var="endDate1" value="${rlist.endDate}"/>
													<fmt:parseDate var="endDate2" value="${endDate1}" pattern="yyyy.MM.dd"/>	
													<fmt:formatDate var="endDate3" type="date" value="${endDate2}" pattern="yyyy.MM.dd"/>														
																
																<c:if test="${now < startDate3 }">
																	입실전 
																</c:if>
																
																<c:if test="${now >= startDate3 }">
																<c:if test="${now <= endDate3 }">
																	입실중 
																</c:if>
																<c:if test="${now > endDate3 }">
																	퇴실 
																</c:if>

																</c:if>



															</td>
                                                <td>
                                                     ${rlist.startDate } ~ ${rlist.endDate }
                                                </td>
                                                <td>
                                                    ${clist.cAddr }
                                                </td>
                                                <td>
                                                     ${clist.cPhone }
                                                </td>
                                                <td>
                                                <c:if test="${now <= startDate3 }">
                                                    <a class="btn chInBtn" href="deleteReservation.do?resNo=${rlist.resNo }&mId=${loginUser.mId}" role="button">예약취소</a>
                                                    </c:if>
                                                    
                                                    <c:if test="${now > startDate3 }">
                                                    <a class="btn choutBtn" href="campingDetail.do?cNo=${clist.cNo}" role="button">리뷰쓰기</a>
                                                    </c:if>
                                                    
                                                </td>
                                            </tr>
                                            
                                            <!-- for문에서 빠져나옴 -->
                                            <c:set var="loop_flag" value="true" />
                                            </c:if>
                                            
                                            </c:if>
                                            
                                            
                                            
                                            </c:forEach>
                                            </c:forEach>
                                            
                                            

                                        </tbody>
                                    </table>
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