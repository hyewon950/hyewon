package org.kh.camp.files.domain;

public class Files {

	private int fileNo;
	private String mId;
	private int bNo;
	private String fileName;
	private String filePath;
	
	public Files() {}

	public Files(int fileNo, String mId, int bNo, String fileName, String filePath) {
		super();
		this.fileNo = fileNo;
		this.mId = mId;
		this.bNo = bNo;
		this.fileName = fileName;
		this.filePath = filePath;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "Files [fileNo=" + fileNo + ", mId=" + mId + ", bNo=" + bNo + ", fileName=" + fileName + ", filePath="
				+ filePath + "]";
	}

	

	
	
}
