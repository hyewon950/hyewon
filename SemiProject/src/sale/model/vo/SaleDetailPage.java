package sale.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import questAnswer.model.vo.QuestAnswer;

public class SaleDetailPage {
//
	   private int saleNo;
	   private int bmSellerNo;
	   private String saleSubject;
	   private String saleContent;
	   private int saleView;
	   private Date saleRegDate;
	   private String saleImgName;
	   private String prdBrand;
	   private String prdClass;
	   private int prdPrice;
	   private String prdArea;
	   private int prdNo;
	   private ArrayList<QuestAnswer> qnas;





	public ArrayList<QuestAnswer> getQnas() {
		return qnas;
	}

	public void setQnas(ArrayList<QuestAnswer> qnas) {
		this.qnas = qnas;
	}

	public SaleDetailPage() {};
	   
	public int getPrdNo() {
		return prdNo;
	}

	public void setPrdNo(int prdNo) {
		this.prdNo = prdNo;
	} 
	   
	public int getSaleNo() {
		return saleNo;
	}
	public void setSaleNo(int saleNo) {
		this.saleNo = saleNo;
	}
	public int getBmSellerNo() {
		return bmSellerNo;
	}
	public void setBmSellerNo(int bmSellerNo) {
		this.bmSellerNo = bmSellerNo;
	}
	public String getSaleSubject() {
		return saleSubject;
	}
	public void setSaleSubject(String saleSubject) {
		this.saleSubject = saleSubject;
	}
	public String getSaleContent() {
		return saleContent;
	}
	public void setSaleContent(String salecontent) {
		this.saleContent = salecontent;
	}
	public int getSaleView() {
		return saleView;
	}
	public void setSaleView(int saleView) {
		this.saleView = saleView;
	}
	public Date getSaleRegDate() {
		return saleRegDate;
	}
	public void setSaleRegDate(Date saleRegDate) {
		this.saleRegDate = saleRegDate;
	}

	public String getPrdBrand() {
		return prdBrand;
	}
	public void setPrdBrand(String prdBrand) {
		this.prdBrand = prdBrand;
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
	public String getPrdArea() {
		return prdArea;
	}
	public void setPrdArea(String prdArea) {
		this.prdArea = prdArea;
	}

	public String getSaleImgName() {
		return saleImgName;
	}

	public void setSaleImgName(String saleImgName) {
		this.saleImgName = saleImgName;
	}

	
}
