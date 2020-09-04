package file.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import file.model.service.FileService;
import file.model.vo.FileData;
import member.model.vo.Member;

/**
 * Servlet implementation class UpFileServlet
 */
@WebServlet("/upload")
public class UpFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	      String upUserId = ((Member)session.getAttribute("member")).getUserId();
	      //최대 업로드 파일크기 5MB
	      int uploadFileSizeLimit = 5*1024*1024;
	      String encType = "UTF-8";
	      //실제 업로드 경로
	      String uploadFilePath = "D:\\home\\" + upUserId; 
	      
	      //MultipartRequst 외부 라이브러리(cos.jar)
	      MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit,encType);
	      
	      //DB에 저장할 내용 셋팅
	      String fileName = multi.getFilesystemName("upfile");   //파일에 올라가는 이름
	      File file = new File(uploadFilePath+"/"+fileName);   //파일경로에 대한 정보
	      String filepath = file.getPath();
	      long fileSize = file.length();
	      String userName = upUserId;
	      //내가 원하는 데이터형태(날짜,시간등)로 변경하는 것 
	      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
	      //Timestamp-sql로 import
	      Timestamp upTime = Timestamp.valueOf(formatter.format(Calendar.getInstance().getTimeInMillis()));
	      
	      FileData data = new FileData();
	      data.setFileName(fileName);
	      data.setFilePath(filepath);
	      data.setFileSize(fileSize);
	      data.setFileUser(userName);
	      data.setUploadTime(upTime);
	      
	      int result = new FileService().uploadFile(data);
	      
	      if( fileName == null && result > 0) {
	         System.out.println("업로드 실패");
	      }else {
	         RequestDispatcher view = request.getRequestDispatcher("/views/file/uploadSuccess.jsp");
	         request.setAttribute("fileData", data);
	         view.forward(request, response);
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
