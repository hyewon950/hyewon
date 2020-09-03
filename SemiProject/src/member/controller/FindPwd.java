package member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.model.service.MemberService;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * Servlet implementation class FindPwd
 */
@WebServlet("/FindPwd")
public class FindPwd extends HttpServlet {
   private static final long serialVersionUID = 1L;
       //j
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwd() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @return 
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      String mId = request.getParameter("mId");
      String mName = request.getParameter("mName");
      String mPhoneBefor = request.getParameter("mPhone");
      
      int mPhone = Integer.parseInt(mPhoneBefor.substring(1));
      
      int result = new MemberService().findInfo(mId, mName, mPhone);
      
      if(result > 0) {
		int random = (int)Math.floor(Math.random()*1000000+1);
		String num = String.valueOf(random);
		response.getWriter().println(num);
		System.out.println("인증번호  : " + num);
        
       
		String api_key = "NCSQRYFYWSSQWR9L";
		String api_secret = "5HDDHICZIJNB6CLPJ2ICEV3A7DRQSMVW";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", mPhoneBefor); 
		params.put("from", "01022632566"); 
		params.put("type", "SMS");
		params.put("text", "[Farms] - 인증번호는 : " + num + "입니다.");  


		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
         
         
      }else {
         response.setCharacterEncoding("utf-8");
         response.getWriter().println("올바른 인증번호를 입력해주세요");
      }
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}