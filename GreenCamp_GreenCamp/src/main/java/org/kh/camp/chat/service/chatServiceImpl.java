package org.kh.camp.chat.service;

import java.util.List;

import org.kh.camp.chat.domain.ChatRoom;
import org.kh.camp.chat.domain.Message;
import org.kh.camp.chat.store.chatStore;
import org.kh.camp.used.domain.UsedBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("chatService")
public class chatServiceImpl implements chatService{
	
	@Autowired
	private chatStore chatStore;

	@Override
	public ChatRoom isRoom(ChatRoom chatRoom) throws Exception {
		// 채팅방 조회
		return chatStore.isRoom(chatRoom);
	}
	
	@Override
	public ChatRoom isRoom2(int chatRoomNo) {
		// 채팅방 조회2
		return chatStore.isRoom2(chatRoomNo);
	}

	@Override
	public List<Message> getMessageList(String mId) throws Exception {
		// 해당유저 메시지찾기
		
		List<Message> list = chatStore.getMessageList(mId);
		
		System.out.println("chatService : " +list);
		System.out.println("chatService22 : " +chatStore.getMessageList(mId));
		return list;
	}

	@Override
	public List<ChatRoom> getRoomList(String mId) throws Exception {
		// 유저 채팅방 조회
		return chatStore.getRoomList(mId);
	}


	@Override
	public List<Message> getListMessageList(String mId) {
		// 메시지에서 가장 나중에 보낸 메시지번호값들을 받아서 조회
		return chatStore.getListMessageList(mId);
	}

	@Override
	public List<Message> getRoomMessageList(int chatRoomNo) {
		// 채팅방번호로 대화내용 가져오기
		return chatStore.getRoomMessageList(chatRoomNo);
	}


	@Override
	public int insertMessage(Message messageVO) {
		// 메시지 전송시 메시지 내용 저장
		return chatStore.insertMessage(messageVO);
	}

	@Override
	public int updateReadtime(Message messageVO) {
		//채팅보면 읽은시간(READTIME) 업뎃
		return chatStore.updateReadtime(messageVO);
	}

	@Override
	public int createChatRoom(Message messageVO) {
		// 중고거래에서 채팅하기 클릭시 채팅방생성
		return chatStore.createChatRoom(messageVO);
	}

	@Override
		public ChatRoom getChatRoomNo(ChatRoom chatRoomVo) {
		// 채팅방찾기(말건사람과 파는사람으로)
		return chatStore.getChatRoomNo(chatRoomVo);
	}

	




	

}
