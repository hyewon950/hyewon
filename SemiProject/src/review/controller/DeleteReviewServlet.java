package review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;

/**
 * Servlet implementation class DeleteReviewServlet
 */
@WebServlet("/DeleteReview")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rvNo=Integer.parseInt(request.getParameter("rvNo"));
		
		int saleNo=Integer.parseInt(request.getParameter("saleNo"));
		System.out.println(rvNo);
		System.out.println(saleNo);
		
		rvNo=new ReviewService().deleteReview(rvNo);
	
		if(rvNo>0) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>alert('상품리뷰 삭제 완료!'); location.href='/productDetail?saleNo=" + saleNo + "';</script>");
			out.close();

		} else {
			
			 response.setCharacterEncoding("UTF-8");
			 response.setContentType("text/html; charset=UTF-8");
			  
			  PrintWriter out = response.getWriter(); out.
			  println("<script>alert('삭제실패!'); location.href='/productDetail?saleNo="
			  +saleNo+"';</script>"); out.close();
			 
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
