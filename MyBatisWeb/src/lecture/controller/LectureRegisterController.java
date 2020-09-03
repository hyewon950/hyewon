package lecture.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lecture.domain.Lecture;
import lecture.service.LectureService;
import lecture.service.LectureServiceImpl;

/**
 * Servlet implementation class LectureRegisterController
 */
@WebServlet("/lectureRegister.do")
public class LectureRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureRegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.getRequestDispatcher("WEB-INF/views/lecture/registerForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LectureService service = new LectureServiceImpl();
		String lectureName = request.getParameter("lectureName");
		String instructorName = request.getParameter("instructorName");
		String lectureIntroduce = request.getParameter("lectureIntroduce");
		Lecture lecture = new Lecture(lectureName, instructorName, lectureIntroduce);
		service.register(lecture);
		response.sendRedirect("lectureList.do");

	}

}
