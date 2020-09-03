/*package org.kh.camp.chat.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.kh.camp.chat.domain.ChatRoom;
import org.kh.camp.chat.service.chatService;
import org.kh.camp.member.domain.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//참고 핸들러
public class EchoHandler  extends TextWebSocketHandler {

	 //세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    @Autowired
    @Qualifier(value="chatRoomService")
    private chatService chatRoomService;
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
   
    @Override
    @Async 
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
       // 웹소켓세션에 접속
        sessionList.add(session);
        logger.info("{} 연결됨", session.getId()); 
        // 
        // HttpSession의 값을 사용하기 위해서는 map을 사용해 데이터를 추출한다.
        Map<String, Object> map = session.getAttributes();
        Member loginUser = (Member)map.get("loginUser");
        ChatRoom chatRoom = new ChatRoom(loginUser.getsNo(),loginUser.getStudyNo(),loginUser.getsName(),loginUser.getsFile());
        chatRoomService.entranceRoom(chatRoom);
        for(WebSocketSession sess : sessionList){
           map = sess.getAttributes();
           Member sessionUser = (Member)map.get("loginUser");
           // 로그인 유저의 나이와 세션리스트에서 forEach로 뽑아낸 WebSocketSession sess 접속자의
           // loginStudent세션값을 가져와 '나'의 스터디넘버와 비교해 같은사람에게만 메시지가 전송되도록 한다.
           if(loginStudent.getStudyNo()==sessionUser.getStudyNo()) {
              sess.sendMessage(new TextMessage("{{entryIn}}"+loginStudent.getsName()+"님이 입장하셨습니다."));
           }
        }
        
        
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    @Async
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
       logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        //모든 유저에게 메세지 출력
        Map<String, Object> map = session.getAttributes();
        Student loginStudent = (Student)map.get("loginStudent");
        for(WebSocketSession sess : sessionList){
           map = sess.getAttributes();
           Student sessionUser = (Student)map.get("loginStudent");
           if(loginStudent.getStudyNo()==sessionUser.getStudyNo()) {
              sess.sendMessage(new TextMessage("{{"+loginStudent.getsName()+"}}"+ message.getPayload()));
           }
        }
    }
    //클라이언트 연결을 끊었을 때 실행
    @Override
    @Async
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
       Map<String, Object> map = session.getAttributes();
       Student loginStudent = (Student)map.get("loginStudent");
       chatRoomService.exitRoom(loginStudent.getsNo());
        for(WebSocketSession sess : sessionList){
           map = sess.getAttributes();
           Student sessionUser = (Student)map.get("loginStudent");
           if((sessionUser.getsNo()!=loginStudent.getsNo()) && sessionUser.getStudyNo() == loginStudent.getStudyNo()) {
              sess.sendMessage(new TextMessage("{{entryOut}}"+loginStudent.getsName()+"님이 퇴장하셨습니다."));
           }
        }
        logger.info("{} 연결 끊김.", session.getId());
        sessionList.remove(session);
       
       
    }

}
*/