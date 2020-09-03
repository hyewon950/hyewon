package org.kh.camp.mycamp.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.camp.member.domain.Member;
import org.kh.camp.mycamp.domain.MyCamp;
import org.kh.camp.mycamp.domain.MyCampComment;
import org.kh.camp.mycamp.domain.MyCampFile;
import org.kh.camp.mycamp.domain.MyCampLike;
import org.kh.camp.mycamp.domain.MyCampPageInfo;
import org.kh.camp.mycamp.domain.MyCampPagination;
import org.kh.camp.mycamp.domain.MyCampSearch;
import org.kh.camp.mycamp.service.MyCampService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;


@Controller
public class MyCampController {

	@Autowired
	private MyCampService mycService;
	   
	// 나만의 캠핑 게시판 전체 조회 
	   @RequestMapping("myclist.do")
	   public ModelAndView selectMyCamp(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) { 
	      
		   int mycCurrentPage =(page !=null) ? page : 1;
		   int mycListCount = mycService.getMyCampListCount();
		   MyCampPageInfo mycpi = MyCampPagination.getPageInfo(mycCurrentPage, mycListCount);
		   
		  ArrayList<MyCampFile> fileList = mycService.selectAllMyCampFile();
		  
		  System.out.println("파일 뽑은거 : "+fileList.toString());
		  
	      ArrayList<MyCamp> list = mycService.selectMyCamp(mycpi);
	      
	      if ( !list.isEmpty() ) {
	         mv.addObject("list", list);
	         mv.addObject("mycpi", mycpi);
	         mv.addObject("fileList", fileList);
	         mv.setViewName("myCamp/myCampMain");
	      }else {
	         mv.addObject("msg", "공지사항 목록조회 실패");
	         mv.setViewName("common/errorPage");
	      }
	      return mv;

	   }
	 
	 //나만의 캠핑 지도 검색
	   @RequestMapping("mycSearchMap.do")
	   public String searchMyCampMapList(MyCampSearch mycSearch, Model model, @RequestParam(value="page", required=false)Integer page, String clocal) {
		   
		   ArrayList<MyCampFile> fileList = mycService.selectAllMyCampFile();
		  // int mycCurrentPage =(page !=null) ? page : 1;
		   System.out.println("clocal : "+ clocal);

		   mycSearch.setMycSearchValue(clocal);
		   
			   int mycCurrentPage =(page !=null) ? page : 1;
			   int mycListCount = mycService.getMyCampSearchMapListCount(mycSearch);
			   MyCampPageInfo mycsearchpi = MyCampPagination.getPageInfo(mycCurrentPage, mycListCount);
			   
			   ArrayList<MyCamp> searchMyCampList = mycService.searchMyCampMapList(mycsearchpi, mycSearch);
			   model.addAttribute("list", searchMyCampList);
			      model.addAttribute("mycSearch", mycSearch);
			      model.addAttribute("mycsearchpi", mycsearchpi);
			      model.addAttribute("fileList", fileList);
			      //검색창에 기록을 남아있게한다]
			      System.out.println("searchMyCampList : "+ searchMyCampList.toString());
			      //return "myCamp/myCampSearch"; 
			  
	      
	   	      return "myCamp/myCampSearch"; 
	   }
	   
	   
	   
