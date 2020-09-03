package org.kh.camp.mycamp.domain;

public class MyCampLike {

	private int mycLikeNo;
	private int mycNo;
	private String mId;
	private String myclikeClick;
	
	public MyCampLike() {}

	public MyCampLike(int mycLikeNo, int mycNo, String mId, String myclikeClick) {
		super();
		this.mycLikeNo = mycLikeNo;
		this.mycNo = mycNo;
		this.mId = mId;
		this.myclikeClick = myclikeClick;
	}

	public int getMycLikeNo() {
		return mycLikeNo;
	}

	public void setMycLikeNo(int mycLikeNo) {
		this.mycLikeNo = mycLikeNo;
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

	public String getMyclikeClick() {
		return myclikeClick;
	}

	public void setMyclikeClick(String myclikeClick) {
		this.myclikeClick = myclikeClick;
	}

	@Override
	public String toString() {
		return "MyCampLike [mycLikeNo=" + mycLikeNo + ", mycNo=" + mycNo + ", mId=" + mId + ", myclikeClick="
				+ myclikeClick + "]";
	}
	
}
