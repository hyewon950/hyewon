package org.kh.camp.mycamp.domain;

import java.sql.Date;

public class MyCamp {

	private int mycNo;
	private String mId;
	private String mycTitle;
	private String mycPlace;
	private String mycDetail;
	private String mycTag;
	private Date mycWriteDate;
	private Date mycModifyDate;
	private int mycViewCnt;
	private int mycLikeCnt;
	//private int commentStar;
	private String mycStatusYN;
	
	public MyCamp() {}

	public MyCamp(int mycNo, String mId, String mycTitle, String mycPlace, String mycDetail, String mycTag,
			Date mycWriteDate, Date mycModifyDate, int mycViewCnt, int mycLikeCnt, String mycStatusYN) {
		super();
		this.mycNo = mycNo;
		this.mId = mId;
		this.mycTitle = mycTitle;
		this.mycPlace = mycPlace;
		this.mycDetail = mycDetail;
		this.mycTag = mycTag;
		this.mycWriteDate = mycWriteDate;
		this.mycModifyDate = mycModifyDate;
		this.mycViewCnt = mycViewCnt;
		this.mycLikeCnt = mycLikeCnt;
		this.mycStatusYN = mycStatusYN;
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

	public String getMycTitle() {
		return mycTitle;
	}

	public void setMycTitle(String mycTitle) {
		this.mycTitle = mycTitle;
	}

	public String getMycPlace() {
		return mycPlace;
	}

	public void setMycPlace(String mycPlace) {
		this.mycPlace = mycPlace;
	}

	public String getMycDetail() {
		return mycDetail;
	}

	public void setMycDetail(String mycDetail) {
		this.mycDetail = mycDetail;
	}

	public String getMycTag() {
		return mycTag;
	}

	public void setMycTag(String mycTag) {
		this.mycTag = mycTag;
	}

	public Date getMycWriteDate() {
		return mycWriteDate;
	}

	public void setMycWriteDate(Date mycWriteDate) {
		this.mycWriteDate = mycWriteDate;
	}

	public Date getMycModifyDate() {
		return mycModifyDate;
	}

	public void setMycModifyDate(Date mycModifyDate) {
		this.mycModifyDate = mycModifyDate;
	}

	public int getMycViewCnt() {
		return mycViewCnt;
	}

	public void setMycViewCnt(int mycViewCnt) {
		this.mycViewCnt = mycViewCnt;
	}

	public int getMycLikeCnt() {
		return mycLikeCnt;
	}

	public void setMycLikeCnt(int mycLikeCnt) {
		this.mycLikeCnt = mycLikeCnt;
	}

	public String getMycStatusYN() {
		return mycStatusYN;
	}

	public void setMycStatusYN(String mycStatusYN) {
		this.mycStatusYN = mycStatusYN;
	}

	@Override
	public String toString() {
		return "MyCamp [mycNo=" + mycNo + ", mId=" + mId + ", mycTitle=" + mycTitle + ", mycPlace=" + mycPlace
				+ ", mycDetail=" + mycDetail + ", mycTag=" + mycTag + ", mycWriteDate=" + mycWriteDate
				+ ", mycModifyDate=" + mycModifyDate + ", mycViewCnt=" + mycViewCnt + ", mycLikeCnt=" + mycLikeCnt
				+ ", mycStatusYN=" + mycStatusYN + "]";
	}

}
