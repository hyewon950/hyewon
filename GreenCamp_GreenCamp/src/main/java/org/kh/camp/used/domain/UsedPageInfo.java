package org.kh.camp.used.domain;

import java.sql.Date;

public class UsedPageInfo {

	private int usedCurrentPage;
	private int usedListCount;
	private int usedPageLimit;
	private int usedMaxPage;
	private int usedStartPage;
	private int usedEndPage;
	private int usedBoardLimit;
	
	public UsedPageInfo() {}

	public UsedPageInfo(int usedCurrentPage, int usedListCount, int usedPageLimit, int usedMaxPage, int usedStartPage,
			int usedEndPage, int usedBoardLimit) {
		super();
		this.usedCurrentPage = usedCurrentPage;
		this.usedListCount = usedListCount;
		this.usedPageLimit = usedPageLimit;
		this.usedMaxPage = usedMaxPage;
		this.usedStartPage = usedStartPage;
		this.usedEndPage = usedEndPage;
		this.usedBoardLimit = usedBoardLimit;
	}

	public int getUsedCurrentPage() {
		return usedCurrentPage;
	}

	public void setUsedCurrentPage(int usedCurrentPage) {
		this.usedCurrentPage = usedCurrentPage;
	}

	public int getUsedListCount() {
		return usedListCount;
	}

	public void setUsedListCount(int usedListCount) {
		this.usedListCount = usedListCount;
	}

	public int getUsedPageLimit() {
		return usedPageLimit;
	}

	public void setUsedPageLimit(int usedPageLimit) {
		this.usedPageLimit = usedPageLimit;
	}

	public int getUsedMaxPage() {
		return usedMaxPage;
	}

	public void setUsedMaxPage(int usedMaxPage) {
		this.usedMaxPage = usedMaxPage;
	}

	public int getUsedStartPage() {
		return usedStartPage;
	}

	public void setUsedStartPage(int usedStartPage) {
		this.usedStartPage = usedStartPage;
	}

	public int getUsedEndPage() {
		return usedEndPage;
	}

	public void setUsedEndPage(int usedEndPage) {
		this.usedEndPage = usedEndPage;
	}

	public int getUsedBoardLimit() {
		return usedBoardLimit;
	}

	public void setUsedBoardLimit(int usedBoardLimit) {
		this.usedBoardLimit = usedBoardLimit;
	}

	@Override
	public String toString() {
		return "UsedPageInfo [usedCurrentPage=" + usedCurrentPage + ", usedListCount=" + usedListCount
				+ ", usedPageLimit=" + usedPageLimit + ", usedMaxPage=" + usedMaxPage + ", usedStartPage="
				+ usedStartPage + ", usedEndPage=" + usedEndPage + ", usedBoardLimit=" + usedBoardLimit + "]";
	}
	
	
	
}
