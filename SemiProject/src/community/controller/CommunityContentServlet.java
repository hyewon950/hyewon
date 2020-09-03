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
import community.model.vo.Community;
import postImage.model.service.PostImageService;
import postImage.model.vo.PostImage;

/**
 * Servlet implementation class StoryContentServlet
 */
@WebServlet("/communityContent")
public class CommunityContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String postKinds = request.getParameter("postKinds");
		Community community= new CommunityService().selectShowCommunity(postNo);
		System.out.println(community.getPostSubject());
		ArrayList<PostImage> images = new PostImageService().showPostImage(postNo);
		RequestDispatcher view;
		if(community != null) {
			if(postKinds.equals("스토리")||postKinds.equals("공동구매")||postKinds.equals("공지사항")) {
				view = request.getRequestDispatcher("/views/community/CommunityContent.jsp");
				request.setAttribute("content", community);
				if(images.size()!=0) {
					request.setAttribute("images", images);
				}
				view.forward(request, response);
			}else if(postKinds.equals("레시피")){
				view = request.getRequestDispatcher("/recipeContent");
				request.setAttribute("content", community);
				request.setAttribute("postNo", postNo);
				if(images.size()!=0) {
					request.setAttribute("image", images.get(0));
				}
				view.forward(request, response);
			}
			else {
				System.out.println("게시판종류 불러오기 오류");
			}
			
		}else {
			System.out.println("에러");
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
