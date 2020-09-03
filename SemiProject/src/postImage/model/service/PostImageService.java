package postImage.model.service;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectionFactory;
import community.model.vo.Community;
import postImage.model.dao.PostImageDAO;
import postImage.model.vo.PostImage;

public class PostImageService {
	ConnectionFactory factory;
	
	public PostImageService() {
		// TODO Auto-generated constructor stub
		factory = ConnectionFactory.getConnection();
	}

	public int uploadPostImage(PostImage postImage) {
		// 레시피 이미지 넣는 법
		int result = 0;
		Connection conn = null;
		
		try {
			conn = factory.createConnection();
			result = new PostImageDAO().uploadPostImage(conn, postImage);
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
	public int updatePostImage(PostImage postImage, int postNo) {
		// 레시피 이미지 넣는 법
		int result = 0;
		Connection conn = null;
		
		try {
			conn = factory.createConnection();
			result = new PostImageDAO().updatePostImage(conn, postImage, postNo);
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
	public int deletePostImage(int postNo) {
		// 레시피 이미지 넣는 법
		int result = 0;
		Connection conn = null;
		
		try {
			conn = factory.createConnection();
			result = new PostImageDAO().deletePostImage(conn,postNo);
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
	  public ArrayList<PostImage> showPostImage(int postNo) { // 레시피 게시글 이미지 보여주는 메소 } public
		  ArrayList<PostImage> pImages = null;
		  Connection conn = null;
		  
		  try {
			conn = factory.createConnection();
			pImages = new PostImageDAO().showPostImage(conn, postNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		  
		  
		  return pImages;
	  }
	  /*public int deletePostImage(String postImagePath) {
	  
	  }*/

	public ArrayList<PostImage> showBestPostImage(ArrayList<Community> community) {
		ArrayList<PostImage> list = null;
		  Connection conn = null;
		  
		  try {
			conn = factory.createConnection();
			list = new PostImageDAO().showBestPostImage(conn, community);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		  return list;
	  }
}
