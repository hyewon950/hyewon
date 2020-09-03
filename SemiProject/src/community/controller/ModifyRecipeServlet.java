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
import recipe.model.service.RecipeService;
import recipe.model.vo.Recipe;

/**
 * Servlet implementation class ModifyRecipeServlet
 */
@WebServlet("/modifyRecipe")
public class ModifyRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyRecipeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		Community community= new CommunityService().selectShowCommunity(postNo);
		ArrayList<PostImage> images = new PostImageService().showPostImage(postNo);
		ArrayList<Recipe> recipes = new RecipeService().selectRecipe(postNo);
		RequestDispatcher view = request.getRequestDispatcher("/views/community/modifyRecipe.jsp");
		request.setAttribute("content", community);
		request.setAttribute("image", images.get(0));
		request.setAttribute("step", recipes);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