	 //나만의 캠핑 글 검색
	   @RequestMapping("mycSearch.do")
	   public String searchMyCampList(MyCampSearch mycSearch, Model model, @RequestParam(value="page", required=false)Integer page, String mycSearchCondition, String mycSearchValue) {
		   
		   ArrayList<MyCampFile> fileList = mycService.selectAllMyCampFile();
		  // int mycCurrentPage =(page !=null) ? page : 1;
		   System.out.println("mycSearchValue : "+ mycSearchValue);
		   System.out.println("mycSearchCondition : "+ mycSearchCondition);
		   System.out.println(mycSearchCondition.equals("mycTitle"));

		   if(mycSearchCondition.equals("mycTitle")) {
			   System.out.println("들어왔지롱 ");
			   int mycCurrentPage =(page !=null) ? page : 1;
			   int mycListCount = mycService.getMyCampSearchListCount(mycSearch);
			   MyCampPageInfo mycsearchpi = MyCampPagination.getPageInfo(mycCurrentPage, mycListCount);
			   ArrayList<MyCamp> searchMyCampList = mycService.searchMyCampList(mycsearchpi, mycSearch);
			   model.addAttribute("list", searchMyCampList);
			      model.addAttribute("mycSearch", mycSearch);
			      model.addAttribute("mycsearchpi", mycsearchpi);
			      model.addAttribute("fileList", fileList);
			      //검색창에 기록을 남아있게한다]
			      System.out.println("searchMyCampList : "+ searchMyCampList.toString());
			      //return "myCamp/myCampSearch"; 
			   
		   }else if(mycSearchCondition.equals("mycDetail")) {
			   System.out.println("세부검색 드루옴");
			   
			   int mycCurrentPage =(page !=null) ? page : 1;
			   int mycListCount = mycService.getMyCampSearchDListCount(mycSearch);
			   MyCampPageInfo mycsearchpi = MyCampPagination.getPageInfo(mycCurrentPage, mycListCount);
			   ArrayList<MyCamp> searchMyCampList = mycService.searchMyCampList(mycsearchpi, mycSearch);
			 
			   model.addAttribute("list", searchMyCampList);
			      model.addAttribute("mycSearch", mycSearch);
			      model.addAttribute("mycsearchpi", mycsearchpi);
			      model.addAttribute("fileList", fileList);
			      //검색창에 기록을 남아있게한다]
			      System.out.println("searchMyCampList : "+ searchMyCampList.toString());
			   
			      
		   }else if(mycSearchCondition.equals("mycAll")) {
			   System.out.println("전체검색 드루옴");
			   
			   int mycCurrentPage =(page !=null) ? page : 1;
			   int mycListCount = mycService.getMyCampSearchListCount(mycSearch);
			   MyCampPageInfo mycsearchpi = MyCampPagination.getPageInfo(mycCurrentPage, mycListCount);
			   ArrayList<MyCamp> searchMyCampList = mycService.searchMyCampList(mycsearchpi, mycSearch);
			 
			   model.addAttribute("list", searchMyCampList);
			      model.addAttribute("mycSearch", mycSearch);
			      model.addAttribute("mycsearchpi", mycsearchpi);
			      model.addAttribute("fileList", fileList);
			      //검색창에 기록을 남아있게한다
			      System.out.println("searchMyCampList : "+ searchMyCampList.toString());
		   }
	      
	   	      return "myCamp/myCampSearch"; 
	   }
	   
	   
	 //나만의 캠핑 태그 검색
	   @RequestMapping("mycTagSearch.do")
	   public String searchMyCampTagList(MyCampSearch mycSearch,  Model model, String mycSearchValue, @RequestParam(value="page", required=false)Integer page) {
		   String tag = "";
	    
	      System.out.println(mycSearchValue);
	      
	      String arr[] = mycSearchValue.split(" ");
	      
	      for ( int i = 0; i < arr.length; i++) {
	    	 // tag += "MYC_TAG LIKE '%'+arr[i]+'%'";
	    	  System.out.println(arr[i]);
	    	  //tag +="AND MYC_TAG LIKE '%' || "+arr[i]+"||'%'";
	    	  tag +="AND MYC_TAG LIKE '%"+arr[i]+"%'";
	    	}
	      System.out.println("\n");
	      
	      String tags= tag.substring(4);
	      
	      System.out.println(tags);
	      
	      mycSearch.setMycSearchTag(tags);
	      
	      System.out.println("mycSearch.toString() : "+mycSearch.toString());
	      
	      ArrayList<MyCampFile> fileList = mycService.selectAllMyCampFile();
	      //페이징 데이타 처리
		      int mycCurrentPage =(page !=null) ? page : 1;
			  int mycListCount = mycService.getMyCampSearchTListCount(mycSearch);

			   MyCampPageInfo mycsearchpi = MyCampPagination.getPageInfo(mycCurrentPage, mycListCount);
			   ArrayList<MyCamp> searchMyCampList = mycService.searchMyCampTagList(mycsearchpi,mycSearch);
			 
			   model.addAttribute("list", searchMyCampList);
			      model.addAttribute("mycSearch", mycSearch);
			      model.addAttribute("mycsearchpi", mycsearchpi);
			      model.addAttribute("fileList", fileList);
		      
			  return "myCamp/myCampSearchTag"; 
	   }
	   
	   
	   /*//나만의 캠핑 태그 검색 //원래 이거
	   @RequestMapping("mycTagSearch.do")
	   public String searchMyCampTagList(MyCampSearch mycSearch,  Model model, String mycSearchValue, @RequestParam(value="page", required=false)Integer page) {
		   int mycCurrentPage =(page !=null) ? page : 1;
		   int mycListCount = mycService.getMyCampListCount();

		   String tag = "";
	    
	      System.out.println(mycSearchValue);
	      
	      String arr[] = mycSearchValue.split(" ");
	      
	      for ( int i = 0; i < arr.length; i++) {
	    	 // tag += "MYC_TAG LIKE '%'+arr[i]+'%'";
	    	  System.out.println(arr[i]);
	    	  //tag +="AND MYC_TAG LIKE '%' || "+arr[i]+"||'%'";
	    	  tag +="AND MYC_TAG LIKE '%"+arr[i]+"%'";
	    	}
	      System.out.println("\n");
	      
	      String tags= tag.substring(4);
	      
	      System.out.println(tags);
	      
	      mycSearch.setMycSearchValue(tags);
	      
	      System.out.println(mycSearch.toString());
	      
	      MyCampPageInfo mycpi = MyCampPagination.getPageInfo(mycCurrentPage, mycListCount);
	      ArrayList<MyCampFile> fileList = mycService.selectAllMyCampFile();
	      
		   ArrayList<MyCamp> searchMyCampList = mycService.searchMyCampTagList(mycSearch);
		    System.out.println(mycSearch.toString());
		    		  
		      model.addAttribute("list", searchMyCampList);
		      model.addAttribute("myctSearch", mycSearch);
		      model.addAttribute("mycpi", mycpi);
		      model.addAttribute("fileList", fileList);
		      //검색창에 기록을 남아있게한다
		      return "myCamp/myCampMain"; 
	   }*/
	   
	   
	   
