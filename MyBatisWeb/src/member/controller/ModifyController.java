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
 * Servlet implementation class ModifyController
 */
@WebServlet("/memberModify.do")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService service=new MemberServiceimpl();
		String id=request.getParameter("id");
		Member mem=service.selectOneMember(id);
		request.setAttribute("member", mem);
		request.getRequestDispatcher("WEB-INF/views/member/modify.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService service = new MemberServiceimpl();
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phoneNum");
		String address = request.getParameter("address");
		
		Member member = new Member();
		member.setUserId(userId);
		member.setUserPwd(userPwd);
		member.setEmail(email);
		member.setPhone(phone);
		member.setAddress(address);
		
		try {
			int result = service.updateMember(member);
			if ( result > 0 ) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('정보수정이 완료되었습니다.'); location.href='memberList.do';</script>");
				out.flush();
			}
		}catch (Exception e) {
			RequestDispatcher error
			= request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
			request.setAttribute("message", e.getMessage());
			error.forward(request, response);
		}

	}
}
