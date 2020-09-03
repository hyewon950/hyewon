package postImage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import community.model.vo.Community;
import postImage.model.vo.PostImage;

public class PostImageDAO {
	public PostImageDAO() {
		// TODO Auto-generated constructor stub
	}

	public int getPostNo(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select max(post_no) as post_no from COMMUNITY";
		int result = 0;

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				result = rset.getInt("post_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return result;
	}

	public int uploadPostImage(Connection conn, PostImage postImage) {
		// 이미지 업로드
		int result = 0;
		PreparedStatement pstmt = null;
		int postNo = getPostNo(conn);
		String query = "INSERT INTO POST_IMAGE VALUES(?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setTimestamp(1, postImage.getCookUpload());
			pstmt.setInt(2, postNo);
			pstmt.setString(3, postImage.getCookImgUser());
			pstmt.setString(4, postImage.getCookImgName());
			pstmt.setLong(5, postImage.getCookImgSize());
			pstmt.setString(6, postImage.getCookImgPath());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}
	public int deletePostImage(Connection conn,int postNo) {
		// 이미지 업로드
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "delete from post_image where post_no = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}
	public int updatePostImage(Connection conn, PostImage postImage, int postNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update post_image set post_upload=?, post_img_user = ?, post_img_name = ?, post_img_size = ?, post_img_path =? where post_no = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setTimestamp(1, postImage.getCookUpload());	
			pstmt.setString(2, postImage.getCookImgUser());
			pstmt.setString(3, postImage.getCookImgName());
			pstmt.setLong(4, postImage.getCookImgSize());
			pstmt.setString(5, postImage.getCookImgPath());
			pstmt.setInt(6, postNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}
	public ArrayList<PostImage> showPostImage(Connection conn, int postNo) {
		ArrayList<PostImage> pList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from post_image where post_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			rset = pstmt.executeQuery();
			pList = new ArrayList<PostImage>();
			while(rset.next()) {
				PostImage postImage = new PostImage();
				postImage.setCookUpload(rset.getTimestamp("post_upload"));
				postImage.setPostNo(postNo);

				postImage.setCookImgUser(rset.getString("post_img_user"));
				postImage.setCookImgName(rset.getString("post_img_name"));
				postImage.setCookImgSize(rset.getLong("post_img_size"));
				postImage.setCookImgPath(rset.getString("post_img_path"));
				pList.add(postImage);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		
		return pList;
	}

	public ArrayList<PostImage> showBestPostImage(Connection conn, ArrayList<Community> community) {
		ArrayList<PostImage> pList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PostImage> resultList = new ArrayList<PostImage>();
		String query = "select * from (select * from community C left join post_image P on (C.post_no = P.post_no) where post_kinds = ? order by post_views desc)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, community.get(0).getPostKinds());
			rset = pstmt.executeQuery();
			pList = new ArrayList<PostImage>();
			while(rset.next()) {
				PostImage postImage = new PostImage();
				postImage.setCookUpload(rset.getTimestamp("post_upload"));
				postImage.setPostNo(rset.getInt("post_no"));
				postImage.setCookImgUser(rset.getString("post_img_user"));
				postImage.setCookImgName(rset.getString("post_img_name"));
				postImage.setCookImgSize(rset.getLong("post_img_size"));
				postImage.setCookImgPath(rset.getString("post_img_path"));
				pList.add(postImage);
			}
			
			int i = 0;
			resultList.add(pList.get(0));
			while(i < pList.size()) {
				int size = resultList.size()-1;
				if(resultList.get(size).getPostNo()!=pList.get(i).getPostNo()) {
					resultList.add(pList.get(i));
				}
				i++;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return resultList;
	}
	
	/* public int modifyPostImage(Connection conn, String userId) {} */

	/* public int deletePostImage(Connection conn, String cookImgPath) { } */

}