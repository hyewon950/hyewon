package notice.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectionFactory;
import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;
import notice.model.vo.NoticeComment;
import notice.model.vo.PageData;

public class NoticeService {

	private ConnectionFactory factory;

	public NoticeService() {
		factory = ConnectionFactory.getConnection();
	}

	public PageData selectNoticeList(int currentPage) {
		Connection conn = null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		PageData pd = new PageData();
		ArrayList<Notice> noticeList = null;

		try {
			conn = factory.createConnection();
			noticeList = new NoticeDAO().selectNoticeList(conn, currentPage, recordCountPerPage);
			pd.setPageList(noticeList);
			pd.setPageNavi(new NoticeDAO().getPageNavigation(conn, currentPage, recordCountPerPage, naviCountPerPage));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pd;
	}

	public PageData noticeSearchList(int currentPage, String search) {
		Connection conn = null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		PageData pd = new PageData();

		try {
			conn = factory.createConnection();
			pd.setPageList(new NoticeDAO().noticeSearchList(conn, currentPage, recordCountPerPage, search));
			pd.setPageNavi(
					new NoticeDAO().getSearchPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage, search));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pd;
	}

	public int insertNotice(String subject, String content, String userId) {
		Connection conn = null;
		int result = 0;
		try {
			conn = factory.createConnection();
			result = new NoticeDAO().insertNotice(conn, subject, content, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (result > 0) {
			factory.commit(conn);
		} else {
			factory.rollback(null);
		}
		return result;
	}
	
	public Notice noticeSelect(int noticeNo) {
		Connection conn = null;
		Notice notice = null;
		ArrayList<NoticeComment> cmtList =null;
		
		try {
			conn = factory.createConnection();
			notice = new NoticeDAO().noticeSelect(conn, noticeNo);
			cmtList=new NoticeDAO().noticeComment(conn, noticeNo);
			notice.setComments(cmtList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notice;
	}
	
	public int modifyNotice(String subject, String content, int noticeNo) {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = factory.createConnection();
			result = new NoticeDAO().modifyNotice(conn, subject, content, noticeNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(result > 0) {
			factory.commit(conn);
		} else {
			factory.rollback(conn);
		}
		return result;
	}
	
	public int deleteNotice(int noticeNo) {
		Connection conn=null;
		int result=0;
		try {
			conn=factory.createConnection();
			result= new NoticeDAO().deleteNotice(conn,noticeNo);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			factory.commit(conn);
		}else {
			factory.rollback(conn);
		}
		return result;
	}
	
	
	public int commentWrite(String comment,int noticeNo,String userId) {
		
		Connection conn=null;
		int result=0;
		
		try {
			conn=factory.createConnection();
			result=new NoticeDAO().commentWrite(conn,comment,noticeNo,userId);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			factory.commit(conn);
		}else {
			factory.rollback(conn);
		}
		

		return result;
	}

	public int modifyNoticeComment(int commentNo,int noticeNo,String comment) {
		Connection conn=null;
		int result=0;
		
		try {
			conn=factory.createConnection();
			result=new NoticeDAO().modifyNoticeComment(conn,commentNo,noticeNo,comment);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			factory.commit(conn);
		}else {
			factory.rollback(conn);
		}
		
		
		return result;
		
		
		
	}
	
	public int deleteComment(int commentNo,int noticeNo) {
		Connection conn=null;
		int result=0;
		
		try {
			conn=factory.createConnection();
			result=new NoticeDAO().deleteComment(conn,commentNo,noticeNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			factory.commit(conn);
		}else {
			factory.rollback(conn);
		}
		
		return result;
		
		
	}
	
	
	
	
	
	
	
	
	
	
}
