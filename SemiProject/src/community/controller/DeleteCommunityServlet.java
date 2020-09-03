package community.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import community.model.service.CommunityService;
import community.model.vo.Community;
import member.model.vo.Member;

/**
 * Servlet implementation class DeleteCommunityServlet
 */
@WebServlet("/deleteCommunity")
public class DeleteCommunityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteCommunityServlet() {
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
		String mId = null;
		String postWriter = request.getParameter("postWriter");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String postKinds = request.getParameter("postKinds");
		String encpostKinds = URLEncoder.encode(request.getParameter("postKinds"));
		HttpSession session = request.getSession();
		if (session.getAttribute("member") == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('작성자만 삭제할 수 있습니다.'); location.href='/views/extra/loginPage.html';</script>");
			out.flush();
			
		} else {
			mId = ((Member) session.getAttribute("member")).getmId();
			if (!mId.equals(postWriter)) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('작성자만 삭제할 수 있습니다.'); location.href='/main.jsp';</script>");
				out.flush();
				
			} else {
				int result = new CommunityService().deleteCommunity(postNo);
				if (result > 0) {
					response.sendRedirect("/communityMain?postKinds=" + encpostKinds);
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
