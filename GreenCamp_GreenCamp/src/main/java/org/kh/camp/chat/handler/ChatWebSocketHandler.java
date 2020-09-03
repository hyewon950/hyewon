/*package org.kh.camp.chat.handler;

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
//https://shj7242.github.io/2018/01/23/Spring37/ - 참고 블로그


 * 스프링 웹소켓을 이용해서 웹소켓 서버 구현
 * 1. WebSocketHandler 인터페이스를 구현
 * 2. <websocket:handlers>를 이용해서 요청URL에 대한 
 * WebSocketHandler 구현 객체 등록
 
public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Inject
	private chatService Chatservice;

	//세션 리스트
	private List<WebSocketSession> sessionList;

	public ChatWebSocketHandler() {
		sessionList = new ArrayList<WebSocketSession>();
	}
	
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	//웹 소켓 클라이언트와 연결되면 호출 (클라이언트 연결 이후에 실행)
	@Override
	@Async 
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		log(session.getId() + " 연결 됨!!");

		users.put(session.getId(), session);
		sessionList.add(session);
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

		ChatRoom croom = null;
		if (!messageVO.getmId().equals(messageVO.getUsedId())) {
			System.out.println("a");

			if (Chatservice.isRoom(roomVO) == null) {
				System.out.println("b");
				Chatservice.createRoom(roomVO);
				System.out.println("d");
				croom = Chatservice.isRoom(roomVO);

			} else {
				System.out.println("C");
				croom = Chatservice.isRoom(roomVO);
			}
		} else {

			croom = Chatservice.isRoom(roomVO);
		}

		messageVO.setChatRoomNo(croom.getChatroomNo());
		if (croom.getmId().equals(messageVO.getSender())) {

			messageVO.setReceiver(roomVO.getUsedId());
		} else {
			messageVO.setReceiver(roomVO.getmId());
		}

		for (WebSocketSession websocketSession : sessionList) {
			map = websocketSession.getAttributes();
			Member login = (Member) map.get("login");

			// 받는사람
			if (login.getmId().equals(messageVO.getSender())) {

				Gson gson = new Gson();
				String msgJson = gson.toJson(messageVO);
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
*/