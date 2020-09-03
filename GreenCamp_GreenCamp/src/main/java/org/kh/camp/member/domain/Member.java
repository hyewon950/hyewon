package org.kh.camp.member.domain;

import java.sql.Date;

public class Member {

	private String mId;
	private String mPwd;
	private String mName;
	private String mBirthday;
	private String mEmail;
	private String mPhone;
	private Date mEnrollDate;
	private int mNo;
	private String mStatusYN; 
	private String mKey;
	
	public Member() {}

	public Member(String mId, String mPwd, String mName, String mBirthday, String mEmail, String mPhone,
			Date mEnrollDate, int mNo, String mStatusYN, String mKey) {
		super();
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mBirthday = mBirthday;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mEnrollDate = mEnrollDate;
		this.mNo = mNo;
		this.mStatusYN = mStatusYN;
		this.mKey = mKey;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmBirthday() {
		return mBirthday;
	}

	public void setmBirthday(String mBirthday) {
		this.mBirthday = mBirthday;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public Date getmEnrollDate() {
		return mEnrollDate;
	}

	public void setmEnrollDate(Date mEnrollDate) {
		this.mEnrollDate = mEnrollDate;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmStatusYN() {
		return mStatusYN;
	}

	public void setmStatusYN(String mStatusYN) {
		this.mStatusYN = mStatusYN;
	}

	public String getmKey() {
		return mKey;
	}

	public void setmKey(String mKey) {
		this.mKey = mKey;
	}
	
	public void setmKey(String mKey, String mId) {
		this.mId = mId;
		this.mKey = mKey;
	}

	@Override
	public String toString() {
		return "Member [mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName + ", mBirthday=" + mBirthday + ", mEmail="
				+ mEmail + ", mPhone=" + mPhone + ", mEnrollDate=" + mEnrollDate + ", mNo=" + mNo + ", mStatusYN="
				+ mStatusYN + ", mKey=" + mKey + "]";
	}

	
	
	
	
}
