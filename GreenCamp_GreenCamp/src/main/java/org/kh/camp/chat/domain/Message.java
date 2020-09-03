package org.kh.camp.chat.domain;


import com.google.gson.Gson;

public class Message {

	private int messageNo; //메시지고유번호
	private String sender; //보낸사람
	private String receiver; //받은사람
	private String  content; //채팅내용
	private String sendTime;//보낸시간
	private String readTime;//읽은시간
	private int chatRoomNo; //채팅방고유번호
	private String mId; // 아이디
	private String usedId; //중고거래 물품 등록한 아이디
	private int usedNo; //중고거래 글 번호
	private String title; // 제목
	
	public Message() {}

	public Message(int messageNo, String sender, String receiver, String content, String sendTime, String readTime,
			int chatRoomNo, String mId, String usedId, int usedNo, String title) {
		super();
		this.messageNo = messageNo;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.sendTime = sendTime;
		this.readTime = readTime;
		this.chatRoomNo = chatRoomNo;
		this.mId = mId;
		this.usedId = usedId;
		this.usedNo = usedNo;
		this.title = title;
	}


	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	
	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getReadTime() {
		return readTime;
	}

	public void setReadTime(String readTime) {
		this.readTime = readTime;
	}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getUsedId() {
		return usedId;
	}

	public void setUsedId(String usedId) {
		this.usedId = usedId;
	}

	public int getUsedNo() {
		return usedNo;
	}

	public void setUsedNo(int usedNo) {
		this.usedNo = usedNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public static Message convertMessage(String source) {
		Message message = new Message();
		Gson gson = new Gson();
		message = gson.fromJson(source,  Message.class);
		return message;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", sender=" + sender + ", receiver=" + receiver + ", content="
				+ content + ", sendTime=" + sendTime + ", readTime=" + readTime + ", chatRoomNo=" + chatRoomNo
				+ ", mId=" + mId + ", usedId=" + usedId + ", usedNo=" + usedNo + ", title=" + title + "]";
	}

	


	
}
