package org.kh.camp.chat.domain;

public class ChatRoom {

	private int chatroomNo;
	private String mId;
	private String usedId;
	private int usedNo;
	private String title;
	
	public ChatRoom() {}

	
	public ChatRoom(int chatroomNo, String mId, String usedId, int usedNo, String title) {
		super();
		this.chatroomNo = chatroomNo;
		this.mId = mId;
		this.usedId = usedId;
		this.usedNo = usedNo;
		this.title = title;
	}


	public int getChatroomNo() {
		return chatroomNo;
	}

	public void setChatroomNo(int chatroomNo) {
		this.chatroomNo = chatroomNo;
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


	@Override
	public String toString() {
		return "ChatRoom [chatroomNo=" + chatroomNo + ", mId=" + mId + ", usedId=" + usedId + ", usedNo=" + usedNo
				+ ", title=" + title + "]";
	}



	
	
}
