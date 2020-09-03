package org.kh.camp.used.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.kh.camp.member.domain.Member;
import org.kh.camp.used.common.pagination;
import org.kh.camp.used.domain.PageInfo;
import org.kh.camp.used.domain.Search;
import org.kh.camp.used.domain.UsedBoard;
import org.kh.camp.used.domain.UsedReply;
import org.kh.camp.used.service.UsedBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;


@Controller
public class UsedBoardController {

	@Autowired
	private UsedBoardService uBoardService;
	
	private String refileName=null;
	// 목록 usedList.jsp
	@RequestMapping("ulist.do")
	public ModelAndView usedBoardList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

		int usedCurrentPage = (page != null) ? page : 1;
		
		int usedListCount = uBoardService.getUsedListCount();
		PageInfo pi = pagination.getPageInfo(usedCurrentPage, usedListCount);
		ArrayList<UsedBoard> uList = uBoardService.selectUsedList(pi);

		if (!uList.isEmpty()) {
			mv.addObject("uList", uList);
			mv.addObject("pi", pi);
			mv.setViewName("used/usedList");
			
		} else {
			
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}

	

	// 상세화면 - usedDetail.jsp
	@RequestMapping("udetail.do")
	public ModelAndView usedBoardDetail(ModelAndView mv, int usedNo) {
		/*
		 * int currentPage = 1; if (page != null) { currentPage = page; }
		 */
		uBoardService.addReadCount(usedNo); // 조회수 증가
		UsedBoard uBoard = uBoardService.selectUsedBoard(usedNo);// 게시글 상세조회 userNo 수정
		if (uBoard != null) {
			mv.addObject("usedBoard", uBoard).setViewName("used/usedDetail");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패!").setViewName("common/errorPage");
		}
		return mv;
	}

	
	 // 수정
	   @RequestMapping(value = "uModify.do")
	   public ModelAndView uModify(ModelAndView mv, int usedNo, @ModelAttribute UsedBoard u, HttpServletRequest request) {
	      if ("POST".equals(request.getMethod())) {
	    	  
	    	  
	    	  u.setmId("user1");
		      u.setUsedRenameFilename(refileName);
		      
		      
	         uBoardService.updateUsedBoard(u);
	         return new ModelAndView("redirect:ulist.do");
	      }
	      uBoardService.addReadCount(usedNo); // 조회수 증가
	      UsedBoard usedBoard = uBoardService.selectUsedBoard(u.getUsedNo());
	      mv.addObject("usedBoard", usedBoard);
	      mv.setViewName("used/usedModify");
	      return mv;
	   }

