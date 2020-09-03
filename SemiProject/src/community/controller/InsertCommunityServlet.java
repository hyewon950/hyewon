package community.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import community.model.service.CommunityService;
import member.model.vo.Member;
import postImage.model.service.PostImageService;
import postImage.model.vo.PostImage;

/**
 * Servlet implementation class InsertCommunityServlet
 */
@WebServlet("/insertCommunity")
public class InsertCommunityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertCommunityServlet() {
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
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "UTF-8";
		String root = request.getSession().getServletContext().getRealPath("/");
		String uploadFilePath = root + "img"; // 실제 업로드 경로
		MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType,
				new DefaultFileRenamePolicy());
		String subject = multi.getParameter("subject");
		String contentArea = multi.getParameter("editordata");
		String postKinds = multi.getParameter("communityKind");
		String fileName = multi.getFilesystemName("imageUpload");
		String fileName2 = multi.getFilesystemName("imageUpload2");
		String fileName3 = multi.getFilesystemName("imageUpload3");
		File file = new File(uploadFilePath + "/" + fileName);
		File file2 = new File(uploadFilePath + "/" + fileName2);
		File file3 = new File(uploadFilePath + "/" + fileName3);
		int result = 0;
		String mId;

		HttpSession session = request.getSession();
		
		if (session.getAttribute("member") == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 게시글 작성이 가능합니다.'); location.href='/views/extra/loginPage.jsp';</script>");
			out.flush();
		} else {
			mId = ((Member) session.getAttribute("member")).getmId();

			String filepath = file.getPath();
			long fileSize = file.length();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
			Timestamp upTime = Timestamp.valueOf(formatter.format(Calendar.getInstance().getTimeInMillis()));
			Timestamp upTime2 = Timestamp.valueOf(formatter.format(Calendar.getInstance().getTimeInMillis()+1));
			Timestamp upTime3 = Timestamp.valueOf(formatter.format(Calendar.getInstance().getTimeInMillis()+2));
			PostImage img = new PostImage();
			PostImage img2 = new PostImage();
			PostImage img3 = new PostImage();
			img.setCookImgName(fileName);
			img.setCookImgPath(filepath);
			img.setCookImgSize(fileSize);
			img.setCookImgUser(mId);
			img.setCookUpload(upTime);
			
			img2.setCookImgName(fileName2);
			img2.setCookImgPath(file2.getPath());
			img2.setCookImgSize(file2.length());
			img2.setCookImgUser(mId);
			img2.setCookUpload(upTime2);
			
			img3.setCookImgName(fileName3);
			img3.setCookImgPath(file3.getPath());
			img3.setCookImgSize(file3.length());
			img3.setCookImgUser(mId);
			img3.setCookUpload(upTime3);
			String encodePostKinds = URLEncoder.encode(multi.getParameter("communityKind"));

			if (session != null && (session.getAttribute("member") != null)) {
				result = new CommunityService().insertCommunity(subject, contentArea, postKinds, mId);
				if (result > 0) {
					result = new PostImageService().uploadPostImage(img);
					result = new PostImageService().uploadPostImage(img2);
					result = new PostImageService().uploadPostImage(img3);
				}
				if (result > 0) {
					response.sendRedirect("/communityMain?postKinds=" + encodePostKinds);
				}
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
