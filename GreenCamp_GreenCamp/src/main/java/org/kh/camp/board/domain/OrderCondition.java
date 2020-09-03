package org.kh.camp.board.domain;

public class OrderCondition {
	private String bType;
	private String typeData;
	public OrderCondition() {
		// TODO Auto-generated constructor stub
	}
	
	public OrderCondition(String bType, String typeData) {
		super();
		this.bType = bType;
		this.typeData = typeData;
	}

	public String getbType() {
		return bType;
	}
	public void setbType(String bType) {
		this.bType = bType;
	}
	public String getTypeData() {
		return typeData;
	}
	public void setTypeData(String typeData) {
		this.typeData = typeData;
	}

	@Override
	public String toString() {
		return "OrderCondition [bType=" + bType + ", typeData=" + typeData + "]";
	}
	
}
