package questAnswer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import questAnswer.model.service.QuestAnswerService;
import questAnswer.model.vo.QnaPageData;

/**
 * Servlet implementation class QnaListServlet
 */
@WebServlet("/QnaList")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	int currentPage=0;
	
/*	if(request.getParameter("currentPage")==null) {
		currentPage=1;
	}else {
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
		
	}
	QnaPageData pageData=new QuestAnswerService().selectQnaList(currentPage);
	
	RequestDispatcher view=request.getRequestDispatcher("views/sale/productList.jsp");
	request.setAttribute("pageData", pageData);
	view.forward(request, response);
	*/
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
