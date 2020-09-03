package community.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import comment.model.vo.Comment;

public class Community {

	private int postNo;
	private String postKinds;
	private String postWriter;
	private String postSubject;
	private String postContent;
	private int postRecommended;
	private int postViews;
	private Date postRegDate;
	private ArrayList<Comment> comment;
	
	public ArrayList<Comment> getComment() {
		return comment;
	}

	public void setComment(ArrayList<Comment> comment) {
		this.comment = comment;
	}

	public Community() {}
	
	public Community(int postNo, String postKinds, String postWriter, String postSubJect, String postContent,
			int postRecommended, int postViews, Date postRegDate) {
		super();
		this.postNo = postNo;
		this.postKinds = postKinds;
		this.postWriter = postWriter;
		this.postSubject = postSubJect;
		this.postContent = postContent;
		this.postRecommended = postRecommended;
		this.postViews = postViews;
		this.postRegDate = postRegDate;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getPostKinds() {
		return postKinds;
	}

	public void setPostKinds(String postKinds) {
		this.postKinds = postKinds;
	}

	public String getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	public String getPostSubject() {
		return postSubject;
	}

	public void setPostSubject(String postSubJect) {
		this.postSubject = postSubJect;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public int getPostRecommended() {
		return postRecommended;
	}

	public void setPostRecommended(int postRecommended) {
		this.postRecommended = postRecommended;
	}

	public int getPostViews() {
		return postViews;
	}

	public void setPostViews(int postViews) {
		this.postViews = postViews;
	}

	public Date getPostRegDate() {
		return postRegDate;
	}

	public void setPostRegDate(Date postRegDate) {
		this.postRegDate = postRegDate;
	}
	
	
	
}
