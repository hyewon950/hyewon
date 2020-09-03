package orderList.model.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import orderList.model.service.OrderListService;

/**
 * Servlet implementation class AddBasketListServlet
 */
@WebServlet("/AddBasketList")
public class AddBasketListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBasketListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
	      request.setCharacterEncoding("UTF-8");
	      int prdAmount=Integer.parseInt(request.getParameter("prdAmount"));      
	      int prdNo=Integer.parseInt(request.getParameter("prdNo"));
		
	      HttpSession session = request.getSession();
	      String mId =null;
	      if(session != null && (session.getAttribute("member")!= null)) {
	         mId=((Member)session.getAttribute("member")).getmId();
	      }else {
	    	  	response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				  
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인이 필요한 페이지입니다.로그인하시겠습니까?'); location.href='/views/extra/loginPage.jsp';</script>"
				 );
				out.close();
	      }
	      
	      int result=new OrderListService().addBasketList(prdAmount,prdNo,mId);
	      
	      if(result>0) {
			/*
			 * RequestDispatcher
			 * view=request.getRequestDispatcher("/views/sale/msgAddCart.jsp");
			 * request.setAttribute("msg", "장바구니 담기 완료. 장바구니로 이동하시겠습니까?");
			 * view.forward(request, response);
			 */
	    	  
	 		 response.setCharacterEncoding("UTF-8");
			 response.setContentType("text/html; charset=UTF-8");
			  
			  PrintWriter out = response.getWriter();
			 out.println("<script>alert('장바구니 담기 완료! 장바구니로 이동하시겠습니까?'); location.href='/searchBasket';</script>"
			  );
			  out.close();
	    	  
	    	  
	    	  
	    	  
	    	  
	      }else {
	    	  response.sendRedirect("/views/sale/saleError.html");

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
