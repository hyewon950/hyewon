package community.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.model.service.CommunityService;
import community.model.vo.CoPageData;
import community.model.vo.Community;
import postImage.model.service.PostImageService;
import postImage.model.vo.PostImage;

/**
 * Servlet implementation class StoryMainServlet
 */
@WebServlet(name = "communityMain", urlPatterns = { "/communityMain" })
public class CommunityMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommunityMainServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.전송값에 한글이 있을 경우 인코딩 처리
		request.setCharacterEncoding("utf-8");
		// 2.View에서 보낸 전송값 변수 저장
		// 3.비즈니스 로직을 처리할 서비스 클래스 메소드로 값을 전달
		int currentPage = 0;
		// href="/notice/currentPage=1"
		String postKinds = request.getParameter("postKinds");
		ArrayList<Community> communityList = null;
		ArrayList<PostImage> bestimage = null;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		communityList = new CommunityService().bestStoryCommunity(postKinds);
		bestimage = new PostImageService().showBestPostImage(communityList);
		CoPageData coPageData = new CommunityService().selectCommunity(postKinds, currentPage);
		RequestDispatcher view = null;

		view = request.getRequestDispatcher("/views/community/CommunityMain.jsp");
		request.setAttribute("pageData", coPageData);
		request.setAttribute("communityList", communityList);
		request.setAttribute("bestimage", bestimage);
		view.forward(request, response);

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
