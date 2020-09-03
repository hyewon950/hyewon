package org.kh.camp.board.controller;

import java.awt.List;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.camp.board.domain.Board;
import org.kh.camp.board.domain.BoardComment;
import org.kh.camp.board.domain.BoardSearch;
import org.kh.camp.board.domain.OrderCondition;
import org.kh.camp.board.domain.PageInfo;
import org.kh.camp.board.service.BoardService;
import org.kh.camp.camping.domain.Camping;
import org.kh.camp.common.Pagination;
import org.kh.camp.files.controller.filesController;
import org.kh.camp.files.domain.Files;
import org.kh.camp.member.domain.Member;
import org.kh.camp.mycamp.domain.MyCampFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@Autowired
	private filesController fController;
	
	
	
	
	
	// 자유 게시판 리스트 보여지는 메소드
	@RequestMapping("flist.do")
	public ModelAndView freeBoardList(String bType, ModelAndView mv,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		bType = "자유";
		int listCount = bService.getListCount(bType);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Board> list = bService.selectList(pi, bType);
		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("bType", bType);
			mv.setViewName("board/freeBoard");
		} else {
			mv.setViewName("board/freeBoard");
		}
		return mv;
	}
	// 레시피 게시판 리스트 보여지는 메소드
	@RequestMapping("rlist.do")
	public ModelAndView recipeBoardList(String bType, ModelAndView mv,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		bType = "레시피";
		int listCount = bService.getListCount(bType);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Board> list = bService.selectList(pi, bType);

		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("bType", bType);
			mv.setViewName("board/recipeBoard");
		} else {
			mv.setViewName("board/recipeBoard");
		}
		return mv;
	}
	// 용품추천 게시판 리스트 보여지는 메소드
	@RequestMapping("plist.do")
	public ModelAndView productBoardList(String bType, ModelAndView mv,
			@RequestParam(value = "page", required = false) Integer page) {
		bType = "용품추천";
		int currentPage = (page != null) ? page : 1;
		int listCount = bService.getListCount(bType);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Board> list = bService.selectList(pi, bType);
		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("bType", bType);
			mv.setViewName("board/productBoard");
		} else {
			mv.setViewName("board/productBoard");
		}
		return mv;
	}
	// 가이드 게시판 리스트 보여지는 메소드
	@RequestMapping("glist.do")
	public ModelAndView guideBoardList(String bType, ModelAndView mv,
			@RequestParam(value = "page", required = false) Integer page) {
		bType = "가이드";
		int listCount = bService.getListCount(bType);
		int currentPage = (page != null) ? page : 1;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Board> list = bService.selectList(pi, bType);
		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("bType", bType);
			mv.setViewName("board/guideBoard");
		} else {
			mv.setViewName("board/guideBoard");
		}
		return mv;
	}

	// 게시판 상세보기

	/*
	 * @RequestMapping("detailBoard.do" ) public ModelAndView
	 * boardDetail(ModelAndView mv, int bNo, @RequestParam(value="page",
	 * required=false) Integer page, String boardType) { int currentPage = page !=
	 * null ? page : 1; bService.addReadCount(bNo); // 조회수 증가 Board board =
	 * bService.selectBoard(bNo);// 게시글 상세조회 ArrayList<BoardComment> commentList =
	 * bService.selectBoardCommentList(bNo); ArrayList<Files> BoardFile =
	 * fController.selectFileList(bNo);
	 * 
	 * if (board != null) { // 메소드 체이닝 방식 (이어서 썼다) mv.addObject("commentList",
	 * commentList); mv.addObject("BoardFile", BoardFile); mv.addObject("board",
	 * board).addObject("currentPage", currentPage).addObject("boardType",
	 * boardType) .setViewName("board/detailBoard");
	 * 
	 * } else { mv.addObject("msg", "게시글 상세조회 실패!").setViewName("common/errorPage");
	 * } return mv;
	 * 
	 * }
	 */
	
	@RequestMapping("detailBoard.do" )
	public String boardDetail(Model model, int bNo, @RequestParam(value="page", required=false) Integer page, String boardType) {
		int currentPage = page != null ? page : 1;
		bService.addReadCount(bNo); // 조회수 증가
		Board board = bService.selectBoard(bNo);// 게시글 상세조회
		ArrayList<BoardComment> commentList = bService.selectBoardCommentList(bNo);
		ArrayList<Files> BoardFile = fController.selectFileList(bNo);
		
		if (board != null) {
			// 메소드 체이닝 방식 (이어서 썼다)
			model.addAttribute("commentList", commentList);
			model.addAttribute("BoardFile", BoardFile);
			model.addAttribute("board", board);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("boardType", boardType);
			return "board/detailBoard";

		} else {
			return "common/errorPage";
		}

	}

	// 게시글 작성하는 메소드
	@RequestMapping(value="writeViewBoard.do",method=RequestMethod.GET)
	public String writeBoardView(HttpSession session, Model model, String bType) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		model.addAttribute("mId", loginUser.getmId());
		model.addAttribute("bType" , bType);
		return "board/writeBoard";
	}
	
	@RequestMapping(value="insertBoard.do", method=RequestMethod.POST)
	public String insertBoard(Board board, Files files, Model model, @RequestParam(name="uploadFile", required=false)MultipartFile[] uploadFile, MultipartHttpServletRequest requestM,  HttpServletRequest request, String mId) {
		System.out.println(board);
		String bType = board.getbType();

		int resultboard = 0;
		int resultFile = 0;
		String path = null;
/*		*/
		resultboard = bService.insertboard(board, request);
		
		if (resultboard > 0) {
			int bNo = bService.selectBoardLatestNo(mId);
			files.setbNo(bNo);
			
			for (int i = 0; i < uploadFile.length; i++) {
				if (!uploadFile[i].getOriginalFilename().equals("")) {
					resultFile = fController.insertFile(files, model, uploadFile[i], request, mId);
				}
			}
			if(bType.equals("용품추천")) {
				path = "redirect:plist.do";
			}
			if(bType.equals("가이드")) {
				path = "redirect:glist.do";
			}
			if(bType.equals("레시피")) {
				path = "redirect:rlist.do";
			}
			if(bType.equals("자유")) {
				path = "redirect:flist.do";
			}
		} else {
			model.addAttribute("msg", "게시물 등록 실패");
			path = "common/errorPage";
		}
		return path;
	}

	// 게시글 수정페이지로 넘어가는 메소드
	@RequestMapping("moveUpdate.do")
	public ModelAndView moveUpdateView(ModelAndView mv,int bNo,Model model) {
		System.out.println(bNo);
		Board selectOneBoard = bService.selectOneBoard(bNo);
		mv.addObject("selectOneBoard", selectOneBoard);
		mv.setViewName("board/modifyBoard");
		return mv;
	}
	
	//게시글 수정 메소드
	@RequestMapping("updateBoard.do")
	public String updateBoard(Board board,Model model) {
		System.out.println(board);
		bService.updateBoard(board);
		if(board.getbType().equals("용품추천")) {
			return "redirect:plist.do";
		}
		if(board.getbType().equals("가이드")) {
			return "redirect:glist.do";
		}
		if(board.getbType().equals("레시피")) {
			return "redirect:rlist.do";
		}
		if(board.getbType().equals("자유")) {
			return "redirect:flist.do";
		}
		else return "comon/errorPage";
	}
	
	
	// 게시글 삭제하는 메소드
	@RequestMapping("deleteBoardboard.do")
	public String deleteBoard(int bNo,Model model, String bType) {
		
		bService.deleteBoard(bNo);
			if(bType.equals("용품추천")) {
				return "redirect:plist.do";
			}
			if(bType.equals("가이드")) {
				return "redirect:glist.do";
			}
			if(bType.equals("레시피")) {
				return "redirect:rlist.do";
			}
			if(bType.equals("자유")) {
				return "redirect:flist.do";
			}
			else return "comon/errorPage";
	}
	
	

	
	// 게시판별 전체, 작성자, 제목, 카테고리 검색하는 메소드
	@RequestMapping("bsearch.do")
	public String boardSearch(@RequestParam(value = "boardType", required = false) String boardType, BoardSearch boardSearch, Model model) {
		ArrayList<Board> searchList = bService.searchList(boardSearch);
		if (!searchList.isEmpty()) {
			model.addAttribute("list", searchList);
			model.addAttribute("search", boardSearch);
			model.addAttribute("boardType", boardType);
			if (boardType.equals("자유")) {
				model.addAttribute("boardType", boardType);
				return "board/freeBoard";
			} else if (boardType.equals("가이드")) {
				model.addAttribute("boardType", boardType);
				return "board/guideBoard";
			} else if (boardType.equals("용품추천")) {
				model.addAttribute("boardType", boardType);
				return "board/productBoard";
			} else if (boardType.equals("레시피")) {
				model.addAttribute("boardType", boardType);
				return "board/recipeBoard";
			}
		} else {
			return "../comon/errorPage";
		}
		return "../comon/errorPage";
	}
	
