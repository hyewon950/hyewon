package org.kh.camp.board.domain;

import java.sql.Date;

public class Board {

	private int bNo;
	private String mId;
	private String bTitle;
	private String bDetail;
	private int bViewCnt;
	private int bLikeCnt;
	private Date bDate;
	private String bType;

	public Board() {}

	public Board(int bNo, String mId, String bTitle, String bDetail, int bViewCnt, int bLikeCnt, Date bDate,
			String bType) {
		super();
		this.bNo = bNo;
		this.mId = mId;
		this.bTitle = bTitle;
		this.bDetail = bDetail;
		this.bViewCnt = bViewCnt;
		this.bLikeCnt = bLikeCnt;
		this.bDate = bDate;
		this.bType = bType;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbDetail() {
		return bDetail;
	}

	public void setbDetail(String bDetail) {
		this.bDetail = bDetail;
	}

	public int getbViewCnt() {
		return bViewCnt;
	}

	public void setbViewCnt(int bViewCnt) {
		this.bViewCnt = bViewCnt;
	}

	public int getbLikeCnt() {
		return bLikeCnt;
	}

	public void setbLikeCnt(int bLikeCnt) {
		this.bLikeCnt = bLikeCnt;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", mId=" + mId + ", bTitle=" + bTitle + ", bDetail=" + bDetail + ", bViewCnt="
				+ bViewCnt + ", bLikeCnt=" + bLikeCnt + ", bDate=" + bDate + ", bType=" + bType + "]";
	}
	
	
	
}
