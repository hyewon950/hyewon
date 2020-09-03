package org.kh.camp.mycamp.domain;

import java.sql.Date;

public class MyCampComment {

	private int mycCommentNo;
	private int mycNo;
	private String mId;
	private String mycComment;
	private Date mycCommentDate;
	private int mycCommentStar;
	private String mycCommentStatus;
	
	public MyCampComment() {}

	public MyCampComment(int mycCommentNo, int mycNo, String mId, String mycComment, Date mycCommentDate,
			int mycCommentStar, String mycCommentStatus) {
		super();
		this.mycCommentNo = mycCommentNo;
		this.mycNo = mycNo;
		this.mId = mId;
		this.mycComment = mycComment;
		this.mycCommentDate = mycCommentDate;
		this.mycCommentStar = mycCommentStar;
		this.mycCommentStatus = mycCommentStatus;
	}

	public int getMycCommentNo() {
		return mycCommentNo;
	}

	public void setMycCommentNo(int mycCommentNo) {
		this.mycCommentNo = mycCommentNo;
	}

	public int getMycNo() {
		return mycNo;
	}

	public void setMycNo(int mycNo) {
		this.mycNo = mycNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getMycComment() {
		return mycComment;
	}

	public void setMycComment(String mycComment) {
		this.mycComment = mycComment;
	}

	public Date getMycCommentDate() {
		return mycCommentDate;
	}

	public void setMycCommentDate(Date mycCommentDate) {
		this.mycCommentDate = mycCommentDate;
	}

	public int getMycCommentStar() {
		return mycCommentStar;
	}

	public void setMycCommentStar(int mycCommentStar) {
		this.mycCommentStar = mycCommentStar;
	}

	public String getMycCommentStatus() {
		return mycCommentStatus;
	}

	public void setMycCommentStatus(String mycCommentStatus) {
		this.mycCommentStatus = mycCommentStatus;
	}

	@Override
	public String toString() {
		return "MyCampComment [mycCommentNo=" + mycCommentNo + ", mycNo=" + mycNo + ", mId=" + mId + ", mycComment="
				+ mycComment + ", mycCommentDate=" + mycCommentDate + ", mycCommentStar=" + mycCommentStar
				+ ", mycCommentStatus=" + mycCommentStatus + "]";
	}

}
