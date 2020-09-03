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
 * Servlet implementation class OrderCompletedServlet
 */
@WebServlet("/orderCompleted")
public class OrderCompletedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderCompletedServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 결제하기 버튼 클릭시 서블릿
		
		request.setCharacterEncoding("utf-8");
		String mId ="";
		
		//수정중
		String buyNoList = request.getParameter("buyNo");
		
	        // split()을 이용해 ','를 기준으로 문자열을 자른다.
	        // split()은 지정한 문자를 기준으로 문자열을 잘라 배열로 반환한다.
	        String buyNoData[] = buyNoList.split(",");
	        
	        //출력확인용
	         /* for(int i=0 ; i<buyNoData.length ; i++)
	        {
	            System.out.println("buyNoData["+i+"] : "+buyNoData[i]);
	        }*/


		HttpSession session = request.getSession();

		if (session != null && (session.getAttribute("member") != null)) {
			// 로그인 했을때
			mId = ((Member) session.getAttribute("member")).getmId();

		} else {
			// 로그인 안했을때
			mId = "user1"; // 테스트용
		}

		int result = new OrderListService().updateOrderList(mId);
		Member member =new MemberService().selectMemberOne(mId);

		if (result != 0) {
			RequestDispatcher view = request.getRequestDispatcher("/views/sale/orderCompleted.jsp");
			ArrayList<OrderList> list = null;
			list = new ArrayList<OrderList>();
			
			for(int i=0 ; i<buyNoData.length ; i++)
	        {
				int num = Integer.parseInt(buyNoData[i]);
				OrderList order = new OrderList();
				order = new OrderListService().selectOrderListCompleted(num);
				if(order!=null) {
					list.add(order);
				}
				
	        }
			request.setAttribute("completedList", list);
			request.setAttribute("memberOne", member);
			view.forward(request, response);
			
		} else {
			response.sendRedirect("/views/sale/serviceFail.html");
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
