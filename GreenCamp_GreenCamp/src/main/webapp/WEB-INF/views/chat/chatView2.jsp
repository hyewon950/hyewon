<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet" type="text/css" href="../../../resources/css/style.css"> -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../../../resources/js/sockjs.js"></script>
<script type="text/javascript" src="../../../resources/js/sockjs.min.js"></script>

</head>
<body>


<%-- <c:set var="profile" value='<%=session.getAttribute("loginUser")%>' /> --%>
<c:set var="profile" value='${sessionScope.loginUser }' />



 	<!--<div class="col-12 row justify-content-center align-items-center my-5 ">
		<a href=""><img src="../../../resources/image/AlmomLogo.png"
			alt="Almom Logo" width="180px" class="img-fluid" /></a>
	</div>-->
	<%-- <div class="col-12">
		<div class="col-2" style="float: left">
			<!-- <span> 목록 </span> -->
		</div>
		<div class="col-8" style="float: left; text-align: center;">
			${chatList[0].title } <!-- 님과 대화 --></div>
		<div class="col-2" style="float: right">
			<span> 닫기 </span>
		</div>

	</div> --%>
	
	<!-- top, right, bottom, left  -->
	<div style="text-align: center; background-color: #b1ddab; padding:5px 0px 5px; color: white; ">
			${chatList[0].title } </div>
			
			<br>
			
	<!-- 채팅 내용 -->
	<div class="col-12">
		<div class="col-11"
			style="margin: 0 auto; border: 1px solid #9dcc97; height: 400px; border-radius: 10px; overflow:scroll" id = "chatArea">

			<!-- DB에 있는 내용보여주기 -->
			 <c:forEach var="list" items="${chatList }">
			 
			 <c:if test="${list.sender eq loginUser.mId }">
			 <!-- 로그인 유저가 보낸사람과 일치시 -->
			<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><div style='clear:both;'>
			${list.sender }</div>
			</div>
			<div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'>
			<div class = 'col-12' style = 'background-color:#fff; padding : 10px 5px; float:left; border-radius:10px; border: 0.5px solid #5c5c5c;'>
			<span style = 'font-size : 12px;'>${list.content }</span>
			</div><div col-12 style = 'font-size:9px; text-align:right; float:right;'>
			<span style ='float:right; font-size:9px; text-align:right;' >${list.sendTime }</span></div></div></div>
			
			</c:if>
			
			<c:if test="${list.sender ne loginUser.mId }">
			 <!-- 로그인 유저랑 보낸사람이 다름 -->
			
			<div class='col-12 row' style = 'height : auto; margin-top : 5px;'>
			
			<div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'>
			<div class = 'col-12' style = ' background-color:#ecffeb; padding : 10px 5px;  border-radius:10px;'>
			<span style = 'font-size : 12px;'>${list.content }</span>
			</div><div col-12 style = 'font-size:9px; text-align:right; float:right;'>
			<span style ='float:right; font-size:9px; text-align:right;' >${list.sendTime }</span></div></div>
			
			<div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'>
			<div style='clear:both;'>
			${list.sender }</div></div>
			
			</div>
			</c:if>
			
			</c:forEach>

<!-- 입력시 이쪽으로 -->
			<div id="chatMessageArea" style = "margin-top : 10px; margin-left:10px;"></div>

		</div>
	</div>

	<!-- 채팅 입력창 -->
	<div class="col-12" style="margin-top: 20px; margin-bottom: 15px;">
		<div class="col-12" style="float: left">
		
			<!-- <textarea class="form-control" style="border: 1px solid #01D1FE; height: 65px; float: left; width: 80%"
				placeholder="Enter ..." id = "message" name="content"></textarea> -->
				<input class="form-control" style="border: 1px solid #9dcc97; height: 65px; float: left; width: 80%"
				placeholder="Enter ..." id = "message" name="content"></input>
			
			<span style="float: right; width: 18%; height: 65px; text-align: center; background-color: #b1ddab; border-radius: 5px;">
				<a style="margin-top: 30px; text-align: center; color: white; font-weight: bold;" id = "sendBtn"><br>전송</a>
			</span>
		</div>

	</div>


<input type="text" id="nickname" value = "${user_name }" style = "display:none">
 <input type="button" id="enterBtn" value="입장" style = "display:none">
 <!-- <input type="button" id="exitBtn" value="나가기" style = "display:none"> -->