/*----------- 댓글 ------------------*/
	
	// 댓글 작성하는 메소드
	@RequestMapping("addBoardComment.do")
	@ResponseBody // ViewResolver를 거치지 않고 body에 String 값으로 전송하는 어노테이션
	public String addReply(BoardComment bc, HttpSession session, Board board) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		bc.setCommentWriter(loginUser.getmName());
		int result = bService.insertBoardComment(bc);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	// 댓글 삭제하는 메소드
	@RequestMapping("deleteBoardComment.do")
	@ResponseBody // ViewResolver를 거치지 않고 body에 String 값으로 전송하는 어노테이션
	public String deleteComment(int commentNo) {
		int result = bService.deleteComment(commentNo);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 댓글 수정하는 메소드 fuck
	@RequestMapping("updateBoardComment.do")
	@ResponseBody // ViewResolver를 거치지 않고 body에 String 값으로 전송하는 어노테이션 
	public String updatecomment(int commentNo, String modifyComment) {
		int result = bService.updateComment(commentNo, modifyComment);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 게시글 좋아요 숫자 올라가는 메소드
	@RequestMapping("upRecommend.do")
	@ResponseBody
	public String likecampingdetailpage(int bNo) {

		int result = bService.addLike(bNo);
		if (result > 0) {
			Board board = bService.selectBoard(bNo);
			int bRecommend = board.getbLikeCnt();
			return bRecommend + "";
		} else {
			return "fail";
		}
	}

	
}

