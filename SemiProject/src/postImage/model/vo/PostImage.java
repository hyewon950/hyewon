package postImage.model.vo;

import java.sql.Timestamp;

public class PostImage {
	
	 private Timestamp cookUpload;
	   private int postNo;
	   private String cookImgUser;
	   private String cookImgName;
	   private long cookImgSize;
	   private String cookImgPath;
	   
	   public PostImage() {}

	   public PostImage(Timestamp cookUpload, int postNo, String cookImgUser, String cookImgName, int cookImgSize,
	         String cookImgPath) {
	      super();
	      this.cookUpload = cookUpload;
	      this.postNo = postNo;
	      this.cookImgUser = cookImgUser;
	      this.cookImgName = cookImgName;
	      this.cookImgSize = cookImgSize;
	      this.cookImgPath = cookImgPath;
	   }

	   public Timestamp getCookUpload() {
	      return cookUpload;
	   }

	   public void setCookUpload(Timestamp cookUpload) {
	      this.cookUpload = cookUpload;
	   }

	   public int getPostNo() {
	      return postNo;
	   }

	   public void setPostNo(int postNo) {
	      this.postNo = postNo;
	   }

	   public String getCookImgUser() {
	      return cookImgUser;
	   }

	   public void setCookImgUser(String cookImgUser) {
	      this.cookImgUser = cookImgUser;
	   }

	   public String getCookImgName() {
	      return cookImgName;
	   }

	   public void setCookImgName(String cookImgName) {
	      this.cookImgName = cookImgName;
	   }

	   public long getCookImgSize() {
	      return cookImgSize;
	   }

	   public void setCookImgSize(long cookImgSize) {
	      this.cookImgSize = cookImgSize;
	   }

	   public String getCookImgPath() {
	      return cookImgPath;
	   }

	   public void setCookImgPath(String cookImgPath) {
	      this.cookImgPath = cookImgPath;
	   }

}
