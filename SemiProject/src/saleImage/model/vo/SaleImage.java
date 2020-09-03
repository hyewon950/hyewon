package saleImage.model.vo;

import java.security.Timestamp;

public class SaleImage {

	 private int saleImgNo;
	   private int saleNo;
	   private int bmSellerNo;
	   private String saleImgName;
	   private String saleImgPath;
	   private int saleImgSize;
	   private String saleImgUser;
	   private Timestamp saleUpload;
	   private String prdName;
	   private String prdClass;
	   private int saleView;
		

	   public SaleImage() {
	   }

	   public SaleImage(int saleImgNo, int saleNo, int bmSellerNo, String saleImgName, String saleImgPath, int saleImgSize,
	         String saleImgUser, Timestamp saleUpload, String prdName, String prdClass, int saleView) {
	      super();
	      this.saleImgNo = saleImgNo;
	      this.saleNo = saleNo;
	      this.bmSellerNo = bmSellerNo;
	      this.saleImgName = saleImgName;
	      this.saleImgPath = saleImgPath;
	      this.saleImgSize = saleImgSize;
	      this.saleImgUser = saleImgUser;
	      this.saleUpload = saleUpload;
	      this.prdName = prdName;
	      this.prdClass = prdClass;
	      this.saleView = saleView;
	   }

	   public int getSaleImgNo() {
	      return saleImgNo;
	   }

	   public void setSaleImgNo(int saleImgNo) {
	      this.saleImgNo = saleImgNo;
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

	   public String getSaleImgName() {
	      return saleImgName;
	   }

	   public void setSaleImgName(String saleImgName) {
	      this.saleImgName = saleImgName;
	   }

	   public String getSaleImgPath() {
	      return saleImgPath;
	   }

	   public void setSaleImgPath(String saleImgPath) {
	      this.saleImgPath = saleImgPath;
	   }

	   public int getSaleImgSize() {
	      return saleImgSize;
	   }

	   public void setSaleImgSize(int saleImgSize) {
	      this.saleImgSize = saleImgSize;
	   }

	   public String getSaleImgUser() {
	      return saleImgUser;
	   }

	   public void setSaleImgUser(String saleImgUser) {
	      this.saleImgUser = saleImgUser;
	   }

	   public Timestamp getSaleUpload() {
	      return saleUpload;
	   }

	   public void setSaleUpload(Timestamp saleUpload) {
	      this.saleUpload = saleUpload;
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

	public int getSaleView() {
		return saleView;
	}

	public void setSaleView(int saleView) {
		this.saleView = saleView;
	}
	   

	   
}
