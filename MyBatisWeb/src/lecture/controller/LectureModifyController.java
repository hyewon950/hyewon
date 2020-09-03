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
 * Servlet implementation class LectureModifyController
 */
@WebServlet("/lecturemodify.do")
public class LectureModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private LectureService service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureModifyController() {
        service= new LectureServiceImpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int lecId = Integer.parseInt(request.getParameter("id"));
		Lecture lect = service.find(lecId);
		request.setAttribute("lecture", lect);
		request.getRequestDispatcher("WEB-INF/views/lecture/modify.jsp")
		.forward(request, response);

	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Lecture lect = new Lecture();
		int lectureId = Integer.parseInt(request.getParameter("lecId"));
		String lectureName = request.getParameter("lectureName");
		String instructorName = request.getParameter("instructorName");
		String lectureIntroduce = request.getParameter("lectureIntroduce");
		lect.setId(lectureId);
		lect.setLectureName(lectureName);
		lect.setInstructor(instructorName);
		lect.setIntroduce(lectureIntroduce);
		service.modify(lect);
		response.sendRedirect("lectureList.do");

	}

}
