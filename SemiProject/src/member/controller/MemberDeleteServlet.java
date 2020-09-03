package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/mDelete")
public class MemberDeleteServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      request.setCharacterEncoding("utf-8");
         HttpSession session = request.getSession();
         Member m = (Member)session.getAttribute("member");
         String mId = m.getmId();
         String mPwd = m.getmPwd();
         System.out.println("memeber : "+m);
         
         String mId2 = request.getParameter("mId");
         String mPwd2 = request.getParameter("mPwd");
         System.out.println("mId2 : "+mId2);
         System.out.println("mPwd2 : " + mPwd2);
         
         // Id,pWd check
         int result2 = new MemberService().selectMember(mId2,mPwd2);
         System.out.println("result2 : " + result2);
         
         if(result2 > 0) {
            // id,Pwd 일치할때 계정 삭제처리
            int result = new MemberService().deleteMember(mId);
            System.out.println("resutl : "+result);
            if(result > 0) {
               response.sendRedirect("/");
               session.invalidate();
            }else {
               response.sendRedirect("/");
            }
         }

   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}