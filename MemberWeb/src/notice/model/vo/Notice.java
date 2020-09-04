package notice.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Notice {
	private int noticeNo;
	private String subject;
	private String contents;
	private String userId;
	private Date regDate;
	private ArrayList<NoticeComment> comments =null;
	// 댓글

	public Notice() {
		
	}
	
	
	public ArrayList<NoticeComment> getComments() {
		return comments;
	}

	public void setComments(ArrayList<NoticeComment> comments) {
		this.comments = comments;
	}



	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
