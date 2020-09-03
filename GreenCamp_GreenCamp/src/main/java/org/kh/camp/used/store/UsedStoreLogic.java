package org.kh.camp.used.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.kh.camp.mycamp.domain.MyCampComment;
import org.kh.camp.used.domain.PageInfo;
import org.kh.camp.used.domain.Search;
import org.kh.camp.used.domain.UsedBoard;
import org.kh.camp.used.domain.UsedReply;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository("uStore")
public class UsedStoreLogic {

     @Autowired
      private SqlSessionTemplate sqlSession;
      
      public int getUsedListCount() {
         return sqlSession.selectOne("usedBoardMapper.getUsedListCount");
      }
       
      public ArrayList<UsedBoard> selectUsedList(PageInfo pi) {
         
//         int offset = (pi.getUsedCurrentPage() - 1) * pi.getUsedBoardLimit();
         int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
         //mybatis의 RowBounds 클래스 사용
         //off: 5, boardLimit :10
         //off: 얼마나 건너 뛸것인가, 증가값
         //limit: 고정된 값, 내가 가져오고 싶은 갯수
         //단점: 데이터가 많아지면 느려질 수 있음
         //10건의 0건 만큼 건너뛰고 결과값을 가져옴 => 10개
         //15건의 5건 만큼 건너뛰고 결과값을 가져옴
         //20건의 10건 만큼 건너뛰고 결과값을 가져옴
//         RowBounds rowBounds = new RowBounds(offset, pi.getUsedBoardLimit());
         RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
         return (ArrayList)sqlSession.selectList("usedBoardMapper.selectUsedList",null, rowBounds);
      }
    
 
      public int addReadCount(int usedNo) {
         return sqlSession.update("usedBoardMapper.updateUsedCount",usedNo);
      }
      
      public UsedBoard selectUsedBoard(int usedNo) {
         return sqlSession.selectOne("usedBoardMapper.selectUsedOne",usedNo);
      }
      public int insertUsedBoard(UsedBoard u) {
         return sqlSession.insert("usedBoardMapper.insertUsedBoard", u);
      }
      
      public int updateUsedBoard(UsedBoard u) {
         return sqlSession.update("usedBoardMapper.updateUsedBoard", u);
      }
      public int deleteUsedBoard(int usedNo) {
        return sqlSession.delete("usedBoardMapper.deleteUsedBoard",usedNo);
     }
      
     public ArrayList<UsedBoard> searchList(Search search){
        System.out.println("search store : "+ search.toString());
      return(ArrayList)sqlSession.selectList("usedBoardMapper.searchList",search);
   }
     
     //메인 페이지
     public ArrayList<UsedBoard> selectUsedMainList() {
        
        return (ArrayList) sqlSession.selectList("usedBoardMapper.selectUsedMainList");
     }
     
     
  //등록한 상품 조회
    public ArrayList<UsedBoard> myUsedSelect(String mId) {
       return (ArrayList) sqlSession.selectList("usedBoardMapper.myUsedSelect",mId);
    }

     
   
  
     
      
      //중고게시판 캠핑 댓글
      
      //중고게시판 댓글 내용 조회
      public ArrayList<UsedReply> selectUsedReplyList(int usedNo){   
         return (ArrayList)sqlSession.selectList("usedBoardMapper.selectUsedReplyList",usedNo);
      }
      
      //중고게시판 댓글 쓰기
      public int insertUsedReply(UsedReply usedReply) {
         return sqlSession.insert("usedBoardMapper.insertUsedReply",usedReply);
      }


      //중고 게시판 댓글 삭제
      public int deleteUsedReply(UsedReply usedReply) {         
         return sqlSession.delete("usedBoardMapper.deleteUsedReply",usedReply);
      }


}
