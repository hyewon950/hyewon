package org.kh.camp.used.domain;

import java.sql.Date;

public class UsedBoard {

	// 글번호
	private int usedNo;

	// 회원아이디
	private String mId;

	// 제목
	private String usedTitle;

	// 작성자
	private String usedWriter;

	// 글 내용
	private String usedContent;

	// 원본 파일 이름
	private String usedOriginalFilename;

	// 파일 수정 이름
	private String usedRenameFilename;

	// 조회수
	private int usedCount;

	// 작성일자
	private Date usedCreateDate;

	// 글상태
	private String usedStatus;

	// 구매확정 여부
	private String usedYn;

	// 가격
	private int usedPrice;

	private String usedArea;

	public UsedBoard() {
	}

	public UsedBoard(int usedNo, String mId, String usedTitle, String usedWriter, String usedContent,
			String usedOriginalFilename, String usedRenameFilename, int usedCount, Date usedCreateDate,
			String usedStatus, String usedYn, int usedPrice, String usedArea) {
		super();
		this.usedNo = usedNo;
		this.mId = mId;
		this.usedTitle = usedTitle;
		this.usedWriter = usedWriter;
		this.usedContent = usedContent;
		this.usedOriginalFilename = usedOriginalFilename;
		this.usedRenameFilename = usedRenameFilename;
		this.usedCount = usedCount;
		this.usedCreateDate = usedCreateDate;
		this.usedStatus = usedStatus;
		this.usedYn = usedYn;
		this.usedPrice = usedPrice;
		this.usedArea = usedArea;
	}
	

	public int getUsedNo() {
		return usedNo;
	}

	public void setUsedNo(int usedNo) {
		this.usedNo = usedNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getUsedTitle() {
		return usedTitle;
	}

	public void setUsedTitle(String usedTitle) {
		this.usedTitle = usedTitle;
	}

	public String getUsedWriter() {
		return usedWriter;
	}

	public void setUsedWriter(String usedWriter) {
		this.usedWriter = usedWriter;
	}

	public String getUsedContent() {
		return usedContent;
	}

	public void setUsedContent(String usedContent) {
		this.usedContent = usedContent;
	}



	public String getUsedOriginalFilename() {
		return usedOriginalFilename;
	}

	public void setUsedOriginalFilename(String usedOriginalFilename) {
		this.usedOriginalFilename = usedOriginalFilename;
	}

	public String getUsedRenameFilename() {
		return usedRenameFilename;
	}

	public void setUsedRenameFilename(String usedRenameFilename) {
		this.usedRenameFilename = usedRenameFilename;
	}

	public int getUsedCount() {
		return usedCount;
	}

	public void setUsedCount(int usedCount) {
		this.usedCount = usedCount;
	}

	public Date getUsedCreateDate() {
		return usedCreateDate;
	}

	public void setUsedCreateDate(Date usedCreateDate) {
		this.usedCreateDate = usedCreateDate;
	}

	public String getUsedStatus() {
		return usedStatus;
	}

	public void setUsedStatus(String usedStatus) {
		this.usedStatus = usedStatus;
	}

	public String getUsedYn() {
		return usedYn;
	}

	public void setUsedYn(String usedYn) {
		this.usedYn = usedYn;
	}

	public int getUsedPrice() {
		return usedPrice;
	}

	public void setUsedPrice(int usedPrice) {
		this.usedPrice = usedPrice;
	}

	public String getUsedArea() {
		return usedArea;
	}

	public void setUsedArea(String usedArea) {
		this.usedArea = usedArea;
	}

	@Override
	public String toString() {
		return "UsedBoard [usedNo=" + usedNo + ", mId=" + mId + ", usedTitle=" + usedTitle + ", usedWriter="
				+ usedWriter + ", usedContent=" + usedContent + ", usedOriginalFilename=" + usedOriginalFilename
				+ ", usedRenameFilename=" + usedRenameFilename + ", usedCount=" + usedCount + ", usedCreateDate="
				+ usedCreateDate + ", usedStatus=" + usedStatus + ", usedYn=" + usedYn + ", usedPrice=" + usedPrice
				+ ", usedArea=" + usedArea + "]";
	}

}