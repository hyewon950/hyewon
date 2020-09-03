package questAnswer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import questAnswer.model.service.QuestAnswerService;


/**
 * Servlet implementation class QnaSaleWriteServlet
 */
@WebServlet("/qnaSaleWrite")
public class QnaSaleWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaSaleWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 한글 인코딩 처리
				request.setCharacterEncoding("utf-8");
				String qTitle = request.getParameter("qTitle");
				String qContents = request.getParameter("qContents");
				String userId = null;
				int saleNo = Integer.parseInt(request.getParameter("saleNo"));
//				int saleNo = 1;
				
				HttpSession session = request.getSession();
				
				
				if(session != null && (session.getAttribute("member") != null)) {
					//로그인시
					userId = ((Member)session.getAttribute("member")).getmId();
				}else {
					//로그인 안함
					userId = "anonymous";
				}
				
				System.out.println("-------------");
				System.out.println(qContents);
				System.out.println(qTitle);
				System.out.println(userId + " 유저아이디");
				System.out.println(saleNo + " 물품번호");
				
					int result = new QuestAnswerService().insertQuestAnswer(qTitle,qContents,userId, saleNo);
					if (result > 0) {
						//response.sendRedirect("/productDetail?saleNo="+saleNo); //수정해야함
						response.sendRedirect("/productDetail?saleNo="+saleNo); 
					} else {
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
