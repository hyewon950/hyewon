package lecture.service;

import java.util.ArrayList;

import lecture.domain.Lecture;

public interface LectureService {

	void register(Lecture lecture);
	Lecture find(int lectureId);
	void modify(Lecture lecture);
	void remove(int lectureId);
	public ArrayList<Lecture> findAll();
	

}
