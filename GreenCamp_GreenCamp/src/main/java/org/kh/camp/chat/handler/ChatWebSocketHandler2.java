package org.kh.camp.chat.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.kh.camp.chat.domain.ChatRoom;
import org.kh.camp.chat.domain.Message;
import org.kh.camp.chat.service.chatService;
import org.kh.camp.member.domain.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

/*
 * 스프링 웹소켓을 이용해서 웹소켓 서버 구현
 * 1. WebSocketHandler 인터페이스를 구현
 * 2. <websocket:handlers>를 이용해서 요청URL에 대한 
 * WebSocketHandler 구현 객체 등록
 */
public class ChatWebSocketHandler2 extends TextWebSocketHandler {

	@Inject
	private chatService Chatservice;
	//private chatStore cStore;// dao

	//세션 리스트
	private List<WebSocketSession> sessionList;

	public ChatWebSocketHandler2() {
		sessionList = new ArrayList<WebSocketSession>();
	}
	
	private static Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler2.class);
	
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	//웹 소켓 클라이언트와 연결되면 호출 (클라이언트 연결 이후에 실행)
	@Override
	@Async 
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessionList.add(session);
        logger.info("{} 연결됨", session.getId()); 
		log(session.getId() + " 연결 됨!!");
		
		// HttpSession의 값을 사용하기 위해서는 map을 사용해 데이터를 추출한다.
        Map<String, Object> map = session.getAttributes();
        Member loginUser = (Member)map.get("loginUser");
        
        //추가
        /*List<Message> messageList = (List) map.get("chatList");
		System.out.println("챗팅핸들러 messageList : " + messageList);*/
        //추가끝
        
        for(WebSocketSession sess : sessionList){
            map = sess.getAttributes();
            Member sessionUser = (Member)map.get("loginUser");
            
            log("55 : " + sessionUser);
            
            // 로그인 유저의 나이와 세션리스트에서 forEach로 뽑아낸 WebSocketSession sess 접속자의
            // loginStudent세션값을 가져와 '나'의 스터디넘버와 비교해 같은사람에게만 메시지가 전송되도록 한다.
           /* if(loginUser.getmId()==sessionUser.getmId()) {
               sess.sendMessage(new TextMessage("{{'content' : '"+loginUser.getmName()+"님이 입장하셨습니다.'}}"));
            }*/
         }
		
		//users.put(session.getId(), session);
		//sessionList.add(session);
	}

	// 웹 소켓 클라이언트와 연결이 종료되면 호출
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		log(session.getId() + " 연결 종료됨");
		sessionList.remove(session);
		users.remove(session.getId());

	}
	
	// 웹소켓 클라이언트가 데이터를 전송 (클라이언트가 웹소켓 서버로 메시지를 전송했을때 실행)
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println("message.getPayload() : " + message.getPayload());

		Map<String, Object> map = null;

		Message messageVO = Message.convertMessage(message.getPayload());

		System.out.println("1 : " + messageVO.toString());

		ChatRoom roomVO = new ChatRoom();
		// roomVO.setCLASS_class_id(messageVO.getCLASS_class_id()); //클래스
		roomVO.setUsedId(messageVO.getUsedId()); // 중고거래 등록한 유저
		roomVO.setmId(messageVO.getmId()); // 그냥유저
		roomVO.setChatroomNo(messageVO.getChatRoomNo());//채팅방번호

		ChatRoom croom = null;
		/*if (!messageVO.getmId().equals(messageVO.getUsedId())) {
			System.out.println("a");
			
			if (Chatservice.isRoom(roomVO) == null) {
				System.out.println("b");
				//Chatservice.createRoom(roomVO);
				System.out.println("d");
				croom = Chatservice.isRoom(roomVO);

			} else {
				System.out.println("C");
				System.out.println("roomVO : " + roomVO);
				croom = Chatservice.isRoom(roomVO);
				System.out.println("croom : " + croom);
			}
		} else {
			System.out.println("E");
			croom = Chatservice.isRoom(roomVO);
			System.out.println("핸들러 croom : " + croom);
		}*/

			
			System.out.println("E");
			croom = Chatservice.isRoom(roomVO);
			
		System.out.println("F");
		
		messageVO.setChatRoomNo(croom.getChatroomNo());
		
		if (croom.getmId().equals(messageVO.getSender())) {
			messageVO.setReceiver(croom.getUsedId());
		} else {
			messageVO.setReceiver(croom.getmId());
		}

		for (WebSocketSession websocketSession : sessionList) {
			map = websocketSession.getAttributes();
			Member loginUser = (Member)map.get("loginUser");
System.out.println("받는사람 : " + messageVO.getReceiver());

			// 받는사람
			if (loginUser.getmId().equals(messageVO.getReceiver())) {
				Gson gson = new Gson();
				String msgJson = gson.toJson(messageVO);
				System.out.println("HHH : " + msgJson);
				
				//안읽은 내용 읽음으로
				Chatservice.updateReadtime(messageVO); 
				
				// 서버에 전송된 메시지를 다시 클라이언트에 전송
				websocketSession.sendMessage(new TextMessage(msgJson));
				
			}else if(loginUser.getmId().equals(messageVO.getSender())) {//자기자신
				Gson gson = new Gson();
				String msgJson = gson.toJson(messageVO);
				
				//DB저장
				Chatservice.insertMessage(messageVO);
				
				System.out.println("HHHdddd : " + messageVO);
				// 서버에 전송된 메시지를 다시 클라이언트에 전송
				websocketSession.sendMessage(new TextMessage(msgJson));
			}

		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	private void log(String logmsg) {

		System.out.println(new Date() + " : " + logmsg);

	}
}
