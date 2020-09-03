package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.domain.Member;
import member.service.MemberService;
import member.service.MemberServiceimpl;

/**
 * Servlet implementation class DeleteMemberController
 */
@WebServlet("/deleteMember.do")
public class DeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		MemberService service=new MemberServiceimpl();
		String userId=request.getParameter("id");
		Member member= new Member();
		member.setUserId(userId);
		
		try {
			int result=service.deleteMember(member);
			if(result>0) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('삭제가 완료되었습니다.'); location.href='memberList.do';</script>");
				out.flush(); 
			}
		} catch (Exception e) {
			RequestDispatcher error
			= request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
		request.setAttribute("message", e.getMessage());
		error.forward(request, response);

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
