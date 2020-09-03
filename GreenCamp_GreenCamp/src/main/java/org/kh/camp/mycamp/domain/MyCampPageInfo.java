package org.kh.camp.mycamp.domain;

public class MyCampPageInfo {
	
	private int mycCurrentPage;
	private int mycListCount;
	private int mycPageLimit;
	private int mycMaxPage;
	private int mycStartPage;
	private int mycEndPage;
	private int mycBoardLimit;
	
	public MyCampPageInfo() {}
	
	public MyCampPageInfo(int mycCurrentPage, int mycListCount, int mycPageLimit, int mycMaxPage, int mycStartPage,
			int mycEndPage, int mycBoardLimit) {
		super();
		this.mycCurrentPage = mycCurrentPage;
		this.mycListCount = mycListCount;
		this.mycPageLimit = mycPageLimit;
		this.mycMaxPage = mycMaxPage;
		this.mycStartPage = mycStartPage;
		this.mycEndPage = mycEndPage;
		this.mycBoardLimit = mycBoardLimit;
	}

	public int getMycCurrentPage() {
		return mycCurrentPage;
	}

	public void setMycCurrentPage(int mycCurrentPage) {
		this.mycCurrentPage = mycCurrentPage;
	}

	public int getMycListCount() {
		return mycListCount;
	}

	public void setMycListCount(int mycListCount) {
		this.mycListCount = mycListCount;
	}

	public int getMycPageLimit() {
		return mycPageLimit;
	}

	public void setMycPageLimit(int mycPageLimit) {
		this.mycPageLimit = mycPageLimit;
	}

	public int getMycMaxPage() {
		return mycMaxPage;
	}

	public void setMycMaxPage(int mycMaxPage) {
		this.mycMaxPage = mycMaxPage;
	}

	public int getMycStartPage() {
		return mycStartPage;
	}

	public void setMycStartPage(int mycStartPage) {
		this.mycStartPage = mycStartPage;
	}

	public int getMycEndPage() {
		return mycEndPage;
	}

	public void setMycEndPage(int mycEndPage) {
		this.mycEndPage = mycEndPage;
	}

	public int getMycBoardLimit() {
		return mycBoardLimit;
	}

	public void setMycBoardLimit(int mycBoardLimit) {
		this.mycBoardLimit = mycBoardLimit;
	}

	@Override
	public String toString() {
		return "MyCampPageInfo [mycCurrentPage=" + mycCurrentPage + ", mycListCount=" + mycListCount + ", mycPageLimit="
				+ mycPageLimit + ", mycMaxPage=" + mycMaxPage + ", mycStartPage=" + mycStartPage + ", mycEndPage="
				+ mycEndPage + ", mycBoardLimit=" + mycBoardLimit + "]";
	}
	
}
