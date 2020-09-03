package comment.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import comment.model.dao.CommentDAO;
import comment.model.vo.Comment;
import common.ConnectionFactory;

public class CommentService {
	
	private ConnectionFactory factory;
	public CommentService() {
		// TODO Auto-generated constructor stub
		factory = ConnectionFactory.getConnection();
	}
	public int insertComment(Comment comment) {
		// 댓글 넣는 메소드
		Connection conn = null;
		int result = 0;
		try {
			conn = factory.createConnection();
			result = new CommentDAO().insertComment(conn, comment);
			if(result>0) {
				factory.commit(conn);
			}else {
				factory.rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		
		return result;
	}
	
	public int modifyComment(int conmmentNo, String commentContent) {
		// update comment set content =? ,regdate = sysdate where commentno = ?
		// 댓글 수정하는 메소드
		Connection conn = null;
		int result = 0;
		try {
			conn = factory.createConnection();
			result = new CommentDAO().modifyComment(conn, conmmentNo, commentContent);
			
			if(result>0) {
				factory.commit(conn);
			}else {
				factory.rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		
		return result;
	}
	
	public int deleteComment(int commentNo) {
		Connection conn = null;
		int result = 0;
		try {
			conn = factory.createConnection();
			result = new CommentDAO().deleteComment(conn, commentNo);
			
			if(result>0) {
				factory.commit(conn);
			}else {
				factory.rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		
		return result;
		
	}
	public ArrayList<Comment> selectPostComment(int postNo){
		ArrayList<Comment> comments = null;
		Connection conn = null;
		
		try {
			conn = factory.createConnection();
			comments = new CommentDAO().selectPostComment(conn, postNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		return comments;
	}
	public Comment insertComment() {
		Connection conn = null;
		Comment comment = null;
		
		try {
			conn = factory.createConnection();
			comment = new CommentDAO().insertComment(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		
		return comment;
		
	}
	public Comment modifyComment(int mentNo) {
		Connection conn = null;
		Comment comment = null;
		
		try {
			conn = factory.createConnection();
			comment = new CommentDAO().modifyComment(conn, mentNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		
		return comment;
		
	}
}
