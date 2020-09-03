package review.controller;

import java.io.Console;
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
import review.model.service.ReviewService;

/**
 * Servlet implementation class ProductReviewInsertServlet
 */
@WebServlet("/PdReviewInsert")
public class ProductReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String content=request.getParameter("rvContent");
		int saleNo=Integer.parseInt(request.getParameter("saleNo"));
	//	System.out.println(saleNo);
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
	      int result=new ReviewService().insesrtReview(saleNo,content,mId);
				if(result>0) {
				/*	RequestDispatcher view=request.getRequestDispatcher("/views/sale/productList.jsp");*/
			
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");

					PrintWriter out = response.getWriter();

					out.println("<script>alert('상품 리뷰등록 완료!'); location.href='/productDetail?saleNo="+saleNo+"';</script>");
					out.close();

					
				}else {
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");

					PrintWriter out = response.getWriter();
					out.println("<script>alert('상품 리뷰등록 실패'); location.href='/productDetail?saleNo="+saleNo+"';</script>");
					out.close();
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
