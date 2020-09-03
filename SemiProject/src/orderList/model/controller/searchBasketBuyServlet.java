package orderList.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orderList.model.service.OrderListService;

/**
 * Servlet implementation class searchBasketBuyServlet
 */
@WebServlet("/searchBasketBuy")
public class searchBasketBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public searchBasketBuyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 장바구니에서 선택된 상품 구매

		request.setCharacterEncoding("utf-8");

		String[] basketcheck = request.getParameterValues("basketcheck"); // BuyNo

		int result = 0;

		for (int i = 0; i < basketcheck.length; i++) {

			result = new OrderListService().updateBasket(Integer.parseInt(basketcheck[i]));

		}

		if (result > 0) {
			response.sendRedirect("/orderListSelect");
		} else {
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
