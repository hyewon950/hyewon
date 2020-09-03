package org.kh.camp.used.service;

import java.util.ArrayList;

import org.kh.camp.used.domain.PageInfo;
import org.kh.camp.used.domain.Search;
import org.kh.camp.used.domain.UsedBoard;
import org.kh.camp.used.domain.UsedReply;
import org.kh.camp.used.store.UsedStoreLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("uService")
public class UsedBoardServiceImpl implements UsedBoardService{

   @Autowired
   private UsedStoreLogic uStore;
   
   @Override
   public int getUsedListCount() {
      
      return uStore.getUsedListCount();
   }

   @Override
   public ArrayList<UsedBoard> selectUsedList(PageInfo pi) {
      return uStore.selectUsedList(pi);
   }
   
 
   @Override
   public int insertUsedBoard(UsedBoard u) {
      
      return uStore.insertUsedBoard(u);
   }

   @Override
   public int addReadCount(int usedNo) {
      return uStore.addReadCount(usedNo);
   }

   @Override
   public UsedBoard selectUsedBoard(int usedNo) {
      
      return uStore.selectUsedBoard(usedNo);
   }

   @Override
   public int updateUsedBoard(UsedBoard u) {
      return uStore.updateUsedBoard(u);
   }

   @Override
   public int deleteUsedBoard(int usedNo) {
      
      return uStore.deleteUsedBoard(usedNo);
   }

   @Override
   public ArrayList<UsedBoard> searchList(Search search) {
      System.out.println("search service : "+ search.toString());
      return uStore.searchList(search);
   }

   @Override
   public ArrayList<UsedReply> selectUsedReplyList(int usedNo) {
      return uStore.selectUsedReplyList(usedNo);
   }
   
   @Override
   public int insertUsedReply(UsedReply usedReply) {
      return uStore.insertUsedReply(usedReply);
   }
   
   
   
   @Override
   public int deleteUsedReply(UsedReply usedReply) {
      return uStore.deleteUsedReply(usedReply);
   }
   
   @Override
      public ArrayList<UsedBoard> myUsedSelect(String mId) {
         // 등록한 상품 조회
         return uStore.myUsedSelect(mId);
      }

   @Override
   public ArrayList<UsedBoard> selectUsedMainList() {

      return uStore.selectUsedMainList();
   }


   




}