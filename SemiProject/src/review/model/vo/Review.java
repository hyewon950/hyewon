package review.model.vo;

import java.sql.Date;

public class Review {

	 private int rvNo;
	   private int saleNo;
	   private int bmSellerNo;
	   private String mId;
	   private String rvContent;
	   private Date rvRegDate;

	   public Review() {
	   }

	   public Review(int rvNo, int saleNo, int bmSellerNo, String mId, String rvContent, Date rvRegDate) {
	      super();
	      this.rvNo = rvNo;
	      this.saleNo = saleNo;
	      this.bmSellerNo = bmSellerNo;
	      this.mId = mId;
	      this.rvContent = rvContent;
	      this.rvRegDate = rvRegDate;
	   }

	   public int getRvNo() {
	      return rvNo;
	   }

	   public void setRvNo(int rvNo) {
	      this.rvNo = rvNo;
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

	   public String getmId() {
	      return mId;
	   }

	   public void setmId(String mId) {
	      this.mId = mId;
	   }

	   public String getRvContent() {
	      return rvContent;
	   }

	   public void setRvContent(String rvContent) {
	      this.rvContent = rvContent;
	   }

	   public Date getRvRegDate() {
	      return rvRegDate;
	   }

	   public void setRvRegDate(Date rvRegDate) {
	      this.rvRegDate = rvRegDate;
	   }

	   
}
