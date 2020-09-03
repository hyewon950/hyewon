package lecture.store;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import lecture.domain.Lecture;

public interface LectureStore {
	
	public void create(SqlSession session, Lecture lecture);
	public Lecture read(SqlSession session, int lectureId);
	public void update(SqlSession session, Lecture lecture);
	public void delete(SqlSession session, int lectureId);
	public ArrayList<Lecture> readAll(SqlSession session);

}
