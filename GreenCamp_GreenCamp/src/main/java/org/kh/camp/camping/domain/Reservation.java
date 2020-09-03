package org.kh.camp.camping.domain;

import java.sql.Date;

public class Reservation {

	private int resNo;
	private int cNo;
	private String startDate;
	private String endDate;
	private String mId;
	private int sumPeople;
	
	public Reservation() {}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getSumPeople() {
		return sumPeople;
	}

	public void setSumPeople(int sumPeople) {
		this.sumPeople = sumPeople;
	}

	public Reservation(int resNo, int cNo, String startDate, String endDate, String mId, int sumPeople) {
		super();
		this.resNo = resNo;
		this.cNo = cNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.mId = mId;
		this.sumPeople = sumPeople;
	}

	@Override
	public String toString() {
		return "Reservation [resNo=" + resNo + ", cNo=" + cNo + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", mId=" + mId + ", sumPeople=" + sumPeople + "]";
	}


}
