package community.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
import postImage.model.service.PostImageService;
import postImage.model.vo.PostImage;

/**
 * Servlet implementation class ModifyCommunityServlet
 */
@WebServlet("/modifyCommunity")
public class ModifyCommunityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModifyCommunityServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String postWriter = request.getParameter("postWriter");
		Community community = new CommunityService().selectShowCommunity(postNo);
		ArrayList<PostImage> postImage = new PostImageService().showPostImage(postNo);
		String mId = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("member") == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 수정하실 수 있습니다.'); location.href='/views/extra/loginPage.html';</script>");
			out.flush();
		} else {
			mId = ((Member) session.getAttribute("member")).getmId();
			if (!mId.equals(postWriter)) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('작성자만 수정할 수 있습니다.'); location.href='/index=.jsp';</script>");
				out.flush();
			} else if (community != null) {
				RequestDispatcher view = request.getRequestDispatcher("/views/community/modifyCommunity.jsp");
				request.setAttribute("community", community);
				request.setAttribute("image", postImage);
				view.forward(request, response);
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