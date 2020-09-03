package review.model.vo;

import java.util.ArrayList;

import javax.servlet.jsp.tagext.PageData;

public class ReviewPageData {

	private ArrayList<Review> reviewList=null;
	private String PageNavi=null;
	private int countNum=0;
	


	public ReviewPageData() {};
	
	public ArrayList<Review> getReviewList() {
		return reviewList;
	}
	public void setReviewList(ArrayList<Review> reviewList) {
		this.reviewList = reviewList;
	}

	public String getPageNavi() {
		return PageNavi;
	}

	public void setPageNavi(String pageNavi) {
		PageNavi = pageNavi;
	}
	public int getCountNum() {
		return countNum;
	}

	public void setCountNum(int countNum) {
		this.countNum = countNum;
	}
	
}
