<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 네비바</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<link rel="stylesheet" href="../../../resources/css/member/myPageCss.css" />

</head>
<body>

<div class="col-3 col-12-medium">
                    <div class="sidebar">

                        <!-- Sidebar -->

                        <!-- Recent Posts -->
                        <section>
                            <h2 class="major"><b>마이페이지&nbsp;</b></h2>
                            <ul class="divided">
                                <li>
                                    <article class="box post-summary">
                                        <h3><a href="MyReservationInfoView.do?mId=${sessionScope.loginUser.mId }">예약정보</a></h3>
                                        <ul class="meta">
                                            <li><a href="myCheckInView.do?mId=${sessionScope.loginUser.mId }">체크인(예정) 캠핑장</a></li>
                                            <li><a href="myCheckOutView.do?mId=${sessionScope.loginUser.mId }">체크아웃 캠핑장</a></li>
                                        </ul>
                                    </article>
                                </li>
                                <li>
                                    <article class="box post-summary">
                                        <h3><a href="myUsedProductView.do?mId=${loginUser.mId }">중고거래</a></h3>
                                        <ul class="meta">
                                            <li><a href="myUsedProductView.do?mId=${loginUser.mId }">등록한 상품</a></li>
                                        </ul>
                                    </article>
                                </li>
                                <li>
                                    <article class="box post-summary">
                                        <h3><a href="myPageMemberSelectView.do">회원정보</a></h3>
                                        <ul class="meta">
                                            <li><a href="memberModifyView.do">수정</a></li>
                                            <li><a href="memberDeleteView.do">탈퇴</a></li>
                                        </ul>
                                    </article>
                                </li>
                            </ul>

                        </section>


                    </div>
                </div>

</body>
</html>