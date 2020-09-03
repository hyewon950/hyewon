package community.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import comment.model.vo.Comment;
import community.model.vo.Community;

public class CommunityDAO {
   public ArrayList<Community> getCommunityPage(Connection conn, String postKinds, int currentPage,
         int recordCountPerPage) {
      // 커뮤니티 페이지를 가져오는 메소드
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<Community> cList = new ArrayList<Community>();
      String query = "SELECT * FROM ( SELECT COMMUNITY.*, ROW_NUMBER() OVER(ORDER BY POST_NO DESC) AS NUM FROM COMMUNITY where POST_KINDS = ?) "
            + "WHERE (NUM BETWEEN ? AND ?)";
      int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
      int end = currentPage * recordCountPerPage;

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, postKinds);
         pstmt.setInt(2, start);
         pstmt.setInt(3, end);

         rset = pstmt.executeQuery();
         while (rset.next()) {
            Community community = new Community();
            community.setPostNo(rset.getInt("POST_NO"));
            community.setPostKinds(rset.getString("POST_KINDS"));
            community.setPostWriter(rset.getString("POST_WRITER"));
            community.setPostSubject(rset.getString("POST_SUBJECT"));
            community.setPostContent(rset.getString("POST_CONTENT"));
            community.setPostRecommended(rset.getInt("POST_RECOMMEND"));
            community.setPostViews(rset.getInt("POST_VIEWS"));
            community.setPostRegDate(rset.getDate("POST_REGDATE"));
            cList.add(community);
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
      return cList;

   }

   public int totalCount(Connection conn, String postKinds) {
      // 커뮤니티 게시물의 총 갯수를 가져오는 메소드
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      int recordTotalCount = 0;

      String query = "SELECT COUNT(*) AS TOTALCOUNT FROM COMMUNITY WHERE POST_KINDS = ?";
      // 게시글 총 갯수를 알아오는 쿼리

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, postKinds);
         rset = pstmt.executeQuery();
         if (rset.next()) {
            recordTotalCount = rset.getInt("TOTALCOUNT");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return recordTotalCount;
   }

   public String getCommunityNavi(Connection conn, String postKinds, int currentPage, int recordCountPerPage,
         int naviCountPerPage) {
      // 커뮤니티 페이지의 네비게이션바를 가져오는 메소드
      // 네비게이션바 모양 <li class="page-item"><a class="page-link" href="#">1</a></li>
      // <li class="page-item"><a class="page-link" href="#">Previous</a></li>
      int recordTotalCount = totalCount(conn, postKinds);
      int pageTotalCount = 0; // 전체 페이지의 개수
      // 전체 게시물 갯수: 124개 10개씩 페이지를 만들면 페이지 갯수는 13개

      // 만들 전체 페이지의 갯수
      if (recordTotalCount % recordCountPerPage > 0) {
         pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;
      } else {
         pageTotalCount = recordTotalCount / recordCountPerPage;
      }

      // 현재 페이지를 기준으로 네비게이션을 구해야하므로 현재 페이지 정보를 확인해서 0보다는 크고 전체 페이지 수보다는 작은 위치에 있는지 확인
      // (오류방지용)
      if (currentPage < 1) {
         currentPage = 1;
      } else if (currentPage > pageTotalCount) {
         currentPage = pageTotalCount;
      }

      // 6 7 8 9 10
      int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
      // currentPage = 8, naviCountPerPage = 5;
      // ((8-1)/5)*5+1 -> 6
      // 41 42 43 44 45
      // currentPage = 42, naviCountPerPage = 5;
      // ((42-1)/5)*5+1 -> 41
      int endNavi = startNavi + naviCountPerPage - 1;

      // 오류방지
      if (endNavi > pageTotalCount) {
         endNavi = pageTotalCount;
      }

      // <1 2 3 4 5>
      // '<' 모양과 '>' 모양을 준비하기 위해 필요한 변수
      boolean needPrev = true;
      boolean needNext = true;

      if (startNavi == 1) {
         needPrev = false;
      }
      if (endNavi == pageTotalCount) {
         needNext = false;
      }
      // 준비 완료
      StringBuilder sb = new StringBuilder();
      if (needPrev) {
         sb.append("<li class='page-item'><a class='page-link' href='/communityMain?postKinds=" + postKinds
               + "&currentPage=" + (startNavi - 1) + "'>Previous</a></li>");
      }
      for (int i = startNavi; i <= endNavi; i++) {
         if (i == currentPage) {
            sb.append("<li class='page-item'><a class='page-link' href='/communityMain?postKinds=" + postKinds
                  + "&currentPage=" + i + "'><b>" + i + "</b></a></li>");
         } else {
            sb.append("<li class='page-item'><a class='page-link' href='/communityMain?postKinds=" + postKinds
                  + "&currentPage=" + i + "'>" + i + "</a></li>");
         }
      }
      if (needNext) {
         sb.append("<li class='page-item'><a class='page-link' href='/communityMain?postKinds=" + postKinds
               + "&currentPage=" + (endNavi + 1) + "'>Next</a></li>");
      }
      return sb.toString();
   }

