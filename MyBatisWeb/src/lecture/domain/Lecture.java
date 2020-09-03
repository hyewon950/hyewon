package lecture.domain;

public class Lecture {
	private int id;
	private String lectureName;
	private String instructor;
	private String introduce;
	
	
	public Lecture() {}
	
	public Lecture(String lectureName,String instructorName,String lectureIntroduce) {
		this.lectureName=lectureName;
		this.instructor=instructorName;
		this.introduce=lectureIntroduce;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLectureName() {
		return lectureName;
	}

	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


}
