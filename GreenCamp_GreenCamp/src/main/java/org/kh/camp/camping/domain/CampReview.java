package org.kh.camp.camping.domain;

import java.sql.Date;

public class CampReview {

	
	private Integer rvNo; //후기 번호
	private Integer resNo; //예약번호
	private int cNo;  //캠프장번호
	private String mId;//아이디
	private String rvContent; //내용
	private Date rvDate; //작성날짜
	private int commentStar; //별점
	
	public CampReview() {}
	
	public Integer getRvNo() {
		return rvNo;
	}
	public void setRvNo(Integer rvNo) {
		this.rvNo = rvNo;
	}
	public Integer getResNo() {
		return resNo;
	}
	public void setResNo(Integer resNo) {
		this.resNo = resNo;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getRvContent() {
		return rvContent;
	}
	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}
	public Date getRvDate() {
		return rvDate;
	}
	public void setRvDate(Date rvDate) {
		this.rvDate = rvDate;
	}
	public int getCommentStar() {
		return commentStar;
	}
	public void setCommentStar(int commentStar) {
		this.commentStar = commentStar;
	}
	@Override
	public String toString() {
		return "CampReview [rvNo=" + rvNo + ", resNo=" + resNo + ", cNo=" + cNo + ", mId=" + mId + ", rvContent="
				+ rvContent + ", rvDate=" + rvDate + ", commentStar=" + commentStar + "]";
	}
	public CampReview(Integer rvNo, Integer resNo, int cNo, String mId, String rvContent, Date rvDate,
			int commentStar) {
		super();
		this.rvNo = rvNo;
		this.resNo = resNo;
		this.cNo = cNo;
		this.mId = mId;
		this.rvContent = rvContent;
		this.rvDate = rvDate;
		this.commentStar = commentStar;
	}
	
	
	
}
