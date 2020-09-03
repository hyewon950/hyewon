package questAnswer.model.vo;

import java.util.ArrayList;

import sale.model.vo.SaleDetailPage;

public class QnaPageData {

	private ArrayList<QuestAnswer> salePage;
	private String pageNavi = null;
	
	public QnaPageData() {}
	

	public ArrayList<QuestAnswer> getSalePage() {
		return salePage;
	}


	public void setSalePage(ArrayList<QuestAnswer> salePage) {
		this.salePage = salePage;
	}


	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
