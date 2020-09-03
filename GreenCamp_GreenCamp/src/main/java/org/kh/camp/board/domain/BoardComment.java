package org.kh.camp.board.domain;

import java.sql.Date;

public class BoardComment {

	private int commentNo;
	private int bNo;
	private String refBoardNo;
	private String comment;
	private Date commentDate;
	private String commentWriter;
	
	public BoardComment() {}

	public BoardComment(int commentNo, int bNo, String refBoardNo, String comment, Date commentDate,
			String commentWriter) {
		super();
		this.commentNo = commentNo;
		this.bNo = bNo;
		this.refBoardNo = refBoardNo;
		this.comment = comment;
		this.commentDate = commentDate;
		this.commentWriter = commentWriter;
	}




	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getRefBoardNo() {
		return refBoardNo;
	}

	public void setRefBoardNo(String refBoardNo) {
		this.refBoardNo = refBoardNo;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	
	
	
	
	
}
