package org.kh.camp.mycamp.domain;

public class MyCampSearch {
	
	private String mycSearchCondition;
	private String mycSearchValue;
	private String mycExistFile;
	private String mycSearchTag;
	
	public MyCampSearch() {
	}

	public MyCampSearch(String mycSearchCondition, String mycSearchValue, String mycExistFile, String mycSearchTag) {
		super();
		this.mycSearchCondition = mycSearchCondition;
		this.mycSearchValue = mycSearchValue;
		this.mycExistFile = mycExistFile;
		this.mycSearchTag = mycSearchTag;
	}

	public String getMycSearchCondition() {
		return mycSearchCondition;
	}

	public void setMycSearchCondition(String mycSearchCondition) {
		this.mycSearchCondition = mycSearchCondition;
	}

	public String getMycSearchValue() {
		return mycSearchValue;
	}

	public void setMycSearchValue(String mycSearchValue) {
		this.mycSearchValue = mycSearchValue;
	}

	public String getMycExistFile() {
		return mycExistFile;
	}

	public void setMycExistFile(String mycExistFile) {
		this.mycExistFile = mycExistFile;
	}

	public String getMycSearchTag() {
		return mycSearchTag;
	}

	public void setMycSearchTag(String mycSearchTag) {
		this.mycSearchTag = mycSearchTag;
	}

}
