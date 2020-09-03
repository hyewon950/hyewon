package lecture.store.mapper;

import java.util.ArrayList;

import lecture.domain.Lecture;

public interface LectureMapper {
	
	void create(Lecture lecture);
	Lecture read(int lectureId);
	void update(Lecture lecture);
	void delete(int lectureId);
	ArrayList<Lecture> readAll();
}
