package member.model.vo;

public class Member {

   private String mId;
   private String mPwd;
   private String mName;
   private int mPhone;
   private String mAddress1;	// 우편번호
   private String mAddress2;	//도로명
   private String mAddress3;	//지번
   private String mAddress4;	//상세
   
   public Member() {}

   
   public Member(String mId, String mPwd, String mName, int mPhone, String mAddress1, String mAddress2, String mAddress3,
		String mAddress4) {
	super();
	this.mId = mId;
	this.mPwd = mPwd;
	this.mName = mName;
	this.mPhone = mPhone;
	this.mAddress1 = mAddress1;
	this.mAddress2 = mAddress2;
	this.mAddress3 = mAddress3;
	this.mAddress4 = mAddress4;
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

   public int getmPhone() {
      return mPhone;
   }

   public void setmPhone(int mPhone) {
      this.mPhone = mPhone;
   }

   public String getmAddress1() {
      return mAddress1;
   }

   public void setmAddress1(String mAddress1) {
      this.mAddress1 = mAddress1;
   }

   public String getmAddress2() {
      return mAddress2;
   }

   public void setmAddress2(String mAddress2) {
      this.mAddress2 = mAddress2;
   }

   public String getmAddress3() {
      return mAddress3;
   }

   public void setmAddress3(String mAddress3) {
      this.mAddress3 = mAddress3;
   }

   public String getmAddress4() {
      return mAddress4;
   }

   public void setmAddress4(String mAddress4) {
      this.mAddress4 = mAddress4;
   }

   
   
}