	   // 나만의 캠핑 게시판 세부 내용조회
	   @RequestMapping("mycdetail.do")
	   public ModelAndView selectOneMyCamp(ModelAndView mv, int mycNo, String mId, @RequestParam("page") Integer page) {
		   int currentPage = page != null ? page: 1;
		   mycService.listViewCount(mycNo); //조회수 증가
		   MyCamp myCamp = mycService.selectOneMyCamp(mycNo);
		   
		   ArrayList<MyCampFile> myCampFile = mycService.selectMyCampFile(mycNo);
		   
		   //추가(좋아요)
		   MyCampLike myCampLike = new MyCampLike();	

	        myCampLike.setMycNo(mycNo);
	        myCampLike.setmId(mId);

	        int mycLikeCnt = mycService.getMyCampLike(myCampLike);
	        System.out.println(mycLikeCnt);

	        mv.addObject("heart",mycLikeCnt);
	        //여기까지 추가
		   
	      if( myCamp != null) {
	         mv.addObject("myCamp", myCamp)
	         	.addObject("myCampFile", myCampFile)
	         	.addObject("currentPage", currentPage)
				.setViewName("myCamp/myCampDetail");
	      }else {
	    	  mv.addObject("msg", "게시글 상세조회 실패!")
				.setViewName("common/errorPage");
	      }
	      return mv;
	   }
	   
	   //나만의 캠핑 게시글 쓰기로이동
	   @RequestMapping("mycInsertBoardView.do")
	   public String insertMyCampBoardView() {
	      return "myCamp/myCampInsertBoard";
	   }
	   
	   //나만의 캠핑 게시글 쓰기(사진없)
	     @RequestMapping(value="mycinsertboard.do", method=RequestMethod.POST)
	     public String insertMyCampBoard(MyCamp myCamp, Model model, @RequestParam(name = "fileImage", required = false) MultipartFile[] file, HttpServletRequest request, HttpSession session, RedirectAttributes ra, String addr1, String addr2) {
	   	 
	    	 myCamp.setMycPlace(addr1+" "+addr2);
	    	 
	    	 //노파일
	    	 int result = 0;
	    	 
	    	 result = mycService.insertMyCampBoard(myCamp, request);
	    	 
	    	 //파일 쓸때 
	    	// 파일이 있는지 검사
	 		if (file != null) {
	 			for (int i = 0; i < file.length; i++) {
	 				if (!file[i].getOriginalFilename().equals("")) {
	 					System.out.println("왓습니다");
	 					MyCampFile mycImage = saveFile(i, file[i], request);
	 					mycService.insertMyCampFile(mycImage, request);
	 				}
	 			}
	 		}
	    	 
	    	/* //노파일
	    	 int result = 0;
	    	 
	    	 result = mycService.insertMyCampBoard(myCamp, request);*/
	    	 
	    	 
	    	 if (result > 0) {
	    		  model.addAttribute("myCamp", myCamp);
	    		  return "redirect:myclist.do";
		        } else {
		        	  model.addAttribute("msg", "나만의 캠프 게시글 등록 실패");
		        	  return"common/errorPage";
		        }
	        
	     }
	     
	     
	     
