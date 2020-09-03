package review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import review.model.service.ReviewService;

/**
 * Servlet implementation class reviewModifyServlet
 */
@WebServlet("/reviewModify")
public class reviewModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public reviewModifyServlet() {
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
		String rvcontent = request.getParameter("rvContent1");
		int saleNo = Integer.parseInt(request.getParameter("saleNo"));
		/*
		 * String mId=request.getParameter("modifyrvMid1"); System.out.println(mId);
		 */
		HttpSession session = request.getSession();
		String mId = null;
		if (session != null && (session.getAttribute("member") != null)) {
			mId = ((Member) session.getAttribute("member")).getmId();
		}else {
			mId="user1";
		}

		int result = new ReviewService().updateReview(rvcontent, saleNo, mId);

		if (result > 0) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>alert('상품 리뷰수정 완료!'); location.href='/productDetail?saleNo=" + saleNo + "';</script>");
			out.close();

		} else {
			
			 response.setCharacterEncoding("UTF-8");
			 response.setContentType("text/html; charset=UTF-8");
			  
			  PrintWriter out = response.getWriter(); out.
			  println("<script>alert('리뷰수정 실패!'); location.href='/productDetail?saleNo="
			  +saleNo+"';</script>"); out.close();
			 

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
