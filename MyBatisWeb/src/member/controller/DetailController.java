package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.membership.MemberImpl;

import member.domain.Member;
import member.service.MemberService;
import member.service.MemberServiceimpl;

/**
 * Servlet implementation class DetailController
 */
@WebServlet("/memberDetail.do")
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailController() {
       service=new MemberServiceimpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 String userId=request.getParameter("id");
	 Member mem= service.selectOneMember(userId);
	 request.setAttribute("member", mem);
	 request.getRequestDispatcher("WEB-INF/views/member/detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
