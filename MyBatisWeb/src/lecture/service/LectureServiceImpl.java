package lecture.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import common.SqlSessionTemplate;
import lecture.domain.Lecture;
import lecture.store.LectureStore;
import lecture.store.LectureStoreLogic;

public class LectureServiceImpl implements LectureService {

	LectureStore store = new LectureStoreLogic();

	@Override
	public void register(Lecture lecture) {
		SqlSession session=SqlSessionTemplate.getSqlSession();
		store.create(session, lecture);
		session.commit();
		session.close();
		
	}

	@Override
	public Lecture find(int lectureId) {
		SqlSession session=SqlSessionTemplate.getSqlSession();
		Lecture lect =store.read(session, lectureId);
		session.close();
		return lect;
	}

	@Override
	public void modify(Lecture lecture) {
		SqlSession session=SqlSessionTemplate.getSqlSession();
		store.update(session, lecture);
		session.commit();
		session.close();
		
	}

	@Override
	public void remove(int lectureId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Lecture> findAll() {
	SqlSession session= SqlSessionTemplate.getSqlSession();
	ArrayList<Lecture> lectureList=store.readAll(session);
	session.close();
		return lectureList;
	}

}
