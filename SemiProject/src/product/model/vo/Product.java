package product.model.vo;

public class Product {

	private int prdNo;
	private int saleNo;
	private int bmSellerNo;
	private String prdBrand;
	private String prdName;
	private String prdClass;
	private int prdPrice;
	private int prdAmount;
	private String prdArea;
	private String saleSubject;
	private String saleImgName;

	public Product() {
	}

	public Product(int prdNo, int saleNo, int bmSellerNo, String prdBrand, String prdName, String prdClass,
			int prdPrice, int prdAmount, String prdArea, String saleSubject, String saleImgName) {
		super();
		this.prdNo = prdNo;
		this.saleNo = saleNo;
		this.bmSellerNo = bmSellerNo;
		this.prdBrand = prdBrand;
		this.prdName = prdName;
		this.prdClass = prdClass;
		this.prdPrice = prdPrice;
		this.prdAmount = prdAmount;
		this.prdArea = prdArea;
		this.saleSubject = saleSubject;
		this.saleImgName = saleImgName;
	}

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

	public String getPrdBrand() {
		return prdBrand;
	}

	public void setPrdBrand(String prdBrand) {
		this.prdBrand = prdBrand;
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

	public int getPrdAmount() {
		return prdAmount;
	}

	public void setPrdAmount(int prdAmount) {
		this.prdAmount = prdAmount;
	}

	public String getPrdArea() {
		return prdArea;
	}

	public void setPrdArea(String prdArea) {
		this.prdArea = prdArea;
	}

	public String getSaleSubject() {
		return saleSubject;
	}

	public void setSaleSubject(String saleSubject) {
		this.saleSubject = saleSubject;
	}

	public String getSaleImgName() {
		return saleImgName;
	}

	public void setSaleImgName(String saleImgName) {
		this.saleImgName = saleImgName;
	}
	

}
