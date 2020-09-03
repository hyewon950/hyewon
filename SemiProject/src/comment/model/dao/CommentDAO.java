package comment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import comment.model.vo.Comment;

public class CommentDAO {
	public ArrayList<Comment> selectPostComment(Connection conn, int postNo) {
		ArrayList<Comment> comments = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from post_comment where post_no = ? order by ment_no";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			rset = pstmt.executeQuery();
			
			comments = new ArrayList<Comment>();
			while(rset.next()) {
				Comment comment = new Comment();
				comment.setMentNo(rset.getInt("ment_no"));
				comment.setPostNo(rset.getInt("post_no"));
				comment.setMentWriter(rset.getString("ment_writer"));
				comment.setMentContent(rset.getString("ment_content"));
				comment.setMentRegDate(rset.getDate("ment_regdate"));
				comments.add(comment);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comments;
	}
	public int insertComment(Connection conn, Comment comment) {
		// 댓글 넣는 메소드
		// 댓글
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into post_comment values(ment_no_seq.nextval,?,?,?,sysdate)";
		
		try {
			pstmt = conn.prepareStatement(query);
		
			pstmt.setInt(1, comment.getPostNo());
			pstmt.setString(2, comment.getMentWriter());
			pstmt.setString(3, comment.getMentContent());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
		
	}
	
	public int modifyComment(Connection conn, int conmmentNo, String commentContent) {
		// update comment set content =? ,regdate = sysdate where commentno = ?
		// 댓글 수정하는 메소드
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update post_comment set ment_content =? ,ment_regdate = sysdate where ment_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, commentContent);
			pstmt.setInt(2, conmmentNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	public int deleteComment(Connection conn, int commentNo) {
		// 댓글 삭제하는 메소드
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "delete from post_comment where ment_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, commentNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public Comment insertComment(Connection conn) {
		Comment comment = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from POST_COMMENT where ment_no=(select max(ment_no) from post_comment)";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			comment= new Comment();
			if(rset.next()) {
				comment.setMentNo(rset.getInt("ment_no"));
				comment.setPostNo(rset.getInt("post_no"));
				comment.setMentWriter(rset.getString("ment_writer"));
				comment.setMentContent(rset.getString("ment_content"));
				comment.setMentRegDate(rset.getDate("ment_regdate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		
		return comment;
		
	}
	
	public Comment modifyComment(Connection conn, int mentNo) {
		Comment comment = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from POST_COMMENT where ment_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mentNo);
			rset = pstmt.executeQuery();
			comment= new Comment();
			if(rset.next()) {
				comment.setMentNo(rset.getInt("ment_no"));
				comment.setPostNo(rset.getInt("post_no"));
				comment.setMentWriter(rset.getString("ment_writer"));
				comment.setMentContent(rset.getString("ment_content"));
				comment.setMentRegDate(rset.getDate("ment_regdate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		System.out.println(comment.getMentNo()+"DAO4");
		return comment;
	}
}
