package review.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import orderList.model.vo.OrderList;
import questAnswer.model.dao.QuestAnswerDAO;
import questAnswer.model.vo.QnaPageData;
import questAnswer.model.vo.QuestAnswer;
import review.model.vo.Review;
import review.model.vo.ReviewPageData;
import sale.model.vo.Sale;
import sale.model.vo.SaleDetailPage;



public class ReviewDAO {

   /*public ArrayList<Review> selectMyReviewList(Connection conn, int currentPage, int recordCountPerPage, String mId) {
     
   }
   
   public ArrayList<Review> selectReviewList(Connection conn, int currentPage, int recordCountPerPage, String postNo) {
      // "SELECT * FROM ( SELECT NOTICE.*, ROW_NUMBER() OVER(ORDER BY NOTICENO DESC) AS NUM FROM NOTICE) WHERE NUM BETWEEN ? AND ?"
      // NOTICE DAO 반드시 참고하세요 겁나 어려움
      // 상품 페이지에서 확인할 수 있는 리뷰
   }
   
   public int totalCount(Connection conn) {
      // 리뷰 게시물의 총 갯수를 가져오는 메소드
   }*/
   
   public ArrayList<OrderList> selectSaleList(Connection conn, String userId){
      // PHOTO DAO 꼭 참고하세여!!!//
      // '내가 구매한 제품 보기(리뷰작성하기 위해)
	  PreparedStatement pstmt = null;
	  ResultSet rset = null;
	  ArrayList<OrderList> list = null;
	  String query = "select sale_img_name, T.* from ((select  ROW_NUMBER() OVER(ORDER BY O.buy_no) as RNUM, S.* ,O.m_id, O.buy_no from  sale S left join product P on (S.sale_no = P.sale_no) left join orderlist O on(P.prd_no = O.prd_no)  where M_ID= ? and buy_check='Y')T )"
	  		+ "left join sale_image I on (I.SALE_NO=T.SALE_NO) where rnum between 1 and 5";
	  
	  try {
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userId);
		
		rset = pstmt.executeQuery();
		list = new ArrayList<OrderList>();
		int  i = 0;
		while(rset.next()) {
			OrderList orderList = new OrderList();
			orderList.setSaleNo(rset.getInt("sale_no"));
			orderList.setBuyNo(rset.getInt("buy_no"));
			orderList.setImgName(rset.getString("SALE_IMG_NAME"));
			list.add(orderList);
		    System.out.println(list.get(i).getBuyNo());
		    System.out.println(list.get(i).getSaleNo());
		    System.out.println(list.get(i).getImgName());
		    i++;
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		try {
			rset.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	  return list; 
   }
   
   /*public int insertReview(Connection conn, String userId, Review review) {
      // 리뷰 달기
      
   }*/
   
   public  ArrayList<Review> selectReview(Connection conn,int saleNo) {
	   PreparedStatement pstmt=null;
	   ResultSet rset=null;
	   ArrayList<Review> rList=new ArrayList<Review>();
	   String query="SELECT * FROM REVIEW WHERE SALE_NO=? ORDER BY RV_NO DESC";

	   
	   try {
		pstmt=conn.prepareStatement(query);
		pstmt.setInt(1, saleNo);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			Review rw=new Review();
			
			rw.setBmSellerNo(rset.getInt("BM_SELLERNO"));
			rw.setmId(rset.getString("M_ID"));
			rw.setRvContent(rset.getString("RV_CONTENT"));
			rw.setRvNo(rset.getInt("RV_NO"));
			rw.setSaleNo(saleNo);
			rw.setRvRegDate(rset.getDate("RV_REGDATE"));
			rList.add(rw);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		try {
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}return rList;
	   
   }
   
   public int totalCount(Connection conn,int saleNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int countNum = 0;
		ReviewPageData rd= new ReviewPageData();
		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM REVIEW WHERE SALE_NO=? ";
		// 게시글 총 갯수를 알아오는 쿼리

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, saleNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				countNum=rset.getInt("TOTALCOUNT");
		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countNum;
	}
   
   	public int bmNo(Connection conn,int saleNo) {
   		int bmNo=0;
   		PreparedStatement pstmt=null;
   		String query="SELECT BM_SELLERNO FROM SALE WHERE SALE_NO=?";
   		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, saleNo);
			bmNo=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   		
   		return bmNo;
   	}
   
   
   
	public int insertReview(Connection conn,int saleNo,String content,String mId,int bmNo) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="insert into review values(REVIEW_NO_SEQ.NEXTVAL,?,?,?,?,sysdate)";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1,saleNo);
			pstmt.setInt(2,bmNo);
			pstmt.setString(3,mId);
			pstmt.setString(4,content);
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
		
		return result;
	}
   public int insertcount(String mId,int saleNo,Connection conn) {
	   PreparedStatement pstmt=null;
	   int result=0;
	   ResultSet rset=null;
	   String query="SELECT COUNT(*) AS TOTALCOUNT FROM REVIEW WHERE SALE_NO=? AND M_ID=?";
	   
	   try {
		pstmt=conn.prepareStatement(query);
		  pstmt.setInt(1, saleNo);
		  pstmt.setString(2, mId);
		 rset=pstmt.executeQuery();
		  while(rset.next()){
			  result=rset.getInt("TOTALCOUNT");
		  }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	   return result;
	   
	   
   }
   public int updateReview(Connection conn,String rvcontent,int saleNo,String mId) {
	   int result=0;
	   PreparedStatement pstmt=null;
	   String query="UPDATE REVIEW SET RV_CONTENT =? WHERE SALE_NO=? and M_ID=?";
	   
	   try {
		pstmt=conn.prepareStatement(query);
		pstmt.setString(1, rvcontent);
		pstmt.setInt(2, saleNo);
		pstmt.setString(3, mId);
		result=pstmt.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
	   
	   
	   
	   return result;
   }
   
   public int deleteReview(Connection conn,int reNo) {
	   int result=0;
	   PreparedStatement pstmt=null;
	   String query="DELETE FROM REVIEW WHERE RV_NO=?";
	   
	   try {
		pstmt=conn.prepareStatement(query);
		pstmt.setInt(1,reNo);
		result=pstmt.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
	   
	   return result;
   }
   
   
   
   
   
   
   
   
   
   
   
   
}