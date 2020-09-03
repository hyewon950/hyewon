package com.kh.spring.bord.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.bord.domain.Board;
import com.kh.spring.bord.domain.PageInfo;
import com.kh.spring.bord.domain.Reply;

@Repository("bStore")
public class BoardStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Board> selectList(PageInfo pi) {
		
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		// mybatis의 RowBounds 클래스 사용
		// off : 얼마나 건너뛸 것인가, 증가값
		// limit : 고정된 값, 내가 가져오고 싶은 갯수
		// off : 5, limit : 10
		// 5 + 10 건을 가져온 후에 5건을 건너띄고 10개를 가져옴
		// 10 + 10 건을 가져온 후에 10건을 건너띄고 10개를 가져옴
		// 단점 : 데이터가 많아지면 느려질 수 있음.
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList",null,rowBounds);

	}
	
	public int getListCount() {
		return sqlSession.selectOne("boardMapper.getListCount");
	}
	
	public int addReadCount(int bId) {
		return sqlSession.update("boardMapper.updateCount",bId);
	}
	public Board selectBoard(int bId) {
		return sqlSession.selectOne("boardMapper.selectOne",bId);
	}
	public ArrayList<Reply> selectReplyList(int bId){
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList",bId);
	}
	public int insertReply(Reply r) {
		return sqlSession.insert("boardMapper.insertReply",r);
	}
	
}