   public ArrayList<Community> getSearchPage(Connection conn, String postKinds, String searchOption, String searchKey,
         int currentPage, int recordCountPerPage) {
      // 검색한 페이지를 가져오는 메소드
      // 커뮤니티 페이지를 가져오는 메소드
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<Community> cList = new ArrayList<Community>();
      String query = null;
      if(!searchKey.contains("%")) {
         String keyValue = "%";
         searchKey = keyValue.concat(searchKey.concat(keyValue));
      }
      if (searchOption.equals("제목")) {
         query = "SELECT * FROM ( SELECT COMMUNITY.*, ROW_NUMBER() OVER(ORDER BY POST_NO DESC) AS NUM FROM COMMUNITY where POST_KINDS = ? and post_subject like ?) "
               + "WHERE (NUM BETWEEN ? AND ?)";
      } else if (searchOption.equals("제목+내용")) { 
         query = "SELECT * FROM ( SELECT COMMUNITY.*, ROW_NUMBER() OVER(ORDER BY POST_NO DESC) AS NUM FROM COMMUNITY where POST_KINDS = ? and (post_subject like ? or post_content like ?)) "
               + "WHERE (NUM BETWEEN ? AND ?)";
      } else if (searchOption.equals("작성자")) {
         query = "SELECT * FROM ( SELECT COMMUNITY.*, ROW_NUMBER() OVER(ORDER BY POST_NO DESC) AS NUM FROM COMMUNITY where POST_KINDS = ? and post_writer like ?) "
               + "WHERE (NUM BETWEEN ? AND ?)";
      }

      int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
      int end = currentPage * recordCountPerPage;

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, postKinds);
         if(searchOption.equals("제목+내용")) {
            pstmt.setString(2, searchKey);
            pstmt.setString(3, searchKey);
            pstmt.setInt(4, start);
            pstmt.setInt(5, end);
         } else {
            pstmt.setString(2, searchKey);
            pstmt.setInt(3, start);
            pstmt.setInt(4, end);
         }
         

         rset = pstmt.executeQuery();
         while (rset.next()) {
            Community community = new Community();
            community.setPostNo(rset.getInt("POST_NO"));
            community.setPostKinds(rset.getString("POST_KINDS"));
            community.setPostWriter(rset.getString("POST_WRITER"));
            community.setPostSubject(rset.getString("POST_SUBJECT"));
            community.setPostContent(rset.getString("POST_CONTENT"));
            community.setPostRecommended(rset.getInt("POST_RECOMMEND"));
            community.setPostViews(rset.getInt("POST_VIEWS"));
            community.setPostRegDate(rset.getDate("POST_REGDATE"));
            cList.add(community);
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
      return cList;

   }

   public int totalSearchCount(Connection conn, String postKinds, String searchOption, String searchKey) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      int recordTotalCount = 0;
      String query = null;
      if(!searchKey.contains("%")) {
         String keyValue = "%";
         searchKey = keyValue.concat(searchKey.concat(keyValue));
      }
      if (searchOption.equals("제목")) {
         query = "SELECT COUNT(*) AS TOTALCOUNT FROM COMMUNITY WHERE POST_KINDS = ? and post_subject like ?";
      } else if (searchOption.equals("제목+내용")) {
         query = "SELECT COUNT(*) AS TOTALCOUNT FROM COMMUNITY WHERE POST_KINDS = ? and (post_subject like ? or post_content like ?)";
      } else if (searchOption.equals("작성자")) {
         query = "SELECT COUNT(*) AS TOTALCOUNT FROM COMMUNITY WHERE POST_KINDS = ? and post_writer like ?";
      }

