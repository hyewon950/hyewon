package org.kh.camp.mycamp.domain;

import java.sql.Date;

public class MyCampFile {
	
	private int mycFileNo;
	private int mycNo;
	private String mycFileName;
	private Date mycFileDate;
	private String mycFilePath;
	
	public MyCampFile() {}

	public MyCampFile(int mycFileNo, int mycNo, String mycFileName, Date mycFileDate, String mycFilePath) {
		super();
		this.mycFileNo = mycFileNo;
		this.mycNo = mycNo;
		this.mycFileName = mycFileName;
		this.mycFileDate = mycFileDate;
		this.mycFilePath = mycFilePath;
	}

	public int getMycFileNo() {
		return mycFileNo;
	}

	public void setMycFileNo(int mycFileNo) {
		this.mycFileNo = mycFileNo;
	}

	public int getMycNo() {
		return mycNo;
	}

	public void setMycNo(int mycNo) {
		this.mycNo = mycNo;
	}

	public String getMycFileName() {
		return mycFileName;
	}

	public void setMycFileName(String mycFileName) {
		this.mycFileName = mycFileName;
	}

	public Date getMycFileDate() {
		return mycFileDate;
	}

	public void setMycFileDate(Date mycFileDate) {
		this.mycFileDate = mycFileDate;
	}

	public String getMycFilePath() {
		return mycFilePath;
	}

	public void setMycFilePath(String mycFilePath) {
		this.mycFilePath = mycFilePath;
	}

	@Override
	public String toString() {
		return "MyCampFile [mycFileNo=" + mycFileNo + ", mycNo=" + mycNo + ", mycFileName=" + mycFileName
				+ ", mycFileDate=" + mycFileDate + ", mycFilePath=" + mycFilePath + "]";
	}
	
}