<!--  <input type="button" id="exitBtn" value="나가기"> -->
 
 
<script>
 
 connect();

 function connect() {
	 //서버랑연결(webSocket을 지정한 url로 연결)
	    sock = new SockJS('http://localhost:8855/chat');
	    sock.onopen = function() {
	    	appendMessage("연결되었습니다.",'${loginUser.mId}');
	        console.log('open');
	       
	    };
	    
	    //WebSocket 서버에서 메시지를 보내면 자동으로 실행된다
	    // evt 파라미터는 WebSocket이 보내준 데이터다
	    sock.onmessage = function(evt) {
    	 var data = evt.data;
    	   console.log("onmessage data"+data);
  		    var obj = JSON.parse(data);   
    	   console.log("sock.onmessage_obj:"+obj['content']);
    	   console.log("sock.onmessage_obj:"+obj['sender']);
    	   //메시지추가
    	   appendMessage(obj.content, obj.sender); 
    	   //appendMessage(data.content);
	    };
	    
	  //WebSocket과 연결을 끊고 싶을 때 실행하는 메소드다
	    sock.onclose = function() {
	    	 appendMessage("연결을 끊었습니다.", '${loginUser.mId}');
	        console.log('close');
	    };
	}




 function send() {
	//WebSocket으로 메시지를 전달한다.
  var msg = $("#message").val();
	console.log("#message : " + msg);
	
  if(msg != ""){
	  message = {};
	  
  	  message.chatRoomNo = ${chatRoom.chatroomNo},
	  message.content = $("#message").val(),
  	  message.usedId = '${chatRoom.usedId }',
  	  message.mId = '${profile.mId}',
  	  message.usedNo = ${chatRoom.usedNo },
  	  message.sender = '${profile.mId}'
  }

  
  sock.send(JSON.stringify(message));
//  $("#message").val("");
  $("#message").val("");
  $("#message").val().replace(/\r\n/g, "");
  
 }

 //나가기버튼클릭시
function disconnect() {
	sock.onclose;
	appendMessage("연결을 끊었습니다.");
    console.log('close');
	
}


 function getTimeStamp() {
   var d = new Date();
   var s =
     leadingZeros(d.getFullYear(), 4) + '-' +
     leadingZeros(d.getMonth() + 1, 2) + '-' +
     leadingZeros(d.getDate(), 2) + ' ' +

     leadingZeros(d.getHours(), 2) + ':' +
     leadingZeros(d.getMinutes(), 2) + ':' +
     leadingZeros(d.getSeconds(), 2);

   return s;
 }

 function leadingZeros(n, digits) {
   var zero = '';
   n = n.toString();

   if (n.length < digits) {
     for (i = 0; i < digits - n.length; i++)
       zero += '0';
   }
   return zero + n;
 }


 function appendMessage(msg,sender) {
	 if(msg == ''){
		 return false;
	 }else{


	 var t = getTimeStamp();
	 
	 if(sender === '${loginUser.mId}') { //일치할시
		 console.log('dddd');
	 
 		 $("#chatMessageArea").append("<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><div style='clear:both;'>"+sender+"</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = 'background-color:#fff; padding : 10px 5px; float:left; border-radius:10px; border: 0.5px solid #5c5c5c;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div>")		 
	 }else {
		 $("#chatMessageArea").append("<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ecffeb; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><div style='clear:both;'>"+sender+"</div></div></div>")		 

	 }   
	 
	 //스크롤 맨위로
	  //var chatAreaHeight = $("#chatArea").height();
	 // var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	 // $("#chatArea").scrollTop(maxScroll); 
	 
	 //스크롤 밑으로
	 var scrollHeight = $("#chatArea").prop('scrollHeight');
	  $("#chatArea").scrollTop(scrollHeight);

	 }
 }
 $(document).ready(function() {
  $('#message').keypress(function(event){ //엔터키 누르면 채팅전송
   var keycode = (event.keyCode ? event.keyCode : event.which);
   if(keycode == '13'){
    send();
    
   }
   event.stopPropagation();
  });


	//전송버튼 클릭시
  $('#sendBtn').click(function() { send(); });
  
	//나가기버튼 클릭시
  $('#exitBtn').click(function() { disconnect(); });
  /* $('#enterBtn').click(function() { connect(); });  */
 });
</script>

</body>
</html>