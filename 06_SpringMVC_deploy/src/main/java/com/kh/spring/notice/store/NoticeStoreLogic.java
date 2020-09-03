package com.kh.spring.notice.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.notice.domain.Notice;
import com.kh.spring.notice.domain.Search;

@Repository("nStore")
public class NoticeStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Notice> selectList(){
		return(ArrayList)sqlSession.selectList("noticeMapper.selectList");
	}
	
	public ArrayList<Notice> searchList(Search search){
		return (ArrayList)sqlSession.selectList("noticeMapper.searchList",search);
	}
	
	public Notice selectOne(int nId) {
		return sqlSession.selectOne("noticeMapper.selectOne", nId);
	}
	public int insertNotice(Notice notice) {
		return sqlSession.insert("noticeMapper.insertNotice",notice);
	}
	
	public int updateNotice(Notice notice) {
		return sqlSession.update("noticeMapper.updateNotice", notice);
	}

	public int deleteNotice(int nId) {
		return sqlSession.delete("noticeMapper.deleteNotice",nId);
	}
}