	     //다중파일 컨트롤러
	     
	     
	    public MyCampFile saveFile(int i, MultipartFile file, HttpServletRequest request) {

	 		// 파일 저장 경로 설정
	 		String root = request.getSession().getServletContext().getRealPath("resources");
	 		String savePath = root + "\\myCampFiles";
	 		//webapp안 resources폴더밑에 myCampFiles폴더에 저장된다
	 		
	 		// 저장 폴더 선택
	 		File folder = new File(savePath);

	 		// 만약 폴더가 없을 경우 자동 생성
	 		if (!folder.exists()) {
	 			folder.mkdir();
	 		}
	 		SimpleDateFormat format = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss_");

	 		Date time = new Date();
	 		String index = i + "_";
	 		String upTime = format.format(time);
	 		// 파일명 중복을 방지하기위해 '파일을 넣는 순서_파일을 업로드한 시간_파일이름' 으로 파일을 저장
	 		String fileName = index + upTime + file.getOriginalFilename();
	 		String filePath = folder + "\\" + fileName;

	 		try {
	 			file.transferTo(new File(filePath));
	 		} catch (IllegalStateException e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 		} catch (IOException e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 		}
	 		MyCampFile mycImage = new MyCampFile();
	 		mycImage.setMycFilePath(filePath);
	 		mycImage.setMycFileName(fileName);

	 		return mycImage;
	 	}

	     //파일 삭제
	 	public void deleteFile(String fileName, HttpServletRequest request) {
	 		// 파일 저장 경로 설정
	 		String root = request.getSession().getServletContext().getRealPath("resources");
	 		String savePath = root + "\\myCampFiles";
	 		// 삭제할 파일 경로 + 파일명
	 		File deleteFile = new File(savePath + "\\" + fileName);
	 		// 해당 파일이 존재할 경우 삭제
	 		if (deleteFile.exists()) {
	 			deleteFile.delete();
	 		}
	 	}
	 	
	/*//파일 수정
	 	@RequestMapping("/ModifyTimeLine")
	 	public String studyBoardModify(Model mo, Post post,
	 			@RequestParam(name = "fileImage", required = false) MultipartFile[] file, HttpServletRequest request,
	 			String upload_name1, String upload_name2, String upload_name3, HttpSession session, RedirectAttributes ra) {
	 		ArrayList<PostImage> postImages = studyService.selectTimeLineImage(post.getPostNo());
	 		int size = postImages.size();
	 		if (postImages != null) {
	 			for (int i = 0; i < size; i++) {
	 				if (!postImages.get(i).getImgName().equals(upload_name1)
	 						&& !postImages.get(i).getImgName().equals(upload_name2)
	 						&& !postImages.get(i).getImgName().equals(upload_name3)) {
	 					// 파일삭제
	 					deleteFile(postImages.get(i).getImgName(), request);
	 					studyService.deleteTimeLineImg(postImages.get(i).getImgNo());
	 				}
	 			}
	 		}
	 		// 파일이 있는지 검사
	 		if (file != null) {
	 			for (int i = 0; i < file.length; i++) {
	 				if (!file[i].getOriginalFilename().equals("")) {
	 					PostImage pImage = saveFile(i, file[i], request);
	 					studyService.insertTimeLineImg(pImage);
	 				}
	 			}
	 		}
	 		studyService.updateTimeLine(post);
	 		return "redirect:/boardList";
	 	}*/
	     


	 	
	   //나만의 캠핑 글 수정페이지로 이동
	    @RequestMapping("updatemycboardView.do")
	     public String updateMyCampBoardView(int mycNo, Model model) {
	        model.addAttribute("myCamp", mycService.selectOneMyCamp(mycNo));
	        model.addAttribute("myCampFile", mycService.selectMyCampFile(mycNo));
	        return "myCamp/myCampUpdateBoard";
	     }
	     
	     
	   //나만의 캠핑 글 수정
	    @RequestMapping(value="updatemycboard.do", method = RequestMethod.POST)
	     public String updateMyCampBoard(MyCamp myCamp, Model model, HttpServletRequest request,@RequestParam(name = "fileImage", required = false) MultipartFile[] file,
	 			String upload_name1, String upload_name2, String upload_name3, HttpSession session, RedirectAttributes ra) {
	    	
	    	//파일 추가 코드
	    	ArrayList<MyCampFile> myCampFile = mycService.selectMyCampFile(myCamp.getMycNo());
	    	
	    	System.out.println("업데이트쪽 : "+myCampFile.toString());
	    	int size = myCampFile.size();
	    	
	    	if (myCampFile != null) {
				for (int i = 0; i < size; i++) {
					if (!myCampFile.get(i).getMycFileName().equals(upload_name1)
							&& !myCampFile.get(i).getMycFileName().equals(upload_name2)
							&& !myCampFile.get(i).getMycFileName().equals(upload_name3)) {
						// 파일삭제
						deleteFile(myCampFile.get(i).getMycFileName(), request);
						mycService.deleteMyCampFile(myCampFile.get(i).getMycFileNo());
					}
				}
			}
			// 파일이 있는지 검사
			if (file != null) {
				for (int i = 0; i < file.length; i++) {
					if (!file[i].getOriginalFilename().equals("")) {
						MyCampFile mycImage = saveFile(i, file[i], request);
						mycService.insertMyCampFile(mycImage,request);
						//mycService.updateMyCampFile(mycImage,myCamp.getMycNo(),request);
					}
				}
			}
	    	
	     /*   //새로 업로드된 파일이 있을 경우
	        if (reloadFile != null && !reloadFile.isEmpty()) {
	            // 기존 업로드된 파일이 있을 경우
	            if ( notice.getFilePath() != null ) {
	               // 기존 파일 삭제
	               deleteFile(notice.getFilePath(), request);
	            }
	            
	            //새로 업로드 된 파일 저장
	              String savePath = saveFile(reloadFile, request);
	              
	              //새로 업로드된 파일이 잘 저장이 되었다면 디비 저장
	              if( savePath != null ) {
	                 //파일 이름만 DB에 저장
	                 notice.setFilePath(reloadFile.getOriginalFilename());
	              }
	        }*/
	        
	        int result = mycService.updateMyCampBoard(myCamp);
	        if(result > 0) {
	           //return "redirect:mycdetail.do?mycNo=" + myCamp.getMycNo();
	        	return "redirect:myclist.do";
	        }else {
	           model.addAttribute("msg", "게시글 수정 실패");
	           return "common/errorPage";
	        }
	     }
	     
