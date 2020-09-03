package org.kh.camp.board.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.kh.camp.board.domain.Board;
import org.kh.camp.board.domain.BoardComment;

import org.kh.camp.board.domain.BoardSearch;
import org.kh.camp.board.domain.PageInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("bStore")
public class BoardStoreLogic {

	@Autowired
	   private SqlSessionTemplate sqlSession;
	   
	   public int getListCount(String bType) {
		   return sqlSession.selectOne("boardMapper.getListCount", bType);
	   }
	   
/*	   public int getDListCount(String bType) {
		   return sqlSession.selectOne("boardMapper.getDListCount", bType);
	   }*/
	   
	   
	
	   //mybatis의 RowBounds 클래스 사용
	   //off : 5, boardLimit :10
	   //off: 얼마나 건너 뛸것인가, 증가값
	   //limit : 고정된 값, 내가 가져오고 싶은 갯수
	   //단점 : 데이터가 많아지면 느려질 수 있음
	   //10건의 0건 만큼 건너뛰고 결과값을 가져옴 => 10개
	   // 15건의 5건 만큼 건너뛰고 결과값을 가져옴
	   //20건의 10건 만큼 건너뛰고 결과값을 가져옴
	 
	   public ArrayList<Board> selectList(PageInfo pi, String bType) {
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		   RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		   return (ArrayList)sqlSession.selectList("boardMapper.selectList",bType, rowBounds);
	 }
	 
/*	 public ArrayList<Board> selectDList(PageInfo pi, String bType) {
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		   //mybatis의 RowBounds 클래스 사용
		   //off : 5, boardLimit :10
		   //off: 얼마나 건너 뛸것인가, 증가값
		   //limit : 고정된 값, 내가 가져오고 싶은 갯수
		   //단점 : 데이터가 많아지면 느려질 수 있음
		   //10건의 0건 만큼 건너뛰고 결과값을 가져옴 => 10개
		   // 15건의 5건 만큼 건너뛰고 결과값을 가져옴
		   //20건의 10건 만큼 건너뛰고 결과값을 가져옴
		   RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		   System.out.println(bType);
		   return (ArrayList)sqlSession.selectList("boardMapper.selectDList",bType, rowBounds);
	 }*/
	 public Board selectBoard(int bNo) {
		 return sqlSession.selectOne("boardMapper.selectOne",bNo);
		 
	 }
/*	 public Board selectDBoard(int bNo) {
		 return sqlSession.selectOne("boardMapper.selectDOne",bNo);
		 
	 }*/
	 
	 public int addReadCount(int bNo) {
		   return sqlSession.update("boardMapper.updateCount",bNo);
	   }
	   
	   
	   public int insertBoard(Board board) {
		   return sqlSession.insert("boardMapper.insertboard", board);
	   }
	   
	   //댓글 전체 조회
	   public ArrayList<BoardComment> selectBoardCommentList(int bNo){
		   return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList",bNo);
		   
	   }
	   
	   
		// 게시글 댓글 저장
		public int insertBoardComment(BoardComment bc) {
			return sqlSession.insert("boardMapper.insertReply", bc);
		}
		
		public int deleteBoard(int bNo) {
			return sqlSession.delete("boardMapper.deleteBoard", bNo);
		}
		
		public ArrayList<Board> searchList(BoardSearch boardSearch){
			return(ArrayList)sqlSession.selectList("boardMapper.searchList",boardSearch);
		}

		public int addLike(int bNo) {
			return sqlSession.update("boardMapper.addLike",bNo);
		}

/*		public ArrayList<Board> TypeList(PageInfo pi, OrderCondition od) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			   RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			return (ArrayList)sqlSession.selectList("boardMapper.TypeList", od, rowBounds);
		}*/
		
		public int deleteComment(int commentNo) {
			return sqlSession.delete("boardMapper.deleteBoardComment", commentNo);
		}
		public int updateComment(int commentNo, String modifyComment) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("commentNo", commentNo);
			map.put("modifyComment", modifyComment);
			
			return sqlSession.update("boardMapper.updateBoardComment", map);
		}
		
		public int selectBoardLatestNo(String mId) {
			return sqlSession.selectOne("boardMapper.selectBoardLatestNo", mId);
		}
		
		public int insertboard(Board board) {
			return sqlSession.insert("boardMapper.insertboard", board);
		}
		
		public Board selectOneBoard(int bNo) {
			return sqlSession.selectOne("boardMapper.selectOneBoard", bNo);
		}
		
		public int updateBoard(Board board) {
			return sqlSession.update("boardMapper.updateBoard", board);
		}
		
}
