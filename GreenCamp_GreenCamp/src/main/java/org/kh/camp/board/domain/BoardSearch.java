package org.kh.camp.board.domain;

public class BoardSearch {

	
	private String searchCondition;
	private String searchValue;
	private String existFile;
	
	public BoardSearch() {}

	public BoardSearch(String searchCondition, String searchValue, String existFile) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.existFile = existFile;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getExistFile() {
		return existFile;
	}

	public void setExistFile(String existFile) {
		this.existFile = existFile;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", existFile="
				+ existFile + "]";
	}
}