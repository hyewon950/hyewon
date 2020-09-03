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

import member.model.service.MemberService;
import member.model.vo.Member;
import orderList.model.service.OrderListService;
import orderList.model.vo.OrderList;

/**
 * Servlet implementation class SearchBasketServlet
 */
@WebServlet("/searchBasket")
public class SearchBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 장바구니 조회
		
		request.setCharacterEncoding("utf-8");
		String mId= null;
		
		HttpSession session = request.getSession();
		
		if (session != null && (session.getAttribute("member") != null)) {
			// 로그인 했을때
			mId = ((Member)session.getAttribute("member")).getmId();
			
		} else {
			// 로그인 안했을때
			mId ="user1"; //테스트용
		}
		
		
		ArrayList<OrderList> basketlist = new OrderListService().selectBasket(mId);
		
		if(basketlist != null) {
			RequestDispatcher view = request.getRequestDispatcher("/views/extra/searchBasket.jsp");
			request.setAttribute("basket", basketlist);
			view.forward(request, response);
		}else {
			response.sendRedirect("/views/sale/serviceFail.html");
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