	   // 글쓰기
	   @RequestMapping(value = "uWrite.do")
	   public ModelAndView uWrite(ModelAndView mv, @ModelAttribute UsedBoard u, HttpServletRequest request) {
	      if ("POST".equals(request.getMethod())) {

	         // todo 세션있는 값으 변경 해주세요
	         u.setmId("user1");
	         u.setUsedRenameFilename(refileName);
	         uBoardService.insertUsedBoard(u);
	         
	         return new ModelAndView("redirect:ulist.do");
	      }
	      mv.setViewName("used/usedWrite");
	      return mv;
	   }


	
	// 중고 게시글 삭제
	// 1. DB데이터 삭제
	// 2. DB데이터 삭제 성공시 저장된 파일 삭제
	// 3. 삭제 후 공지사항 목록으로 redirect
	@RequestMapping("udelete.do")
	public String deleteUsedDelete(int usedNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
		// 파일을 지우기 위해 nId 공지사항 조회
		UsedBoard uBoard = uBoardService.selectUsedBoard(usedNo);
		int result = uBoardService.deleteUsedBoard(usedNo);
		if (result > 0) {
			/*
			 * if(uBoard.getFilePath() !=null) { deleteFile(uBoard.getFilePath(), request);
			 * }
			 */
			rd.addFlashAttribute("msg", "게시글 삭제 성공");
			return "redirect:ulist.do";
		} else {
			model.addAttribute("msg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}

	@RequestMapping("usearch.do")
	public String usedSearch(Search search, Model model) {
		System.out.println(search);
		System.out.println("search controller : " + search.toString());
		ArrayList<UsedBoard> searchList = uBoardService.searchList(search);

		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		
		System.out.println("search controller down : " + search.toString());
		return "used/searchList";
	}

	/*
	 * @RequestMapping("rList.do") public void getReplyList(HttpServletResponse
	 * response, int usedNo) throws JsonIOException, IOException {
	 * ArrayList<UsedReply> urList = uBoardService.selectUsedReplyList(usedNo);
	 * 
	 * for (UsedReply ur : urList) {
	 * ur.setUsedRContent(URLEncoder.encode(ur.getUsedRContent(), "utf-8")); } Gson
	 * gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	 * gson.toJson(urList, response.getWriter()); // 기존에 JSONOBject, JSONArray를 이용해서
	 * JSON형태로 만들어줬음 // 여기선 Gson 라이브러리를 사용하고자 함. // reply 객체를 JSON형태로 변환해줘서 data로
	 * 보내줘야함. // { 'bId' : 1, 'bName' : '제목' } }
	 * 
	 * @RequestMapping("addReply.do")
	 * 
	 * @ResponseBody //ViewResolver를 거치지 않고 body에 String 값으로 전송하는 어노테이션 public
	 * String addReply(UsedReply ur, HttpSession session) { Member loginUser =
	 * (Member)session.getAttribute("loginUser"); String usedRWriter =
	 * loginUser.getmId(); ur.setUsedRWriter(usedRWriter); int result =
	 * uBoardService.insertUsedReply(ur); if(result > 0) { return "success"; }else {
	 * return "fail"; } }
	 */

	
	
    //나만의 캠핑 댓글=================================================
    
  //나만의 캠핑 댓글 내용 조회
 /*   @RequestMapping("ReplyList.do")
	public void selectUsedReply(HttpServletResponse response, int usedNo) throws JsonIOException, IOException{
		
		ArrayList<UsedReply> replyList = uBoardService.selectUsedReply(usedNo);
		
		for (UsedReply usedReply : replyList) {
			usedReply.setUsedReply(URLEncoder.encode(replyList.getUsedReply(), "utf-8"));
		}
		//기존 JSONObject, JSONArray를 이용해서 JSON형태로 만들어줬음
		//여기선 Gson라이브러리를 사용하여 간단하게 만들고자함(pom.xml에 넣어줘야함)
		//reply 객체를 JSON형태로 변환해줘서 data로 보내줘야함 
		//{'bId' :1, 'bName':'제목'}이 형태가 json형태
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(replyList, response.getWriter());
	}
    
	//나만의 캠핑 댓글 쓰기
    @RequestMapping("insertReply.do")
    @ResponseBody
	public String insertUsedReply(UsedReply usedReply, HttpSession session) {
       Member loginUser =(Member)session.getAttribute("loginUser");
       String mId = loginUser.getmId();
       usedReply.setmId(mId);
       int result = uBoardService.insertCommentNo(CommentNo);
       System.out.println(CommentNo+"하핳");
       if(result >0) {
       	return "success";
       }else {
       	return "fail";
       }
	}
	
	//나만의 캠핑 댓글 수정
   @RequestMapping("updateReply.do")
   @ResponseBody
	public String updateUsedReply(UsedReply usedReply,HttpSession session) {
   	Member loginUser =(Member)session.getAttribute("loginUser");
       String mId = loginUser.getmId();
       usedReply.setmId(mId);
   	int result = uBoardService.updateUsedReply(usedReply);
   	System.out.println("호호");
       if(result >0) {
       	return "success";
       }else {
       	return "fail";
       }
	}

	//나만의 캠핑 댓글 삭제
	@RequestMapping("deleteUsedReply.do")
    @ResponseBody
	public String deleteUsedReply(int usedRId) {
		 int result = uBoardService.deleteUsedReply(CommentNo);
	        if(result >0) {
	        	return "success";
	        }else {
	        	return "fail";
	    }
	}
	*/
	// 댓글 여기까지 =============================================================
	
	
	
	// 댓글 목록
		@RequestMapping(value = "replyList.do")
	    public ResponseEntity<Map> replyList(int usedNo) {
	        ArrayList<UsedReply> usedReplies = uBoardService.selectUsedReplyList(usedNo);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("list", usedReplies);
			params.put("usedNo",usedNo);
			
			System.out.println("컨트롤러 usedReplies :" + usedReplies);
			
			System.out.println(params.toString());
			return new ResponseEntity<>(params, HttpStatus.OK);
	    }
		
/*		@RequestMapping(value = "replyList.do")
	    public ModelAndView replyList(ModelAndView mv, int usedNo, UsedReply vo) {
			System.out.println(vo.toString());
			System.out.println("usedNo : "+ usedNo);

	        ArrayList<UsedReply> usedReplies = uBoardService.selectUsedReplyList(usedNo);
			
	        if(!usedReplies.isEmpty()) {
	        	mv.addObject("vo", vo);
	        	mv.setViewName("used/usedModify");
	        	
	        }
			return mv;
	    }*/

	    // 댓글 등록
		@RequestMapping(value = "insertUsedReply.do", method = RequestMethod.POST)
		public @ResponseBody HashMap insertUsedReply(UsedReply usedReply, HttpSession session) {
			String mId = ((Member)session.getAttribute("loginUser")).getmId();
			
			//Date usedCreateDate =UsedBoard.getUsedCreateDate();
			//usedBoard.setUsedCreateDate(usedCreateDate);
			
			usedReply.setUsedRId(mId);
			
			uBoardService.insertUsedReply(usedReply);
			HashMap rmap = new HashMap();
			rmap.put("MESSAGE","OK");
			return rmap;
		}

		// 댓글 삭제
		@RequestMapping(value = "deleteUsedReply.do", method = RequestMethod.POST)
		public @ResponseBody HashMap deleteUsedReply(UsedReply usedReply) {
			uBoardService.deleteUsedReply(usedReply);
			HashMap rmap = new HashMap();
			rmap.put("MESSAGE","OK");
			return rmap;
		}

	

	
	// 자유게시판 사진 저장 서비스
	@RequestMapping(value = "fileupload.do")
         @ResponseBody
         public String fileUpload(HttpServletRequest request, HttpServletResponse response,
               MultipartHttpServletRequest multiFile) throws Exception {
            JsonObject json = new JsonObject();
            PrintWriter printWriter = null;
            OutputStream out = null;
            MultipartFile file = multiFile.getFile("upload");
            
            if (file != null) {
               if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
                  if (file.getContentType().toLowerCase().startsWith("image/")) {
                     try {
                        String fileName = file.getName();
                        byte[] bytes = file.getBytes();
                        String uploadPath = request.getSession().getServletContext()
                              .getRealPath("/resources/imgs/noticeimg");
                        

                        
                        System.out.println("컨트롤러 확인 1111uploadPath :" + uploadPath);
   
                        
                        
                        File uploadFile = new File(uploadPath);
                        if (!uploadFile.exists()) {
                           uploadFile.mkdirs();
                        }
                        fileName = UUID.randomUUID().toString();
                        uploadPath = uploadPath + "/" + fileName;
                        
                        
                        System.out.println("컨트롤러 확인2222 fileName : " + fileName);
                        
                        //파일 네임 저장
                        refileName=fileName;
                        
                        
                        out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);

                        printWriter = response.getWriter();
                        response.setContentType("text/html");
                        String fileUrl = request.getContextPath() + "/resources/imgs/noticeimg/" + fileName;
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        System.out.println(json);                  
                        System.out.println(fileUrl);
                        
                        printWriter.print(json);
                        /*//printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('"
                              //+ fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");
                        printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                              + callback + ",'" + fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");*/
                     } catch (IOException e) {
                        e.printStackTrace();
                     } finally {
                        if (out != null) {
                           out.close();
                        }
                        if (printWriter != null) {
                           printWriter.close();
                        }
                     }
               
                  }
               }
                 
            }
            return null;
	}                           
}
