package comment.model.vo;

import java.sql.Date;

public class Comment {

	private int mentNo;
	private int postNo;
	private String mentWriter;
	private String mentContent;
	private Date mentRegDate;
	
	public Comment() {}

	public Comment(int mentNo, int postNo, String mentWriter, String mentContent, Date mentRegDate) {
		this.mentNo = mentNo;
		this.postNo = postNo;
		this.mentWriter = mentWriter;
		this.mentContent = mentContent;
		this.mentRegDate = mentRegDate;
	}


	public int getMentNo() {
		return mentNo;
	}

	public void setMentNo(int mentNo) {
		this.mentNo = mentNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getMentWriter() {
		return mentWriter;
	}

	public void setMentWriter(String mentWriter) {
		this.mentWriter = mentWriter;
	}

	public String getMentContent() {
		return mentContent;
	}

	public void setMentContent(String mentContent) {
		this.mentContent = mentContent;
	}

	public Date getMentRegDate() {
		return mentRegDate;
	}

	public void setMentRegDate(Date mentRegDate) {
		this.mentRegDate = mentRegDate;
	}
	
	
	
}
