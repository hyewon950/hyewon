package member.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.jsp.tagext.PageData;

import common.ConnectionFactory;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

   private ConnectionFactory factory;

   public MemberService() {
      // TODO Auto-generated constructor stub
      factory = ConnectionFactory.getConnection();
   }

   public Member selectList(String mId, String mPwd) {

      // String query = "SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PWD = ?";
      Member member = null;
      Connection conn = null;

      try {
         conn = factory.createConnection();
         member = new MemberDAO().selectList(conn, mId, mPwd);

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      return member;
   }

   public int searchMemberId(String mName, int mPhone) {
      Connection conn = null;
      Member member = null;
      int result = 0;
      try {
         conn = factory.createConnection();
         result = new MemberDAO().searchMemberId(conn, mName, mPhone);
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

   public int searchMemberPw(String mId, String mName, int mPhone) {
      Connection conn = null;
      int result = 0;

      try {
         conn = factory.createConnection();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return result;
   }

   public int insertMember(Member member) {
      Connection conn = null;
      int result = 0;

      try {
         conn = factory.createConnection();
         result = new MemberDAO().insertMember(conn, member);
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

   public Member selectMemberOne(String mId) {
      Connection conn = null;
      Member member = null;

      try {
         conn = factory.createConnection();
         member = new MemberDAO().selectOne(conn, mId);
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return member;
   }

   public int deleteMember(String mId) {
      Connection conn = null;
      int result = 0;

      try {
         conn = factory.createConnection();
         result = new MemberDAO().deleteMember(conn, mId);
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

   public int selectMember(String mId2, String mPwd2) {
      Connection conn = null;
      int result2 = 0;

      try {
         conn = factory.createConnection();
         result2 = new MemberDAO().selectMember(conn, mId2, mPwd2);
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      if (result2 > 0) {
         factory.commit(conn);
      } else {
         factory.rollback(conn);
      }

      return result2;
   }

   public int findInfo(String mId, String mName, int mPhone) {
      Connection conn = null;
      int result = 0;

      try {
         conn = factory.createConnection();
         result = new MemberDAO().findInfo(conn, mId, mName, mPhone);

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

   public int updatePwd(String mId, String pWd) {
      Connection conn = null;
      int result = 0;

      try {
         conn = factory.createConnection();
         result = new MemberDAO().findInfo(conn, mId, pWd);

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

   public Member memberId(String name, int phone) {
      Connection conn = null;
      Member member = null;

      try {
         conn = factory.createConnection();
         member = new MemberDAO().memberId(conn, name, phone);
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return member;
   }

   public int updateMember(Member member) {
      // TODO Auto-generated method stub
      Connection conn = null;
      int result = 0;

      try {
         conn = factory.createConnection();
         result = new MemberDAO().updateMember(conn, member);
         if (result > 0) {
            factory.commit(conn);
         } else {
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

   public Member selectM(String id) {
      Connection conn = null;
      Member member = null;

      try {
         conn = factory.createConnection();
         member = new MemberDAO().selectOne(conn, id);
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return member;
   }
   
    public int selectId(String mId) {
         Connection conn = null;
         int result = 0;
         
         try {
            conn = factory.createConnection();
            result = new MemberDAO().selectId(conn, mId);
            if (result > 0) {
               factory.commit(conn);
            } else {
               factory.rollback(conn);
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } /*finally {
            factory.close(conn);
         }*/

         return result;
      }

   public int selectId2(String mId, String pwd) {
      Connection conn = null;
         int result2 = 0;
         
         try {
            conn = factory.createConnection();
            result2 = new MemberDAO().selectId2(conn, mId,pwd);
            if (result2 > 0) {
               factory.commit(conn);
            } else {
               factory.rollback(conn);
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } /*finally {
            factory.close(conn);
         }*/

         return result2;
   }

}