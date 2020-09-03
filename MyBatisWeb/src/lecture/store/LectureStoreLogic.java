package lecture.store;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import lecture.domain.Lecture;
import lecture.store.mapper.LectureMapper;

public class LectureStoreLogic implements LectureStore{

	@Override
	public void create(SqlSession session, Lecture lecture) {
		LectureMapper mapper=session.getMapper(LectureMapper.class);
		mapper.create(lecture);
		
		
	}

	@Override
	public Lecture read(SqlSession session, int lectureId) {
		LectureMapper mapper= session.getMapper(LectureMapper.class);
		Lecture lec=mapper.read(lectureId);
		
		
		
		return lec;
	}

	@Override
	public void update(SqlSession session, Lecture lecture) {
		LectureMapper mapper= session.getMapper(LectureMapper.class);
		mapper.update(lecture);
		
		
	}

	@Override
	public void delete(SqlSession session, int lectureId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Lecture> readAll(SqlSession session) {
	
		LectureMapper mapper =  session.getMapper(LectureMapper.class);
		ArrayList<Lecture> list = mapper.readAll();
		return list;

	}

}