      // 게시글 총 갯수를 알아오는 쿼리

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, postKinds);
         pstmt.setString(2, searchKey);
         if (searchOption.equals("제목+내용")) {
            pstmt.setString(3, searchKey);
         }
         rset = pstmt.executeQuery();
         if (rset.next()) {
            recordTotalCount = rset.getInt("TOTALCOUNT");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return recordTotalCount;
   }

   public String getSearchNavi(Connection conn, String postKinds, String searchOption, String searchKey,
         int currentPage, int recordCountPerPage, int naviCountPerPage) {
      // 검색페이지의 네비게이션바를 가져오는 메소드
      // 커뮤니티 페이지의 네비게이션바를 가져오는 메소드
      // 네비게이션바 모양 <li class="page-item"><a class="page-link" href="#">1</a></li>
      // <li class="page-item"><a class="page-link" href="#">Previous</a></li>
      int recordTotalCount = totalSearchCount(conn, postKinds, searchOption, searchKey);
      int pageTotalCount = 0; // 전체 페이지의 개수
      // 전체 게시물 갯수: 124개 10개씩 페이지를 만들면 페이지 갯수는 13개

      // 만들 전체 페이지의 갯수
      if (recordTotalCount % recordCountPerPage > 0) {
         pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;
      } else {
         pageTotalCount = recordTotalCount / recordCountPerPage;
      }

      // 현재 페이지를 기준으로 네비게이션을 구해야하므로 현재 페이지 정보를 확인해서 0보다는 크고 전체 페이지 수보다는 작은 위치에 있는지 확인
      // (오류방지용)
      if (currentPage < 1) {
         currentPage = 1;
      } else if (currentPage > pageTotalCount) {
         currentPage = pageTotalCount;
      }

      // 6 7 8 9 10
      int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
      // currentPage = 8, naviCountPerPage = 5;
      // ((8-1)/5)*5+1 -> 6
      // 41 42 43 44 45
      // currentPage = 42, naviCountPerPage = 5;
      // ((42-1)/5)*5+1 -> 41
      int endNavi = startNavi + naviCountPerPage - 1;

      // 오류방지
      if (endNavi > pageTotalCount) {
         endNavi = pageTotalCount;
      }

      // <1 2 3 4 5>
      // '<' 모양과 '>' 모양을 준비하기 위해 필요한 변수
      boolean needPrev = true;
      boolean needNext = true;

      if (startNavi == 1) {
         needPrev = false;
      }
      if (endNavi == pageTotalCount) {
         needNext = false;
      }
      // 준비 완료
      StringBuilder sb = new StringBuilder();
      if (needPrev) {
         sb.append("<li class='page-item'><a class='page-link' href='/searchCommunity?postKinds=" + postKinds
               + "&currentPage=" + (startNavi - 1) + "&searchOption="+searchOption+"&searchKey="+searchKey+"'>Previous</a></li>");
      }
      for (int i = startNavi; i <= endNavi; i++) {
         if (i == currentPage) {
            sb.append("<li class='page-item'><a class='page-link' href='/searchCommunity?postKinds=" + postKinds
                  + "&currentPage=" + i + "&searchOption="+searchOption+"&searchKey="+searchKey+"'><b>" + i + "</b></a></li>");
         } else {
            sb.append("<li class='page-item'><a class='page-link' href='/searchCommunity?postKinds=" + postKinds
                  + "&currentPage=" + i + "&searchOption="+searchOption+"&searchKey="+searchKey+"'>" + i + "</a></li>");
         }
      }
      if (needNext) {
         sb.append("<li class='page-item'><a class='page-link' href='/searchCommunity?postKinds=" + postKinds
               + "&currentPage=" + (endNavi + 1) + "&searchOption="+searchOption+"&searchKey="+searchKey+"'>Next</a></li>");
      }
      return sb.toString();
   }

   public int updatePostViewsCommunity(Connection conn, int postNo) {
      Community community = null;
      PreparedStatement pstmt = null;
      String query = "UPDATE COMMUNITY SET POST_VIEWS = POST_VIEWS + 1 WHERE POST_NO = ?";
      int result = 0;
      try {
         community = new Community();
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, postNo);
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return result;
   }
   
         public Community selectShowCommunity(Connection conn, int postNo) {
            Community community = null;
            PreparedStatement pstmt = null;
            ResultSet rset = null;
            String query = "SELECT * FROM COMMUNITY WHERE POST_NO = ?";
            try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, postNo);
            rset = pstmt.executeQuery();
            if(rset.next()) {
              community = new Community();
               community.setPostNo(rset.getInt("POST_NO"));
               community.setPostKinds(rset.getString("POST_KINDS"));
               community.setPostWriter(rset.getString("POST_WRITER"));
               community.setPostSubject(rset.getString("POST_SUBJECT"));
               community.setPostContent(rset.getString("POST_CONTENT"));
               community.setPostRecommended(rset.getInt("POST_RECOMMEND"));
               community.setPostViews(rset.getInt("POST_VIEWS"));
               community.setPostRegDate(rset.getDate("POST_REGDATE"));
            }else {
               System.out.println("rset에러");
            } 
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            try {
               pstmt.close();
               rset.close();
            } catch (SQLException e) {
               e.printStackTrace();
            }
         }
         return community;
      }

   public int deleteCommunity(Connection conn, int postNo) {
      // 게시글 삭제하는 메소드
      PreparedStatement pstmt = null;
      int result = 0;
      String query = "DELETE FROM COMMUNITY WHERE POST_NO = ?";

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, postNo);
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return result;
   }

   public int modifyCommunity(Connection conn, int postNo, String subject, String contentArea) {
         // 게시글 수정하는 메소드
         PreparedStatement pstmt = null;
         String query = "UPDATE COMMUNITY SET POST_SUBJECT=?, POST_CONTENT=?, POST_REGDATE = SYSDATE WHERE POST_NO=?";
         int result = 0;
         try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, subject);
            pstmt.setString(2, contentArea);
            pstmt.setInt(3, postNo);
            result = pstmt.executeUpdate();
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            try {
               pstmt.close();
            } catch (SQLException e) {
               e.printStackTrace();
            }
         }
         return result;
      }

   public int insertCommunity(Connection conn, String subject, String contentArea, String postKind, String mId) {
      PreparedStatement pstmt = null;
      int result = 0;
      String query = "INSERT INTO COMMUNITY VALUES(COMMUNITY_NO_SEQ.NEXTVAL,?,?,?,?,0,0, SYSDATE)";
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, postKind);
         pstmt.setString(2, mId);
         pstmt.setString(3, subject);
         pstmt.setString(4, contentArea);
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return result;
   }

   public ArrayList<Community> bestStoryCommunity(Connection conn, String postKinds) {
      // 스토리, 레시피 게시판에서 베스트 게시글 3개 보여주는 메소드
      ArrayList<Community> communityList = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      communityList = new ArrayList<Community>();
      String query = "SELECT * FROM (SELECT * FROM COMMUNITY C ORDER BY C.POST_VIEWS DESC) WHERE POST_KINDS=? AND ROWNUM < 4";

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, postKinds);
         rset = pstmt.executeQuery();
         while (rset.next()) {
            Community community = new Community();
            community.setPostNo(rset.getInt("POST_NO"));
            community.setPostKinds(rset.getString("POST_KINDS"));
            community.setPostWriter(rset.getString("POST_WRITER"));
            community.setPostSubject(rset.getString("POST_SUBJECT"));
            community.setPostContent(rset.getString("POST_CONTENT"));
            community.setPostRecommended(rset.getInt("POST_RECOMMEND"));
            community.setPostViews(rset.getInt("POST_VIEWS"));
            community.setPostRegDate(rset.getDate("POST_REGDATE"));
            communityList.add(community);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return communityList;
   }

   public int recommendCommunity(Connection conn, int postNo, int postRecommend) {
         Community community = null;
         PreparedStatement pstmt = null;
         int result = 0;
         String query = "UPDATE COMMUNITY SET POST_RECOMMEND = POST_RECOMMEND + ? WHERE POST_NO = ?";
         
         try {
            community = new Community();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, postRecommend);
            pstmt.setInt(2, postNo);
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
   
   
   /*
    * public int insertCommunity(Connection conn, Community community) { // 게시글 쓰는
    * 메소드 } ======= PreparedStatement pstmt = null; int result = 0; String query =
    * "INSERT INTO COMMUNITY VALUES(COMMUNITY_NO_SEQ.NEXTVAL,?,?,?,?,0,0, SYSDATE)"
    * ; try { pstmt = conn.prepareStatement(query); pstmt.setString(1, postKind);
    * pstmt.setString(2, mId); pstmt.setString(3, subject); pstmt.setString(4,
    * contentArea); result = pstmt.executeUpdate(); } catch (SQLException e) { //
    * TODO Auto-generated catch block e.printStackTrace(); } finally { try {
    * pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } } return
    * result; } >>>>>>> refs/remotes/origin/LEESW_0529_new
    * 
    * <<<<<<< HEAD
    * 
    * 
    * ======= /* public ArrayList<Community> bestStoryCommunity(Connection conn){
    * // 스토리, 레시피 게시판에서 베스트 게시글 2개 보여주는 메소드 } >>>>>>>
    * refs/remotes/origin/LEESW_0529_new public ArrayList<Community>
    * bestRecipeCommunity(Connection conn){ // 스토리, 레시피 게시판에서 베스트 게시글 2개 보여주는 메소드 }
    */
}