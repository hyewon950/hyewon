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
import orderList.model.vo.OrderList;
import sale.model.service.SaleService;
import sale.model.vo.SaleDetailPage;

/**
 * Servlet implementation class orderListpayServlet
 */
@WebServlet("/orderListpay")
public class OrderListPayInsertServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListPayInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //결제하기 
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
			  
			  PrintWriter out = response.getWriter(); out.
			  println("<script>alert('로그인이 필요한 페이지입니다.로그인하시겠습니까?'); location.href='/views/extra/loginPage.jsp';</script>"
			  ); out.close();

	    	
    	  
    	  //mId ="user1"; //테스트용
      }
      
      int result=new OrderListService().InsertproductDetailpay(prdAmount,prdNo,mId);
      
		/*
		 * if(orList !=null) { RequestDispatcher view=request.getRequestDispatcher("");
		 * request.setAttribute("mId", orList.getmId()); view.forward(request,
		 * response); }
		 */
      if(result>0) {
    	  RequestDispatcher view=request.getRequestDispatcher("/orderListSelect");
    	  request.setAttribute("mId", mId);  //orderList를 insert성공했다면 mId를 넘겨줄거임
    	  request.setAttribute("prdNo",prdNo);
    	  view.forward(request, response);
    	  
    	  
    	  
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