package sale.model.vo;

import java.util.ArrayList;

public class SalePageData {

	private ArrayList<Sale> pageList = null;
	private String pageNavi = null;
	
	public SalePageData() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Sale> getPageList() {
		return pageList;
	}

	public void setPageList(ArrayList<Sale> pageList) {
		this.pageList = pageList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
