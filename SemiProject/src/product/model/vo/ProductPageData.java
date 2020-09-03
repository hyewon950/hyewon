package product.model.vo;

import java.util.ArrayList;

public class ProductPageData {

	private ArrayList<Product> pageList;
	private String pageNavi;
	
	public ProductPageData() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Product> getPageList() {
		return pageList;
	}

	public void setPageList(ArrayList<Product> pageList) {
		this.pageList = pageList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