	 /*    //파일 삭제 메소드
	     // 공지글 등록 실패 또는 글 수정으로 업로드 파일이 변한 경우  저장되어 있는 기존 파일 삭제
	     public void deleteFile(String fileName, HttpServletRequest request) {
	        
	         // 파일 저장 경로 설정
	           String root = request.getSession().getServletContext().getRealPath("resources");
	           String savePath = root + "\nuploadFiles";
	           // 삭제할 파일 경로 + 파일명
	           File deleteFile = new File(savePath + "\\" + fileName);
	           // 해당 파일이 존재할 경우 삭제
	           if (deleteFile.exists()) {
	               deleteFile.delete();
	           }
	     }*/
	    
	     
	   	//나만의 캠핑 글 삭제
	     // 1. DB 데이터 삭제
	     // 2. DB 데이터 삭제 성공시 저장된 파일 삭제
	     // 3. 삭제 후 공지사항 목록으로 redirect
	     @RequestMapping("deletemycboard.do")
	     public String deleteMyCampBoard(int mycNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
	        
	       //파일을 지우기 위해  nId 공지사항 조회
	    	 /*    Notice notice = nService.selectOne(nId); //가지고 있는 파일의 이름을 가져온다*/
	        int result = mycService.deleteMyCampBoard(mycNo);
	        
	        if( result >  0 ) {
	           rd.addFlashAttribute("msg", "게시글 삭제 성공");   
	           return "redirect:myclist.do";
	        }else {
	           model.addAttribute("msg", "게시글 삭제 실패");
	           return "common/errorPage";
	        }
	     }

	     
	   //나만의 캠핑 파일 내용 조회
	     @RequestMapping("mycFileList.do")
	 	public void selectMyCampFile(ModelAndView mv, HttpServletResponse response, int mycNo) throws JsonIOException, IOException{
	 		
	 		ArrayList<MyCampFile> fileList = mycService.selectMyCampFile(mycNo);
	 		
	 		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(fileList, response.getWriter());
	    	 
	 	}
	
	     //나만의 캠핑 댓글=================================================
	     
