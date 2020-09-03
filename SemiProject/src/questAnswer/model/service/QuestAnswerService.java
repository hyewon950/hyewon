package questAnswer.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectionFactory;

import questAnswer.model.dao.QuestAnswerDAO;
import questAnswer.model.vo.QnaPageData;
import questAnswer.model.vo.QuestAnswer;

public class QuestAnswerService {

	private ConnectionFactory factory;
	
	public QuestAnswerService() {
		factory = ConnectionFactory.getConnection();
	}
	
	// Q&A 작성
	public int insertQuestAnswer(String qTitle, String qContents, String userId, int saleNo) {
		
		int result = 0;
		Connection conn = null;
		
		try {
			conn = factory.createConnection();
			result = new QuestAnswerDAO().insertQuestAnswer(conn, qTitle,qContents, userId, saleNo);
			if (result > 0) {
				factory.commit(conn);
			} else {
				factory.rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			factory.close(conn);
		}
		
		return result;
		
		
	}
	
	public QnaPageData selectQnaList(int currentPage,int saleNo) {
		Connection conn=null;
		int recordCountPerPage=10;
		int naviCountPerPage=5;
		QnaPageData pd=new QnaPageData();
		ArrayList<QuestAnswer> pageList =null;
		
		try {
			conn=factory.createConnection();
			pageList =new QuestAnswerDAO().selectQnaList(conn,currentPage,recordCountPerPage,saleNo);
			pd.setSalePage(pageList);
			pd.setPageNavi(new QuestAnswerDAO().getPageNavigation(conn,currentPage,recordCountPerPage, naviCountPerPage,saleNo));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return pd;
		
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

//	public ArrayList<QuestAnswer> printQusetAnswerList(int postNo) {
//		// Q&A리스트 출력
//		
//	}
}
