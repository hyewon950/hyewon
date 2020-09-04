package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeCommentWriteServlet
 */
@WebServlet("/noticeCommentWrite")
public class NoticeCommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCommentWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String comment=request.getParameter("comment");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		
		HttpSession session = request.getSession();
		String userId=null;
		if(session != null && (session.getAttribute("member")!= null)) {
			userId=((Member)session.getAttribute("member")).getUserId();
		}else {
			userId="anonymous";
		}
		int result=new NoticeService().commentWrite(comment,noticeNo,userId);
		
		if(result > 0) {
			response.sendRedirect("/noticeSelect?noticeNo="+noticeNo);
		} else {
			response.sendRedirect("/views/notice/noticeError.html");

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
