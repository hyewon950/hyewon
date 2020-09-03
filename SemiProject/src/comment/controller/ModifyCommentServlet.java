package comment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import comment.model.service.CommentService;
import comment.model.vo.Comment;
import member.model.vo.Member;

/**
 * Servlet implementation class ModifyCommentServlet
 */
@WebServlet("/modifyComment")
public class ModifyCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String userId = null;
		if(session != null &&(session.getAttribute("member")!= null)) {
			userId = ((Member)session.getAttribute("member")).getmId();
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 댓글 등록이 가능합니다.'); location.href='/views/extra/loginPage.html';</script>");
			out.flush();
		}
		String mentContent = request.getParameter("mentContent");
		int mentNo = Integer.parseInt(request.getParameter("mentNo"));
		
		int result = 0;
		result = new CommentService().modifyComment(mentNo, mentContent);
		Comment comment = new Comment();
		comment = new CommentService().modifyComment(mentNo);
		JSONObject jsonObject = new JSONObject();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String regDate = dateFormat.format(comment.getMentRegDate());
		String ment = URLEncoder.encode(comment.getMentContent(),"utf-8").replace("+", "%20");
		System.out.println(ment);
		jsonObject.put("content", ment);
		jsonObject.put("writer", URLEncoder.encode(userId,"utf-8"));
		jsonObject.put("regDate", URLEncoder.encode(regDate,"utf-8"));
		jsonObject.put("mentNo", comment.getMentNo());
		response.setContentType("application/json");
		PrintWriter printWriter = response.getWriter();
	    printWriter.print(jsonObject);
	    printWriter.flush();
	    printWriter.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
