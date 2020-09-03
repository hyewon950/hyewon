package orderList.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import orderList.model.service.OrderListService;


/**
 * Servlet implementation class SearchBasketDeleteServlet
 */
@WebServlet("/searchBasketDelete")
public class SearchBasketDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchBasketDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 장바구니 선택한 물품 삭제
		request.setCharacterEncoding("utf-8");

		
		String[] basketcheck = request.getParameterValues("basketcheck"); // BuyNo
		
		int result=0;
		
		for(int i =0; i<basketcheck.length; i++) {
			
		result =new OrderListService().deleteBasket(Integer.parseInt(basketcheck[i]));

		}


		if(result > 0 ) {
			response.sendRedirect("/searchBasket");
		}else {
			response.sendRedirect("/views/extra/extraError.html");
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
