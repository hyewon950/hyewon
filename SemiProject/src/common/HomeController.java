package common;

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
import sale.model.service.SaleService;
import sale.model.vo.Sale;
import saleImage.model.service.SaleImageService;
import saleImage.model.vo.SaleImage;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/main")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	
		String postKindsstory = "스토리";
		String postKindsrecipe = "레시피";
		ArrayList<Community> communityStoryList = null;
		ArrayList<PostImage> bestStoryImage = null;
		ArrayList<Community> communityRecipeList = null;
		ArrayList<PostImage> bestRecipeImage = null;
		ArrayList<Sale> saleList = null;
		ArrayList<SaleImage> bestImage = null;
		ArrayList<Sale> recentSale = null;
		ArrayList<SaleImage> saleNewImage = null;
		String prdClass = null;
		
		saleList = new SaleService().bestSaleList(prdClass); 	
		bestImage = new SaleImageService().showBestSaleImage(prdClass, saleList); 
		communityStoryList = new CommunityService().bestStoryCommunity(postKindsstory);
		communityRecipeList = new CommunityService().bestStoryCommunity(postKindsrecipe);
		bestStoryImage = new PostImageService().showBestPostImage(communityStoryList);
		bestRecipeImage = new PostImageService().showBestPostImage(communityRecipeList);
		recentSale = new SaleService().recentSale();
		saleNewImage = new SaleImageService().saleNewImage(recentSale);
		RequestDispatcher view = request.getRequestDispatcher("/main.jsp");
		
		
		request.setAttribute("communityStoryList", communityStoryList);
		request.setAttribute("communityRecipeList", communityRecipeList);
		request.setAttribute("bestStoryImage", bestStoryImage);
		request.setAttribute("bestRecipeImage", bestRecipeImage);
		request.setAttribute("saleList", saleList);		
		request.setAttribute("bestImage", bestImage);	
		request.setAttribute("recentSale", recentSale);		
		request.setAttribute("saleNewImage", saleNewImage);	
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
