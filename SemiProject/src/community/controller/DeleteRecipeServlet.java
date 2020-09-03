package community.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.model.service.CommunityService;
import postImage.model.service.PostImageService;
import recipe.model.service.RecipeService;

/**
 * Servlet implementation class DeleteRecipeServlet
 */
@WebServlet("/deleteRecipe")
public class DeleteRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteRecipeServlet() {
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
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String filePath = request.getParameter("filePath");

		File file = new File(filePath);
		int result = 0;
		String encodePostKinds = URLEncoder.encode("레시피");
		result = new RecipeService().deleteRecipe(postNo);
		if (result > 0) {
			result = new PostImageService().deletePostImage(postNo);

			file.delete();

			result = new CommunityService().deleteCommunity(postNo);
			response.sendRedirect("/communityMain?postKinds=" + encodePostKinds);

		} else {
			System.out.println("레시피게시글 업로드 실패");
			return;
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
