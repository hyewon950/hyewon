package org.kh.camp.used.service;

import java.util.ArrayList;

import org.kh.camp.mycamp.domain.MyCampComment;
import org.kh.camp.used.domain.PageInfo;
import org.kh.camp.used.domain.Search;
import org.kh.camp.used.domain.UsedBoard;

import org.kh.camp.used.domain.UsedReply;



public interface UsedBoardService {

   public int getUsedListCount();
   public ArrayList<UsedBoard> selectUsedList(PageInfo pi);
   public int insertUsedBoard(UsedBoard u);
   public int addReadCount(int usedNo);
   public UsedBoard selectUsedBoard(int usedNo);
   public int updateUsedBoard(UsedBoard u);
   public int deleteUsedBoard(int usedNo);
   public abstract ArrayList<UsedBoard> searchList(Search search);
   
   ArrayList<UsedBoard> selectUsedMainList();

   //등록한 상품 조회
   public ArrayList<UsedBoard> myUsedSelect(String mId);
   
   

    /* 댓글 전체 조회 서비스*/
   // 댓글 내용 조회
   public abstract ArrayList<UsedReply> selectUsedReplyList(int usedNo);
   // 댓글 쓰기
   public abstract int insertUsedReply(UsedReply usedReply);
   // 댓글 삭제
   public abstract int deleteUsedReply(UsedReply usedReply);
   

   
}
