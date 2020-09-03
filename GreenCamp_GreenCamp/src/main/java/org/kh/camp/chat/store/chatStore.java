package org.kh.camp.chat.store;

import java.util.List;

import org.kh.camp.chat.domain.ChatRoom;
import org.kh.camp.chat.domain.Message;
import org.kh.camp.used.domain.UsedBoard;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("chatStore")
public class chatStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public ChatRoom isRoom(ChatRoom chatRoom){
		//채팅방조회
		return sqlSession.selectOne("chatMapper.isRoom",chatRoom);
	}
	
	public ChatRoom isRoom2(int chatRoomNo){
		//채팅방조회
		return sqlSession.selectOne("chatMapper.isRoom",chatRoomNo);
	}
	
	//유저 메시지 조회
	public List<Message> getMessageList(String mId) {
		System.out.println("chatStore mId:" + mId);
		return (List)sqlSession.selectList("chatMapper.getMessageList", mId);
	}
	//유저 채팅방 조회
	public List<ChatRoom> getRoomList(String mId) {
		return (List)sqlSession.selectList("chatMapper.getRoomList", mId);
	}
	
	//마지막에 보낸 메시지와 채팅방 동시에 조회
	public List<Message> getListMessageList(String mId) {
		
			return (List)sqlSession.selectList("chatMapper.getMaxMessageLast",mId);
	}
	
	//채팅방번호로 대화내용 가져오기
	public List<Message> getRoomMessageList(int chatRoomNo) {
		return (List)sqlSession.selectList("chatMapper.getRoomMessageList",chatRoomNo);
	}
	
	
	//채팅보면 읽은시간(READTIME) 업뎃
		public int updateReadtime(Message messageVO) {
			return sqlSession.update("chatMapper.updateReadtime",messageVO);
		}
	
	//메시지 전송 클릭시 메시지 저장
	public int insertMessage(Message message) {
		return sqlSession.insert("chatMapper.insertMessage", message);
	}
	
	//중고거래에서 채팅하기 클릭시 채팅방생성
	public int createChatRoom(Message messageVO) {
		return sqlSession.insert("chatMapper.createChatRoom", messageVO);
	}
	
	//채팅방찾기(말건사람과 파는사람으로)
	public ChatRoom getChatRoomNo(ChatRoom chatRoomVo) {
		return sqlSession.selectOne("chatMapper.getChatRoomNo", chatRoomVo);
	}
	
	public int createRoom(ChatRoom chatRoom) {
		return 0;
	}
	
	public String getPartner(ChatRoom chatRoom) {
		return null;
	}
	public String getProfile(String str) {
		return null;
	}
	public String getName(String str) {
		return null;
	}
	
	public List<ChatRoom> getRoomList2(String str) {
		return null;
	}
	public Message getRecentMessage(String str) {
		return null;
	}
	//public String isGetMessageList(String str)throws Exception;
	
	public String getUsedId(String str) {
		return null;
	}
	public List<ChatRoom> getRoomListUsed(String str) {
		return null;
	}
	public int updateReadTime(int usedNo , String mid , String usedId) {
		return 0;
	}
	public int updateReadTimeUsed(int usedNo , String mid , String usedId) {
		return 0;
	}
	
	public int getUnReadCount(String usedId, int class_id, String mid) {
		return 0;
	}
	public int getUnReadCountUsed(String usedId, int usedNo, String mid) {
		return 0;
	}
	
	public int getAllCount(String str) {
		return 0;
	}
	
}
