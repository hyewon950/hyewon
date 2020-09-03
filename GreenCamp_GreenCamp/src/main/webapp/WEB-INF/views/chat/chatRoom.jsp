<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅방</title>
<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- css -->
<link rel="stylesheet" href="../../../resources/css/chat/chatRoomCss.css" />

</head>
<body>

<!-- 채팅방 -->
<div class="chat_list_wrap">
        <div class="header">
            Green Camp Talk
        </div>
        
        <!-- <div class="search">
            <input type="text" placeholder="검색" />
        </div> -->
        
        <!-- 채팅방들 나옴 -->
        <div class="list">
            
            
                    <table cellpadding="0" cellspacing="0" class="chatRoomTable">
                    
                    <c:forEach var="list" items="${chatList }">
                        <tr onclick="window.open('/chatView.do?chatRoomNo=${list.chatRoomNo }&receiver=${loginUser.mId }','window_name','width=530,height=500,top=230,left=800,location=no,status=no,scrollbars=yes');">
                            
                            <td class="chat_td" >
                                <!--Email & Preview-->
                                <div class="title">
                                    ${list.title }
                                </div>
                                <div class="chat_preview">
                                    ${list.content }
                                </div>
                            </td>
                            <td class="time_td">
                                <!--Time & Check-->
                                <div class="time">

                                    ${list.sendTime }

                                </div>
                                <c:if test="${empty list.readTime }">
                                <div class="check">
                                    <p> </p>
                                </div>
                                </c:if>
                            </td>
                        </tr>
                        
                        </c:forEach>
                        
                    </table>
              
        </div>
    </div>
    
    <script>

    </script>

</body>
</html>