	   //나만의 캠핑 댓글 내용 조회
	     @RequestMapping("mycCommentList.do")
	 	public void selectMyCampComment(HttpServletResponse response, int mycNo) throws JsonIOException, IOException{
	 		
	 		ArrayList<MyCampComment> commentList = mycService.selectMyCampComment(mycNo);
	 		
	 		for (MyCampComment mycComment : commentList) {
	 			mycComment.setMycComment(URLEncoder.encode(mycComment.getMycComment(), "utf-8"));
			}
			//기존 JSONObject, JSONArray를 이용해서 JSON형태로 만들어줬음
			//여기선 Gson라이브러리를 사용하여 간단하게 만들고자함(pom.xml에 넣어줘야함)
			//reply 객체를 JSON형태로 변환해줘서 data로 보내줘야함 
			//{'bId' :1, 'bName':'제목'}이 형태가 json형태
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(commentList, response.getWriter());
	    	 
	 	}
	     
	 	//나만의 캠핑 댓글 쓰기
	     @RequestMapping("insertComment.do")
	     @ResponseBody
		public String insertMyCampComment(MyCampComment myCampComment, HttpSession session) {
	        Member loginUser =(Member)session.getAttribute("loginUser");
	        String mId = loginUser.getmId();
	        myCampComment.setmId(mId);
	        int result = mycService.insertMyCampComment(myCampComment);
	        System.out.println(myCampComment+"하핳");
	        if(result >0) {
	        	return "success";
	        }else {
	        	return "fail";
	        }
		}
		
		//나만의 캠핑 댓글 수정
	    @RequestMapping("updateComment.do")
	    @ResponseBody
		public String updateMyCampComment(MyCampComment myCampComment,HttpSession session) {
	    	Member loginUser =(Member)session.getAttribute("loginUser");
	       /* String mId = loginUser.getmId();
	        myCampComment.setmId(mId);*/
	    	int result = mycService.updateMyCampComment(myCampComment);
	    	System.out.println("하핳");
	        if(result >0) {
	        	return "success";
	        }else {
	        	return "fail";
	        }
		}

		//나만의 캠핑 댓글 삭제
		@RequestMapping("deleteComment.do")
	     @ResponseBody
		public String deleteMyCampComment(int mycCommentNo) {
			 int result = mycService.deleteMyCampComment(mycCommentNo);
		        if(result >0) {
		        	return "success";
		        }else {
		        	return "fail";
		        }
		}
		
		//=========좋아요=================
	
		 /* @ResponseBody
		    @RequestMapping(value = "clicklike.do", method = RequestMethod.POST, produces = "application/json")
		    public int heart(HttpServletRequest httpRequest) {

		        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
		        int mycNo = Integer.parseInt(httpRequest.getParameter("mycNo"));
		        String mId = ((Member) httpRequest.getSession().getAttribute("loginUser")).getmId();

		        MyCampLike myCampLike = new MyCampLike();	

		        myCampLike.setMycNo(mycNo);
		        myCampLike.setmId(mId);

		        System.out.println(heart);

		        if(heart >= 1) {
		            mycService.deleteMyCampLike(myCampLike);
		            heart=0;
		        } else {
		        	mycService.insertMyCampLike(myCampLike);
		        	heart=1;
		        }

		        return heart;

		    }*/

		
		  @ResponseBody
		    @RequestMapping(value = "clicklike.do", method = RequestMethod.POST, produces = "application/json")
		    public int heart(HttpServletRequest httpRequest) {

		        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
		        int mycNo = Integer.parseInt(httpRequest.getParameter("mycNo"));
		        String mId = ((Member) httpRequest.getSession().getAttribute("loginUser")).getmId();

		       // MyCampLike myCampLike = mycService.selectMyCampLike(mycNo);
		        
		        MyCampLike myCampLike = new MyCampLike();
		        
		        myCampLike.setMycNo(mycNo);
		        myCampLike.setmId(mId);

		        System.out.println("여기 : "+heart);
		        System.out.println("여기 : "+mId);
		        System.out.println("여기 : "+mycNo);
		        
		        System.out.println("좋아요 코드 : "+myCampLike);
		        
		        if(heart >= 1) {
		            mycService.updateMyCampLikecnt(myCampLike);
		            System.out.println("업데이트 후 : "+myCampLike);
		            System.out.println("heart0으로 : "+heart);
		            heart=0;
		            System.out.println("heart0으로! : "+heart);
		        } else {
		        	mycService.insertMyCampLike(myCampLike);
		        	System.out.println("인서트 후 : "+myCampLike);
		        	heart=1;
		        	System.out.println("heart1으로 : "+heart);
		        }

		        return heart;

		    }


		
}
