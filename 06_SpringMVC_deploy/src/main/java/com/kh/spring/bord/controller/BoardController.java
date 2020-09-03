package com.kh.spring.bord.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.spring.bord.domain.Board;
import com.kh.spring.bord.domain.PageInfo;
import com.kh.spring.bord.domain.Reply;
import com.kh.spring.bord.service.BoardService;
import com.kh.spring.common.Pagination;
import com.kh.spring.member.domain.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@RequestMapping("blist.kh")
	public ModelAndView boardList(ModelAndView mv, @RequestParam(value="page",required=false)Integer page) {
		
		int currentPage = (page != null) ? page : 1;
		int listCount = bService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Board> list = bService.selectList(pi);

		
		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi",pi);
			mv.addObject("count",listCount);
			mv.setViewName("board/boardListView");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("bdetail.kh")
	public ModelAndView boardDetail(ModelAndView mv,int bId,@RequestParam("page")Integer page) {
		
		/*int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}*/
		int currentPage = page != null ? page : 1;

		bService.addReadCount(bId); // 조회수 증가
		Board board = bService.selectBoard(bId);
		if ( board != null ) {
			//메소드 체이닝 방식
			mv.addObject("board", board)
				.addObject("currentPage", currentPage)
				.setViewName("board/boardDetailView");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패!")
			.setViewName("common/errorPage");
		}
		return mv;

	 		}
	
	@RequestMapping("rList.kh")
	public void getReplyList(HttpServletResponse response, int bId)throws JsonIOException, IOException {
		ArrayList<Reply> rList = bService.selectReplyList(bId);
		
		for (Reply r : rList) {
			r.setrContent(URLEncoder.encode(r.getrContent(), "utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());
		// 기존에 JSONOBject, JSONArray를 이용해서 JSON형태로 만들어줬음
		// 여기선 Gson 라이브러리를 사용하고자 함.
		// reply 객체를 JSON형태로 변환해줘서 data로 보내줘야함.
		// {'bId':1,'bName':'제목'}
	}

	
	@RequestMapping("addReply.kh")
	@ResponseBody //viewresolver를 거치지 않고 body에 string값으로 전송하는 어노테이션
	public String addReply(Reply r, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String rWriter = loginUser.getUserId();
		r.setrWriter(rWriter);
		int result = bService.insertReply(r);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
		}
