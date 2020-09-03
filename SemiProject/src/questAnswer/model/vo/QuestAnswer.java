package questAnswer.model.vo;

public class QuestAnswer {

	
	  private String mId; //아이디
	   private int saleNo;	//게시글고유번호
	   private String qTitle;	//제목
	   private String qAnswer;	//답변
	   private String qContents;	//내용
	   private int qnaNo; //QnA고유번호
	   
	   public QuestAnswer() {}
	   
	public QuestAnswer(String mId, int saleNo, String qTitle, String qAnswer, String qContents, int qnaNo) {
		super();
		this.mId = mId;
		this.saleNo = saleNo;
		this.qTitle = qTitle;
		this.qAnswer = qAnswer;
		this.qContents = qContents;
		this.qnaNo = qnaNo;
		
		
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getSaleNo() {
		return saleNo;
	}

	public void setSaleNo(int saleNo) {
		this.saleNo = saleNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqAnswer() {
		return qAnswer;
	}

	public void setqAnswer(String qAnswer) {
		this.qAnswer = qAnswer;
	}

	public String getqContents() {
		return qContents;
	}

	public void setqContents(String qContents) {
		this.qContents = qContents;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	
	  

	   
}
