package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.tagext.PageData;

import java.sql.SQLException;

import com.sun.javafx.geom.transform.GeneralTransform3D;

import member.model.vo.Member;

public class MemberDAO {

   public Member selectList(Connection conn, String userId, String userPwd) {
      // String query = "SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PWD = ?";
      //  쉶 썝 濡쒓렇 씤  븯 뒗 硫붿냼 뱶
      Member member = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "SELECT * FROM MEMBER WHERE M_ID = ? AND M_PWD = ?";

      try {
         pstmt = conn.prepareStatement(query);
         member = new Member();
         pstmt.setString(1, userId);
         pstmt.setString(2, userPwd);
         rset = pstmt.executeQuery();
         if (rset.next()) {
            member.setmId(rset.getString("m_id"));
            member.setmPwd(rset.getString("m_pwd"));
            member.setmName(rset.getString("m_name"));
            member.setmPhone(rset.getInt("m_phone"));
            member.setmAddress1(rset.getString("m_address1"));
            member.setmAddress2(rset.getString("m_address2"));
            member.setmAddress3(rset.getString("m_address3"));
            member.setmAddress4(rset.getString("m_address4"));
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

      return member;
   }

   /*
    * public int modifyMember(Connection conn, Member member) { //  쉶 썝  젙蹂   닔 젙 븯 뒗 硫붿냼 뱶 }
    * 
    * public int deleteMember(Connection conn, String mId, String mPwd) { //  쉶 썝  깉 눜
    *  븯 뒗 硫붿냼 뱶 }
    */

   public int searchMemberId(Connection conn, String mName, int mPhone) {
      //  쉶 썝 븘 씠 뵒 李얘린 硫붿냼 뱶
      /* Member member = null; */
      PreparedStatement pstmt = null;
      int result = 0;
      ResultSet rset = null;
      String query = "SELECT count(*) FROM MEMBER WHERE M_NAME=? AND M_PHONE=?";

      try {
         pstmt = conn.prepareStatement(query);
         /* member = new Member(); */
         pstmt.setString(1, mName);
         pstmt.setInt(2, mPhone);
         rset = pstmt.executeQuery();

         if (rset.next()) {
            /*
             * member.setmId(rset.getString("M_ID"));
             * member.setmPwd(rset.getString("M_PWD"));
             * member.setmName(rset.getString("M_NAME"));
             * member.setmPhone(rset.getInt("M_PHONE"));
             * member.setmAddress(rset.getString("M_ADDRESS"));
             */
            result = rset.getInt(1);

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
      return result;
   }

   /*
    * public int verification(Connection conn, String mId, String mName, int
    * mPhone) { //  쉶 썝鍮꾨 踰덊샇 李얘린 硫붿냼 뱶 }
    * 
    * public int modifyPassword(Connection conn, String mPwd) { //  쉶 썝 鍮꾨 踰덊샇  닔 젙 硫붿냼 뱶 }
    */

   public int insertMember(Connection conn, Member member) {
      //  쉶 썝 媛  엯  븯 뒗 硫붿냼 뱶
      PreparedStatement pstmt = null;
      int result = 0;
      String query = "INSERT INTO MEMBER(M_ID, M_PWD,M_NAME,M_PHONE) VALUES(?,?,?,?)";

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, member.getmId());
         pstmt.setString(2, member.getmPwd());
         pstmt.setString(3, member.getmName());
         pstmt.setInt(4, member.getmPhone());

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
    * public PageData selectMyOrderList(Connection conn, int currentPage, int
    * recordCountPerPage, int naviCountPerPage, String mId) { //  굹 쓽 援щℓ 궡 뿭  솗 씤 硫붿냼 뱶
    * 
    * }
    */

   public Member selectOne(Connection conn, String mId) {
      //  쉶 썝 젙蹂  硫붿냼 뱶
      Member member = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "SELECT * FROM MEMBER WHERE M_ID = ?";

      try {

         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, mId);
         rset = pstmt.executeQuery();

         if (rset.next()) {

            member = new Member();
            member.setmId(rset.getString("M_ID"));
            member.setmPwd(rset.getString("M_PWD"));
            member.setmName(rset.getString("M_NAME"));
            member.setmPhone(rset.getInt("M_PHONE"));
            member.setmAddress1(rset.getString("M_ADDRESS1"));
            member.setmAddress2(rset.getString("M_ADDRESS2"));
            member.setmAddress3(rset.getString("M_ADDRESS3"));
            member.setmAddress4(rset.getString("M_ADDRESS4"));

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
      return member;
   }

   public int deleteMember(Connection conn, String mId) {
      //  쉶 썝  깉 눜  븯 뒗 硫붿냼 뱶
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      int result = 0;
      String query = "DELETE FROM MEMBER WHERE M_ID=?";

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, mId);

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

   public int selectMember(Connection conn, String mId2, String mPwd2) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      int result2 = 0;
      String query = "SELECT COUNT(*) FROM MEMBER WHERE M_ID=? AND M_PWD=?";

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, mId2);
         pstmt.setString(2, mPwd2);

         result2 = pstmt.executeUpdate();

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }

      return result2;
   }

   public int findInfo(Connection conn, String mId, String mName, int mPhone) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;

      int result = 0;

      String query = "SELECT COUNT(*) FROM MEMBER WHERE M_ID=? AND M_NAME=? AND M_PHONE=?";
      // SELECT COUNT(*) FROM MEMBER WHERE M_ID='user1' AND M_NAME=' 솉湲몃룞' AND
      // M_PHONE=1011111111;
      // 荑쇰━臾몄쓣 異쒕젰 븯硫  count(*)媛믪씠  굹 삤 뒗 뜲  씠 寃곌낵 媛믪  0  븘 땲硫  1 엫
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, mId);
         pstmt.setString(2, mName);
         pstmt.setInt(3, mPhone);

         rset = pstmt.executeQuery();
         // 荑쇰━ 媛믪쓣  굹   깂

         if (rset.next()) {
            // rset.next() rset媛믪씠  엳 쑝硫  rset 쓣 怨꾩냽  룎 젮 꽌 媛믪씠  엳 쓣  븣源뚯   룎由곕떎
            result = rset.getInt(1);
            // rset   resultset  씠寃껋쓣 int 삎 result濡  諛섑솚 빐二쇨린  쐞 빐 꽌
            // rset 뿉 꽌 getInt 븿  뿬湲곗꽌 (1)   泥ル쾲吏  移쇰읆 쓣 媛  졇 샂 (db 뿉 꽌 荑쇰━臾   떎 뻾 븯硫  coumt 븯怨  而щ읆留  異쒕젰)
            // 異쒕젰 맂 媛믪씠 泥ル쾲吏  移쇰읆 씠 땲源  getInt(1) 빐 꽌 泥ル쾲吏  寃곌낵 媛믪쓣 媛  졇 삤怨  int 삎 쑝濡  result 뿉  꽔 뒗 떎
            // (rset    옄猷뚰삎 씠 resultset 씠 땲源  int 삎 쑝濡  諛섑솚 빐二쇨린  쐞 빐  궗 슜)
         }

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

   public int findInfo(Connection conn, String mId, String pWd) {
      PreparedStatement pstmt = null;
      int result = 0;

      String query = "UPDATE MEMBER SET M_PWD = ? WHERE M_ID = ?";

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, pWd);
         pstmt.setString(2, mId);

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

   public int updateMember(Connection conn, Member member) {
      PreparedStatement pstmt = null;
      int result = 0;
      String query = "UPDATE MEMBER SET M_PWD=?, M_ADDRESS1=?, M_ADDRESS2=?, M_ADDRESS3=?, M_ADDRESS4=?, M_PHONE=? WHERE M_ID=?";
      System.out.println(member.getmAddress1());
      try {
         pstmt = conn.prepareStatement(query);

         pstmt.setString(1, member.getmPwd());
         pstmt.setString(2, member.getmAddress1());
         pstmt.setString(3, member.getmAddress2());
         pstmt.setString(4, member.getmAddress3());
         pstmt.setString(5, member.getmAddress4());
         pstmt.setInt(6, member.getmPhone());
         pstmt.setString(7, member.getmId());
         /* System.out.println(member.getmId()); */
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

   public Member memberId(Connection conn, String name, int phone) {
      Member member = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "SELECT * FROM MEMBER WHERE M_NAME=? AND M_PHONE=?";

      try {
         pstmt = conn.prepareStatement(query);
         member = new Member();
         pstmt.setString(1, name);
         pstmt.setInt(2, phone);
         rset = pstmt.executeQuery();

         if (rset.next()) {
            member.setmId(rset.getString("M_ID"));
            member.setmPwd(rset.getString("M_PWD"));
            member.setmName(rset.getString("M_NAME"));
            member.setmPhone(rset.getInt("M_PHONE"));
            member.setmAddress1(rset.getString("M_ADDRESS"));
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
      return member;
   }

   public int selectId(Connection conn, String mId) {
      
         PreparedStatement pstmt = null;
         ResultSet rset = null;

         int result = 0;

         String query = "SELECT COUNT(*) FROM MEMBER WHERE M_ID=?";
         try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, mId);

            rset = pstmt.executeQuery();
            // 荑쇰━ 媛믪쓣  굹   깂

            if (rset.next()) {
               result = rset.getInt(1);
            }

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

   public int selectId2(Connection conn, String mId, String pwd) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;

      int result2 = 0;

      String query = "SELECT COUNT(*) FROM MEMBER WHERE M_ID=? AND M_PWD=?";
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, mId);
         pstmt.setString(2, pwd);
         
         rset = pstmt.executeQuery();
         // 荑쇰━ 媛믪쓣  굹   깂

         if (rset.next()) {
            result2 = rset.getInt(1);
         }

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }

      return result2;
   }
}