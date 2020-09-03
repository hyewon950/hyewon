package review.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectionFactory;
import orderList.model.vo.OrderList;
import questAnswer.model.dao.QuestAnswerDAO;
import questAnswer.model.vo.QnaPageData;
import questAnswer.model.vo.QuestAnswer;
import review.model.dao.ReviewDAO;
import review.model.vo.Review;
import review.model.vo.ReviewPageData;
import sale.model.vo.Sale;
import sale.model.vo.SaleDetailPage;

public class ReviewService {
	
	ConnectionFactory factory = null;
	ReviewDAO reviewDAO = null;
	
	public ReviewService() {
		// TODO Auto-generated constructor stub
		factory = ConnectionFactory.getConnection();
		reviewDAO = new ReviewDAO();
	}
	
	/*public PageData selectMyReviewList(int currentPage, String mId) {
		// "SELECT * FROM ( SELECT NOTICE.*, ROW_NUMBER() OVER(ORDER BY NOTICENO DESC) AS NUM FROM NOTICE) WHERE NUM BETWEEN ? AND ?"
		// NOTICE DAO 반드시 참고하세요 겁나 어려움
		// '내가 작성한 리뷰 보기'
	}
	
	public PageData selectReviewList(int currentPage, String postNo) {
		// "SELECT * FROM ( SELECT NOTICE.*, ROW_NUMBER() OVER(ORDER BY NOTICENO DESC) AS NUM FROM NOTICE) WHERE NUM BETWEEN ? AND ?"
		// NOTICE DAO 반드시 참고하세요 겁나 어려움
		// '내가 작성한 리뷰 보기'
	}*/
	
	public ArrayList<OrderList> selectSaleList(String userId){
		// PHOTO DAO 꼭 참고하세여!!!
		// '내가 구매한 제품 보기(리뷰작성하기 위해)
		ArrayList<OrderList> list = null;
		Connection conn = null;
		//
		try {
			conn = factory.createConnection();
			list = new ArrayList<OrderList>();
			list = reviewDAO.selectSaleList(conn, userId);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		
		return list;
	}
	
	/*public int insertReview(String userId, Review review) {
		// 리뷰 달기
		
	}*/
  public ReviewPageData selectReview(int currentPage,int saleNo) {
	Connection conn=null;

	ReviewPageData pd=new ReviewPageData();
	ArrayList<Review> pageList =null;
	
	try {
		conn=factory.createConnection();
		pageList =new ReviewDAO().selectReview(conn,saleNo);
		pd.setReviewList(pageList);
		pd.setCountNum(new ReviewDAO().totalCount(conn,saleNo));
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	return pd;
   
}
  public int insesrtReview(int saleNo,String content,String mId) {
	  int result=0;
	  Connection conn=null;
	 int count=0; //중복방지
	  
	  try {
		conn=factory.createConnection();
			/* bmNo=new ReviewDAO().bmNo(conn, saleNo); */
		count=new ReviewDAO().insertcount(mId,saleNo,conn);
		if(count == 0) {
		result=new ReviewDAO().insertReview(conn,saleNo,content,mId,new ReviewDAO().bmNo(conn, saleNo));
		}else {
			result=0;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
	  if (result > 0) {
		factory.commit(conn);
	} else {
		factory.rollback(conn);
	}
	

	  
	  
	  return result;
	  
	  
	  
  }
  public int countreview(String mId,int saleNo) {
	  Connection conn=null;
		 int count=0; //중복방지
		 
		 try {
			conn=factory.createConnection();
			  count=new ReviewDAO().insertcount(mId,saleNo,conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		 
	return count;
	  
  }
  	public int updateReview(String rvcontent,int saleNo,String mId) {
	 Connection conn=null;
	 int result=0;
	 
	 try {
		conn=factory.createConnection();
		result=new ReviewDAO().updateReview(conn,rvcontent,saleNo,mId);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}		if (result > 0) {
		factory.commit(conn);
	} else {
		factory.rollback(conn);
	}
	

	 
	 return result;
	 
 }
  	
 
  
  public int deleteReview(int reNo) {
	  Connection conn=null;
	  int result=0;
	  
	  try {
		conn=factory.createConnection();
		result= new ReviewDAO().deleteReview(conn,reNo);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}		if (result > 0) {
		factory.commit(conn);
	} else {
		factory.rollback(conn);
	}
	

	  
	  return result;
	  
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
