package member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import member.model.service.MemberService;
import member.model.vo.Member;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * Servlet implementation class FindIDServlet
 */
@WebServlet("/findID")
public class FindIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindIDServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		/*
		 * String name = request.getParameter("name"); int phone =
		 * Integer.parseInt(request.getParameter("phone").trim()); Member member = new
		 * MemberService().searchMemberId(name, phone); if(member!= null) { HttpSession
		 * session=request.getSession(); session.setAttribute("member", member);
		 * response.sendRedirect("/views/extra/searchId.jsp"); } else {
		 * response.sendRedirect("/views/extra/memberError.html"); }
		 */

		String name = request.getParameter("mName");

		String phoneBefor = request.getParameter("mPhone");

		int phone = Integer.parseInt(phoneBefor.substring(1));

		/* int phone = Integer.parseInt(request.getParameter("phone").trim()); */
		int result = new MemberService().searchMemberId(name, phone);
		Member member = new MemberService().memberId(name, phone);

		if (result > 0) {
			int random = (int) Math.floor(Math.random() * 1000000 + 1);
			String num = String.valueOf(random);
			response.getWriter().println(num);
			System.out.println(num);

			String api_key = "NCSQRYFYWSSQWR9L";
			String api_secret = "5HDDHICZIJNB6CLPJ2ICEV3A7DRQSMVW";
			Message coolsms = new Message(api_key, api_secret);

			// 4 params(to, from, type, text) are mandatory. must be filled
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", phoneBefor);
			params.put("from", "01022632566");
			params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
			params.put("text", "[Farms] - 인증번호는 : " + num + "입니다.!");

			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println(obj.toString());
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			/*response.sendRedirect("/views/extra/searchId.jsp");*/

		} else {
			response.setCharacterEncoding("utf-8");
			response.getWriter().println("올바른 인증번호를 입력해주세요");
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
