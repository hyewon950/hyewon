package sale.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import questAnswer.model.vo.QuestAnswer;

public class Sale {
	private int saleNo;
	private int bmSellerNo;
	private String saleId;
	private String saleSubject;
	private String salecontent;
	private int saleView;
	private int saleRecommend;
	private Date saleRegDate;
	// Q&A
	private ArrayList<QuestAnswer> qna = null;
	private String prdName;
	private String prdClass;
	private int prdPrice; 
	private String saleImgName;


	// github 확인
	public Sale() {
	}

	public Sale(int saleNO, int bmSellerNo, String saleId, String saleSubject, String salecontent, int saleView,
		int saleRecommend, Date saleRegDate, String prdName, String prdClass, int prdPrice, String saleImgName) {
		this.saleNo = saleNO;
		this.bmSellerNo = bmSellerNo;
		this.saleId = saleId;
		this.saleSubject = saleSubject;
		this.salecontent = salecontent;
		this.saleView = saleView;
		this.saleRecommend = saleRecommend;
		this.saleRegDate = saleRegDate;
		this.prdName = prdName;
		this.prdClass = prdClass;
		this.prdPrice = prdPrice;
		this.saleImgName = saleImgName;
	}

	public int getBmSellerNo() {
		return bmSellerNo;
	}

	public void setBmSellerNo(int bmSellerNo) {
		this.bmSellerNo = bmSellerNo;
	}
	
	public int getSaleNo() {
		return saleNo;
	}

	public void setSaleNo(int saleNo) {
		this.saleNo = saleNo;
	}

	public String getSaleId() {
		return saleId;
	}

	public void setSaleId(String saleId) {
		this.saleId = saleId;
	}

	public String getSaleSubject() {
		return saleSubject;
	}

	public void setSaleSubject(String saleSubject) {
		this.saleSubject = saleSubject;
	}

	public String getSalecontent() {
		return salecontent;
	}

	public void setSalecontent(String salecontent) {
		this.salecontent = salecontent;
	}

	public int getSaleView() {
		return saleView;
	}

	public void setSaleView(int saleView) {
		this.saleView = saleView;
	}

	public int getSaleRecommend() {
		return saleRecommend;
	}

	public void setSaleRecommend(int saleRecommend) {
		this.saleRecommend = saleRecommend;
	}

	public Date getSaleRegDate() {
		return saleRegDate;
	}

	public void setSaleRegDate(Date saleRegDate) {
		this.saleRegDate = saleRegDate;
	}

	public ArrayList<QuestAnswer> getQna() {
		return qna;
	}

	public void setQna(ArrayList<QuestAnswer> qna) {
		this.qna = qna;
	}
	
	public String getPrdName() {
		return prdName;
	}
	
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	
	public String getPrdClass() {
		return prdClass;
	}

	public void setPrdClass(String prdClass) {
		this.prdClass = prdClass;
	}

	public int getPrdPrice() {
		return prdPrice;
	}

	public void setPrdPrice(int prdPrice) {
		this.prdPrice = prdPrice;
	}

	public String getSaleImgName() {
		return saleImgName;
	}

	public void setSaleImgName(String saleImgName) {
		this.saleImgName = saleImgName;
	}
	

}
