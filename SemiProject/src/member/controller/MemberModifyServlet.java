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
 * Servlet implementation class MemberModifyServlet
 */
@WebServlet("/memberModify")
public class MemberModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberModifyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Member member = new Member();
		HttpSession session = request.getSession();
		String phone = request.getParameter("mPhone");
		int pNum = Integer.parseInt(phone.substring(0,3)+phone.substring(4,8)+phone.substring(9));
		
		if (session != null && (session.getAttribute("member") != null)) {
			String mId = ((Member) session.getAttribute("member")).getmId();
			member.setmId(mId);
			member.setmPwd(request.getParameter("mPwd"));
			member.setmName(request.getParameter("mName"));
			member.setmPhone(pNum);
			member.setmAddress1(request.getParameter("mAddress1"));
			member.setmAddress2(request.getParameter("mAddress2"));
			member.setmAddress3(request.getParameter("mAddress3"));
			member.setmAddress4(request.getParameter("mAddress4"));
			int result = new MemberService().updateMember(member);

			if (result > 0) {
				String id = request.getParameter("mId");
				Member m = new MemberService().selectM(id);
				session.setAttribute("member", m);
				response.sendRedirect("/main.jsp");

			} else {
				response.sendRedirect("/views/extra/MemberError.jsp");
			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
