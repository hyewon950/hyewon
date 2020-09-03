package org.kh.camp.chat.service;

import java.util.List;

import org.kh.camp.chat.domain.ChatRoom;
import org.kh.camp.chat.domain.Message;
import org.kh.camp.used.domain.UsedBoard;

public interface chatService {

	public List<Message> getListMessageList(String mId);
	public ChatRoom isRoom(ChatRoom chatRoom)throws Exception ;
	public ChatRoom isRoom2(int chatRoomNo);
	public List<Message> getMessageList(String mId)throws Exception;
	public List<ChatRoom> getRoomList(String mId)throws Exception ;
	public List<Message> getRoomMessageList(int chatRoomNo);
	public int updateReadtime(Message messageVO);
	public int insertMessage(Message messageVO);
	public int createChatRoom(Message messageVO);
	public ChatRoom getChatRoomNo(ChatRoom chatRoomVo);
	
	
	//public int createRoom(ChatRoom chatRoom)throws Exception ;
	/*
	public int insertMessage(Message message)throws Exception;
	public String getPartner(ChatRoom chatRoom)throws Exception;
	public String getProfile(String str)throws Exception ;
	public String getName(String str)throws Exception;
	
	
	public List<ChatRoom> getRoomList2(String str)throws Exception ;
	public Message getRecentMessage(String str)throws Exception;*/
	//public String isGetMessageList(String str)throws Exception;
	
	/*public String getUsedId(String str)throws Exception; 
	public List<ChatRoom> getRoomListUsed(String mId)throws Exception; 
	public int updateReadTime(int usedNo , String mid , String usedId)throws Exception ;
	public int updateReadTimeUsed(int usedNo , String mid , String usedId)throws Exception ;
	public int getUnReadCount(String usedId, int class_id, String mid)throws Exception ;
	public int getUnReadCountUsed(String usedId, int usedNo, String mid)throws Exception;
	public int getAllCount(String str); */
	
}
