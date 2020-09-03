package com.kh.spring.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.notice.domain.Notice;
import com.kh.spring.notice.domain.Search;
import com.kh.spring.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;

	@RequestMapping("nlist.kh")
	public ModelAndView noticeList(ModelAndView mv) {
		ArrayList<Notice> list = nService.selectList();
		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.setViewName("notice/noticeListView");
		}else {
			mv.addObject("msg", "공지사항 목록조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	@RequestMapping("nsearch.kh")
	public String noticeSearch(Search search,Model model) {
	
		ArrayList<Notice> searchList = nService.searchList(search);
		
		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		return "notice/noticeListView";

		
	}
	@RequestMapping("ndetail.kh")
	public String noticeDetail(int nId, Model model) {
		Notice notice = nService.selectOne(nId);
	
		if ( notice != null ) {
			model.addAttribute("notice", notice);
			return "notice/noticeDetailView";
		}else {
			model.addAttribute("msg", "공지사항 상세조회 실패");
			return "common/errorPage";
		}
	}
	// 공지사항 등록화면
	@RequestMapping("nWriterView.kh")
	public String nWriterView() {
		return "notice/noticeWriteForm";
	}

	//공지사항 등록
	@RequestMapping("ninsert.kh")
	public String noticeInsert(Notice notice,Model model,@RequestParam(name="uploadFile", required=false) MultipartFile uploadFile,HttpServletRequest request) {
		//RequestParam에 required 속성은 해당 파라미터가 반드시 필수인지여부, 기본값은 true
		//required=true,null 이면 입력시 400에러 발생
		
		//Multipart지원기능 -> 스프일 설정파일에 MultipartResolver등록
		//MultipartResolver는 Multipart 형식으로 된 데이터가 전송된 경우
		//해당 데이터를 스프링MVC에서 사용할 수 있도록 변환해주는 기능을 함
		
	//  파일을 서버에 저장하는 작업
		if(!uploadFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFile, request);
			if(filePath != null) {
				notice.setFilePath(uploadFile.getOriginalFilename());
			}
		}

		// 데이터를 디비에 저장하는 작업
		int result = 0;
		String path = null;
		result = nService.insertNotice(notice, uploadFile, request);
		if ( result > 0 ) {
			path = "redirect:nlist.kh";
		}else {
			model.addAttribute("msg", "공지사항 등록 실패");
			path = "common/errorPage";
		}
		return path;

	
	}
	//파일 저장 메소드
	public String saveFile(MultipartFile file,HttpServletRequest request) {
		
		// 파일 저장 경로 설정
		String root
			= request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\nuploadFiles";

		// 저장 폴더 선택
		File folder = new File(savePath);

		// 만약 폴더가 없을 경우 자동 생성
		if(!folder.exists()) {
			folder.mkdir();
		}

		
		String filePath =folder +"\\"+file.getOriginalFilename();
		
		try {
			//파일 저장
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return filePath;
		
	}

	//공지사항 수정 화면
	@RequestMapping("nupView.kh") 
	public String noticeUpdateView(int nId,Model model) {
		model.addAttribute("notice",nService.selectOne(nId));
		return "notice/noticeUpdateView";
		
		
	}
	//공지사항 수정
	@RequestMapping(value="nupdate.kh", method=RequestMethod.POST)
	public String noticeUpdate(Notice notice,Model model,HttpServletRequest request,MultipartFile reloadFile) {
		
		// 새로 업로드된 파일이 있을 경우
		if (reloadFile != null && !reloadFile.isEmpty()) {
			// 기존 업로드된 파일이 있을 경우
			if ( notice.getFilePath() != null ) {
				// 기존 파일 삭제
				deleteFile(notice.getFilePath(),request);
			}
			// 새로 업로드된 파일 저장
			String savePath = saveFile(reloadFile, request);
			
			// 새로 업로드된 파일이 잘 저장이 되었다면 디비 저장
			if( savePath != null ) {
				notice.setFilePath(reloadFile.getOriginalFilename());
			}
		}

		int result=nService.updateNotice(notice);
		if(result>0) {
			return"redirect:ndetail.kh?nId="+notice.getnId();
		}else {
			model.addAttribute("msg","공지사항 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	// 파일 삭제 메소드
	// 공지글 등록 실패 또는 글 수저응로 업로드 파일이 변한 경우
	// 저장되어 있는 기존 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		
		// 파일 저장 경로 설정
		String root
			= request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\nuploadFiles";
		
		// 삭제할 파일 경로 + 파일명
		File deleteFile = new File(savePath + "\\" + fileName);
		
		// 해당 파일이 존재할 경우 삭제
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}

	
	//공지사항 삭제
	//1.db데이터 삭제
	//2.db데이터 삭제 성공시 저장된 파일 삭제
	//3.삭제 후 공지사항 목록으로 redirect
	@RequestMapping("ndelete.kh")
	public String noticeDelete(int nId,Model model,HttpServletRequest request,RedirectAttributes rd) {
		
		//파일 지우기 위해 nId공지사항 조회
		Notice notice= nService.selectOne(nId);
		int result=nService.deleteNotice(nId);
		if(result>0) {
			if(notice.getFilePath() !=null) {
				deleteFile(notice.getFilePath(),request);
			}
			rd.addFlashAttribute("msg", "공지사항 삭제 성공");
			return "redirect:nlist.kh";
			
			
		}else {
			model.addAttribute("msg","공지사항 삭제 실패");
			return "common/errorPage";
		}
		
		
	}
	
	
	
	
	
}
