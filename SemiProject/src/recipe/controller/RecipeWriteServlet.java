package recipe.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.View;

import org.apache.tomcat.util.buf.Utf8Encoder;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import community.model.service.CommunityService;
import member.model.vo.Member;
import postImage.model.service.PostImageService;
import postImage.model.vo.PostImage;
import recipe.model.service.RecipeService;
import recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeWriteServlet
 */
@WebServlet("/recipeWrite")
public class RecipeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecipeWriteServlet() {
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
		HttpSession session = request.getSession();
		String userId;
		int result = 0;
		if (session.getAttribute("member") == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 게시글 작성이 가능합니다.'); location.href='/views/extra/loginPage.jsp';</script>");
			out.flush();
		} else {
			userId = ((Member) session.getAttribute("member")).getmId();

			// 파일 데이터 업로드
			int uploadFileSizeLimit = 5 * 1024 * 1024;
			String userName = userId;
			String encType = "UTF-8";
			String root = request.getSession().getServletContext().getRealPath("/");
			String uploadFilePath = root + "img"; // 실제 업로드 경로
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType,
					new DefaultFileRenamePolicy());
			String recipeTitle = multi.getParameter("recipeTitle");
			String content = multi.getParameter("content");
			String[] step = new String[9];
			String postKind = "레시피";

			System.out.println(userId);
			System.out.println(recipeTitle);
			System.out.println(content);
			step[0] = multi.getParameter("step0");
			step[1] = multi.getParameter("step1");
			step[2] = multi.getParameter("step2");
			step[3] = multi.getParameter("step3");
			step[4] = multi.getParameter("step4");
			step[5] = multi.getParameter("step5");
			step[6] = multi.getParameter("step6");
			step[7] = multi.getParameter("step7");
			step[8] = multi.getParameter("step8");
			int index = 0;
			ArrayList<Recipe> rList = new ArrayList<>();
			Recipe recipe = null;
			while (step[index] != null && index < 9) {
				recipe = new Recipe();
				recipe.setCookContents(step[index]);
				recipe.setCookSeq(index);
				rList.add(recipe);
				index++;
			}
			System.out.println(rList.get(0).getCookContents());
			String fileName = multi.getFilesystemName("imageUpload");
			File file = new File(uploadFilePath + "/" + fileName);

			String filepath = file.getPath();
			long fileSize = file.length();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
			Timestamp upTime = Timestamp.valueOf(formatter.format(Calendar.getInstance().getTimeInMillis()));
			PostImage img = new PostImage();
			img.setCookImgName(fileName);
			img.setCookImgPath(filepath);
			img.setCookImgSize(fileSize);
			img.setCookImgUser(userId);
			img.setCookUpload(upTime);

			String encodePostKinds = URLEncoder.encode("레시피");
			// 게시글 업로드----------------------
			result = new CommunityService().insertCommunity(recipeTitle, content, postKind, userId);
			if (result > 0) {
				// 레시피 업로드----------------------
				result = new RecipeService().insertRecipe(rList);
				if (result > 0) {
					// 이미지 업로드--------------------
					result = new PostImageService().uploadPostImage(img);
					if (result > 0) {
						response.sendRedirect("/communityMain?postKinds=" + encodePostKinds);
					} else {
						System.out.println("레시피이미지 업로드 실패");
					}
				} else {
					System.out.println("레시피스텝 업로드 실패");
					return;
				}

			} else {
				System.out.println("레시피게시글 업로드 실패");
				return;
			}

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
