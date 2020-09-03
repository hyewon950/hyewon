package orderList.model.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import orderList.model.service.OrderListService;
import orderList.model.vo.OrderList;

/**
 * Servlet implementation class MyOrderListServlet
 */
@WebServlet("/myOrderList")
public class MyOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyOrderListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mId = null;
		HttpSession session = request.getSession();
		if (session != null && (session.getAttribute("member") != null)) {
			mId = ((Member) session.getAttribute("member")).getmId();
		} else {
			mId = "user1"; // 테스트용
		}

		ArrayList<OrderList> list = new OrderListService().myOrderList(mId);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/extra/searchBuy.jsp");
		request.setAttribute("myList", list);
		
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
