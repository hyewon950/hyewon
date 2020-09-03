package org.kh.camp.used.domain;

import java.util.Date;

/*\\\\\\\\댓글\\\\\\\\\*/
public class UsedReply {

	private int commentNo;
	private int usedNo;
	private String usedRId;
	private String usedRContent;
	private int usedRefId;
	private String usedRWriter;
	private Date usedRCreateDate;
	
	public UsedReply() {} 
	
	public UsedReply(int commentNo, int usedNo, String usedRId, String usedRContent, int usedRefId, String usedRWriter,
			Date usedRCreateDate) {
		super();
		this.commentNo = commentNo;
		this.usedNo = usedNo;
		this.usedRId = usedRId;
		this.usedRContent = usedRContent;
		this.usedRefId = usedRefId;
		this.usedRWriter = usedRWriter;
		this.usedRCreateDate = usedRCreateDate;
	}


	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}


	public int getUsedNo() {
		return usedNo;
	}


	public void setUsedNo(int usedNo) {
		this.usedNo = usedNo;
	}


	public String getUsedRId() {
		return usedRId;
	}


	public void setUsedRId(String usedRId) {
		this.usedRId = usedRId;
	}


	public String getUsedRContent() {
		return usedRContent;
	}


	public void setUsedRContent(String usedRContent) {
		this.usedRContent = usedRContent;
	}


	public int getUsedRefId() {
		return usedRefId;
	}


	public void setUsedRefId(int usedRefId) {
		this.usedRefId = usedRefId;
	}


	public String getUsedRWriter() {
		return usedRWriter;
	}


	public void setUsedRWriter(String usedRWriter) {
		this.usedRWriter = usedRWriter;
	}


	public Date getUsedRCreateDate() {
		return usedRCreateDate;
	}


	public void setUsedRCreateDate(Date usedRCreateDate) {
		this.usedRCreateDate = usedRCreateDate;
	}


	@Override
	public String toString() {
		return "UsedReply [commentNo=" + commentNo + ", usedNo=" + usedNo + ", usedRId=" + usedRId + ", usedRContent="
				+ usedRContent + ", usedRefId=" + usedRefId + ", usedRWriter=" + usedRWriter + ", usedRCreateDate="
				+ usedRCreateDate + "]";
	}
	
	
	
	
	
	

}