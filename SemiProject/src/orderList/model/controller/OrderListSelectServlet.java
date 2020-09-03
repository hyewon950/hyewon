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
 * Servlet implementation class OrderListSelectServlet
 */
@WebServlet("/orderListSelect")
public class OrderListSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//상품 주문/결제 페이지에서 구매리스트 출력 서블릿
		request.setCharacterEncoding("utf-8");
//		int saleNo = Integer.parseInt(request.getParameter("saleNo"));
//		String mId = request.getParameter("mId");
		String mId= null;
		
		HttpSession session = request.getSession();
		
		if (session != null && (session.getAttribute("member") != null)) {
			// 로그인 했을때
			mId = ((Member)session.getAttribute("member")).getmId();
			
		} else {
			// 로그인 안했을때
			mId ="user1"; //테스트용
		}
		
		
		ArrayList<OrderList> orderlist = new OrderListService().selectOrderList(mId);
		Member member =new MemberService().selectMemberOne(mId);
		
		if(orderlist != null) {
			RequestDispatcher view = request.getRequestDispatcher("/views/sale/orderListPay.jsp");
			request.setAttribute("orderList", orderlist);
			request.setAttribute("memberOne", member);
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
