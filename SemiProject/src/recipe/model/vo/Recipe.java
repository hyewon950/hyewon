package recipe.model.vo;

public class Recipe {

	 private int postNo;
	   private int cookNo;
	   private int cookSeq;
	   private String cookContents;
	   
	   public Recipe() {}

	   public Recipe(int postNo, int cookNo, int cookSeq, String cookContents) {
	      super();
	      this.postNo = postNo;
	      this.cookNo = cookNo;
	      this.cookSeq = cookSeq;
	      this.cookContents = cookContents;
	   }

	   public int getPostNo() {
	      return postNo;
	   }

	   public void setPostNo(int postNo) {
	      this.postNo = postNo;
	   }

	   public int getCookNo() {
	      return cookNo;
	   }

	   public void setCookNo(int cookNo) {
	      this.cookNo = cookNo;
	   }

	   public int getCookSeq() {
	      return cookSeq;
	   }

	   public void setCookSeq(int cookSeq) {
	      this.cookSeq = cookSeq;
	   }

	   public String getCookContents() {
	      return cookContents;
	   }

	   public void setCookContents(String cookContents) {
	      this.cookContents = cookContents;
	   }

}
