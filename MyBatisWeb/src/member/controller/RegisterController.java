package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.domain.Member;
import member.service.MemberServiceimpl;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/memberRegister.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //menubar.jsp에서 회원가입 링크를 누르면 url요청은 get으로 하게 됩니다

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.getRequestDispatcher("WEB-INF/views/member/registerForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */ //form의 method가 post였기 때문에 여기로옴
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String birthDay = request.getParameter("birthDay");
		int genderNumber = Integer.parseInt(request.getParameter("gender"));
		String gender = "";
		if (genderNumber == 1 || genderNumber == 3) {
			gender = "M";
		}else {
			gender = "F";
		}
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		Member mem =new Member();
		mem.setUserId(userId);
		mem.setUserPwd(userPwd);
		mem.setUserName(userName);
		mem.setEmail(email);
		mem.setBirthDay(birthDay);
		mem.setGender(gender);
		mem.setPhone(phone);
		mem.setAddress(address);
		
		
		
		try {
			int result=new MemberServiceimpl().insertMember(mem);
			if(result>0) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('회원가입이 완료되었습니다.'); location.href='index.jsp';</script>");
				out.flush();
			}
		} catch (Exception e) {
			RequestDispatcher error
			= request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
		request.setAttribute("message", e.getMessage());
		error.forward(request, response);

		}

		
		
		
		
		
		
		
		
	}
}
