package community.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import comment.model.dao.CommentDAO;
import comment.model.vo.Comment;
import common.ConnectionFactory;
import community.model.dao.CommunityDAO;
import community.model.vo.CoPageData;
import community.model.vo.Community;

public class CommunityService {
	ConnectionFactory factory;

	public CommunityService() {
		factory = ConnectionFactory.getConnection();
	}

	public CoPageData searchCommunity(String postKinds, String searchOption, String searchKey, int currentPage) {
		// 게시판 종류, 게시판 제목/내용, 게시글작성자 받아서 상세 검색하는 메소드
		CoPageData coPageData = null;
		Connection conn = null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		try {
			conn = factory.createConnection();
			coPageData = new CoPageData();
			coPageData.setPageList(new CommunityDAO().getSearchPage(conn, postKinds, searchOption, searchKey, currentPage, recordCountPerPage));
			coPageData.setPageNavi(new CommunityDAO().getSearchNavi(conn, postKinds, searchOption, searchKey, currentPage, recordCountPerPage, naviCountPerPage));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		
		return coPageData;
	}

	public CoPageData selectCommunity(String postKinds, int currentPage) {
		// 게시글 종류에 따라서 게시판들 보여주기
		CoPageData coPageData = null;
		Connection conn = null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		try {
			conn = factory.createConnection();
			coPageData = new CoPageData();
			coPageData
					.setPageList(new CommunityDAO().getCommunityPage(conn, postKinds, currentPage, recordCountPerPage));
			coPageData.setPageNavi(new CommunityDAO().getCommunityNavi(conn, postKinds, currentPage, recordCountPerPage,
					naviCountPerPage));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		return coPageData;
	}

	public Community selectShowCommunity(int postNo) {
		// 게시글 상세페이지 보여주는 메소드
		int result = 0;
		Connection conn = null;
		Community community = null;
		ArrayList<Comment> comment = null;
		try {
			conn = factory.createConnection();
			result = new CommunityDAO().updatePostViewsCommunity(conn, postNo);
			if(result > 0) {
			community = new CommunityDAO().selectShowCommunity(conn, postNo);
			comment = new CommentDAO().selectPostComment(conn, postNo);
			community.setComment(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
			factory.commit(conn);
		}
		return community;
	}

	public int deleteCommunity(int postNo) {
		// 게시글 삭제하는 메소드
		Connection conn = null;
		int result = 0;

		try {
			conn = factory.createConnection();
			result = new CommunityDAO().deleteCommunity(conn, postNo);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
			factory.commit(conn);
		}
		return result;
	}

	public int modifyCommunity(int postNo, String subject, String contentArea) {
		Connection conn = null;
		int result = 0;

		try {
			conn = factory.createConnection();
			result = new CommunityDAO().modifyCommunity(conn, postNo, subject, contentArea);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (result > 0) {
			factory.commit(conn);
		} else {
			factory.rollback(conn);
		}
		return result;

	}

	public int insertCommunity(String subject, String contentArea, String postKind, String mId) {
		Connection conn = null;
		int result = 0;
		try {
			conn = factory.createConnection();
			result = new CommunityDAO().insertCommunity(conn, subject, contentArea, postKind, mId);
			if (result > 0) {
				factory.commit(conn);
			} else {
				factory.rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}

		return result;
	}

	public ArrayList<Community> bestStoryCommunity(String postKinds) {
		// 스토리, 레시피 게시판에서 베스트 게시글 3개 보여주는 메소드
		Connection conn = null;
		ArrayList<Community> result = null;
		try {
			conn = factory.createConnection();
			result = new CommunityDAO().bestStoryCommunity(conn, postKinds);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		return result;

	}
	
	public Community recommendCommunity(int postNo, int postRecommend) {
	      Connection conn = null;
	      Community community = null;
	      int result = 0;
	      ArrayList<Comment> comment = null;
	      try {
	         conn = factory.createConnection();
	         result = new CommunityDAO().recommendCommunity(conn, postNo, postRecommend);
	         if(result > 0){
	        	 community = new CommunityDAO().selectShowCommunity(conn, postNo);
	        	 comment = new CommentDAO().selectPostComment(conn, postNo);
	        	 community.setComment(comment);
	         }

	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         factory.close(conn);
	      }
	      return community;
	   }
	/*
	 * public ArrayList<Community> bestCommunity(){ // 스토리, 레시피 게시판에서 베스트 게시글 2개
	 * 보여주는 메소드 }
	 */

}
