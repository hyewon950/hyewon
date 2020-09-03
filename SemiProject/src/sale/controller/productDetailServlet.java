package sale.controller;

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
import questAnswer.model.service.QuestAnswerService;
import questAnswer.model.vo.QnaPageData;
import review.model.service.ReviewService;
import review.model.vo.ReviewPageData;
import sale.model.service.SaleService;
import sale.model.vo.SaleDetailPage;

/**
 * Servlet implementation class productDetailServlet
 */
@WebServlet("/productDetail")
public class productDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productDetailServlet() {
        super();
        // TODO Auzto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 리스트에서 saleNo를 받아서 saleDetailPage객체를 받아와 출력
		request.setCharacterEncoding("utf-8");
		int saleNo=Integer.parseInt(request.getParameter("saleNo"));
		int currentPage=0;
		
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		 HttpSession session = request.getSession();
	      String mId =null;
	      if(session != null && (session.getAttribute("member")!= null)) {
	         mId=((Member)session.getAttribute("member")).getmId();
	      }else {
	    	  mId="guest";
	      }
	      
		
		SaleDetailPage salepage =new SaleService().selectProductOne(saleNo);
		QnaPageData pageData=new QuestAnswerService().selectQnaList(currentPage,saleNo);
		ReviewPageData reviewData=new ReviewService().selectReview(currentPage,saleNo);
		OrderList orderList=new OrderListService().selectMemberCheck(salepage.getPrdNo(),mId);
		int reviewnum=new ReviewService().countreview(mId, saleNo);
		
		if(salepage !=null) {
			RequestDispatcher view=request.getRequestDispatcher("/views/sale/productList.jsp");
			request.setAttribute("salePage", salepage);
			request.setAttribute("pageData", pageData);
			request.setAttribute("reviwData", reviewData);
			request.setAttribute("reviewWrite",orderList);
			request.setAttribute("reSum",reviewnum);
			view.forward(request, response);
			
		}else {
			/*response.sendError(arg0); 에러 페이지 만들기*/
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
