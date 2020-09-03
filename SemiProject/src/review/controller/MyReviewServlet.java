package review.controller;

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
import orderList.model.vo.OrderList;
import review.model.service.ReviewService;
import sale.model.service.SaleService;
import sale.model.vo.Sale;
import sale.model.vo.SaleDetailPage;

/**
 * Servlet implementation class MyReviewServlet
 */
@WebServlet("/myReview")
public class MyReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String mId;
		HttpSession session = request.getSession();
	    mId = ((Member)session.getAttribute("member")).getmId();
	    ArrayList<OrderList> oList;
	    
	    oList = new ReviewService().selectSaleList(mId);
	    
	    System.out.println(oList.size()+"servlet");
	    
	    ArrayList<SaleDetailPage> sList = new ArrayList<SaleDetailPage>();

	    for(int i=0; i<oList.size(); i++) {
	    	SaleDetailPage sale = new SaleService().selectProductOne(oList.get(i).getSaleNo());
	    	sale.setSaleNo(oList.get(i).getSaleNo());
	    	sList.add(sale);
		    System.out.println(sList.get(i).getSaleNo());
		    System.out.println(sList.get(i).getSaleImgName());
	    }
	    
	    RequestDispatcher view;
	    
	    view = request.getRequestDispatcher("/views/extra/Review.jsp");
	    request.setAttribute("sList", sList);
	    request.setAttribute("oList", oList);
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
