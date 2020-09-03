package orderList.model.vo;

import java.sql.Date;

public class OrderList {
   
   private int buyNo;   //구매고유번호
   private int prdNo;   //상품고유번호
   private String mId;   //아이디
   private int buyAmount;   //수량
   private String buyCheck;   //구매여부
   private String buyBasket;   //장바구니
   private Date buyDate;   //구매일
   private String prdName; 
   // 상품-상품명,상품가격,총가격
   private String prdBrand;
   private int prdPrice;
   private int sumPrice;
   private String imgName;
   private int saleNo;
 /*  ArrayList Order
   while() {
	   img = new DAO
			   arr.get(i).setimg();
   }*/
   
   public OrderList() {}
   
  
   public OrderList(int buyNo, int prdNo, String mId, int buyAmount, String buyCheck, String buyBasket, Date buyDate) {
      super();
      this.buyNo = buyNo;
      this.prdNo = prdNo;
      this.mId = mId;
      this.buyAmount = buyAmount;
      this.buyCheck = buyCheck;
      this.buyBasket = buyBasket;
      this.buyDate = buyDate;
   }

   
   // 상품명, 가격,사업자이름, 이미지이름
   public OrderList(int buyNo, int prdNo, String mId, int buyAmount, String buyCheck, String buyBasket, Date buyDate,
		String prdName, String prdBrand, int prdPrice, int sumPrice, String imgName) {
	super();
	this.buyNo = buyNo;
	this.prdNo = prdNo;
	this.mId = mId;
	this.buyAmount = buyAmount;
	this.buyCheck = buyCheck;
	this.buyBasket = buyBasket;
	this.buyDate = buyDate;
	this.prdName = prdName;
	this.prdBrand = prdBrand;
	this.prdPrice = prdPrice;
	this.sumPrice = sumPrice;
	this.imgName = imgName;
}


public int getBuyNo() {
      return buyNo;
   }

   public void setBuyNo(int buyNo) {
      this.buyNo = buyNo;
   }

   public int getPrdNo() {
      return prdNo;
   }

   public void setPrdNo(int prdNo) {
      this.prdNo = prdNo;
   }

   public String getmId() {
      return mId;
   }
      
   public void setmId(String mId) {
      this.mId = mId;
   }

   public int getBuyAmount() {
      return buyAmount;
   }

   public void setBuyAmount(int buyAmount) {
      this.buyAmount = buyAmount;
   }

   public String getBuyCheck() {
      return buyCheck;
   }

   public void setBuyCheck(String buyCheck) {
      this.buyCheck = buyCheck;
   }

   public String getBuyBasket() {
      return buyBasket;
   }

   public void setBuyBasket(String buyBasket) {
      this.buyBasket = buyBasket;
   }

   public String getPrdName() {
	return prdName;
}


public void setPrdName(String prdName) {
	this.prdName = prdName;
}


public String getPrdBrand() {
	return prdBrand;
}


public void setPrdBrand(String prdBrand) {
	this.prdBrand = prdBrand;
}


public int getPrdPrice() {
	return prdPrice;
}


public void setPrdPrice(int prdPrice) {
	this.prdPrice = prdPrice;
}


public int getSumPrice() {
	return sumPrice;
}


public void setSumPrice(int sumPrice) {
	this.sumPrice = sumPrice;
}


public void setBuyDate(Date buyDate) {
	this.buyDate = buyDate;
}


public Date getBuyDate() {
      return buyDate;
   }


public String getImgName() {
	return imgName;
}


public void setImgName(String imgName) {
	this.imgName = imgName;
}


public int getSaleNo() {
	return saleNo;
}


public void setSaleNo(int saleNo) {
	this.saleNo = saleNo;
}



}