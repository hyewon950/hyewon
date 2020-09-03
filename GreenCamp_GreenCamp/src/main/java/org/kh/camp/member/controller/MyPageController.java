package org.kh.camp.member.controller;

import java.util.ArrayList;

import org.kh.camp.camping.domain.Camping;
import org.kh.camp.camping.domain.Reservation;
import org.kh.camp.camping.service.CampingService;
import org.kh.camp.member.service.MemberService;
import org.kh.camp.used.domain.UsedBoard;
import org.kh.camp.used.service.UsedBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("myPageController")
public class MyPageController {

	@Autowired
	private UsedBoardService usedService;
	
	@Autowired
	private CampingService campService;

	// 예약정보 페이지로 이동
	@RequestMapping("MyReservationInfoView.do")
	public String myPageInfoView(String mId, Model model) {

		 ArrayList<Reservation> resList = campService.selectReservationUser(mId);
		
		 model.addAttribute("resList", resList);//회원예약정보들
		 
		 ArrayList<Camping> campList = new ArrayList<Camping>();
		 
		 for(int i = 0; i<resList.size(); i++) {
			 campList.add(campService.selectCampingOne(resList.get(i).getcNo())); //캠핑장번호로 캠핑장정보를 가져와서 campList에 저장
		 }
		 
		 model.addAttribute("campList", campList); //캠핑장정보들
		 
		return "member/myReservationInfo";
	}

	// 내가 등록한 중고상품 페이지로 이동
	@RequestMapping("myUsedProductView.do")
	public ModelAndView myUsedProductView(String mId, ModelAndView mv) {
		
		ArrayList<UsedBoard> usedList = usedService.myUsedSelect(mId);

		if(!usedList.isEmpty()) {
			mv.addObject("usedList", usedList);
			mv.setViewName("member/myUsedProduct");
		}else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}

	//캠핑장 예약 취소
	@RequestMapping("deleteReservation.do")
	public String deleteReservation(int resNo,String mId, RedirectAttributes rd) {
		int result = campService.deleteReservation(resNo);
		
		if (result > 0) {
			rd.addFlashAttribute("msg", "예약취소완료!"); //페이지에서 alert창에 나옴
			return "redirect:MyReservationInfoView.do?mId="+mId;
			
			
		}else {
			return "common/errorPage";
		}
		
	}
	
	//체크인(예정) 캠핑장페이지로 이동
	@RequestMapping("myCheckInView.do")
	public String myCheckInView(String mId, Model model) {

		 ArrayList<Reservation> resList = campService.selectReservationUser(mId);
		
		 model.addAttribute("resList", resList);//회원예약정보들
		 
		 ArrayList<Camping> campList = new ArrayList<Camping>();
		 
		 for(int i = 0; i<resList.size(); i++) {
			 campList.add(campService.selectCampingOne(resList.get(i).getcNo())); //캠핑장번호로 캠핑장정보를 가져와서 campList에 저장
		 }
		 
		 model.addAttribute("campList", campList); //캠핑장정보들
		 
		return "member/myCheckIn";
	}
	
	//체크아웃 캠핑장페이지로 이동
		@RequestMapping("myCheckOutView.do")
		public String myCheckOutView(String mId, Model model) {

			 ArrayList<Reservation> resList = campService.selectReservationUser(mId);
			
			 model.addAttribute("resList", resList);//회원예약정보들
			 
			 ArrayList<Camping> campList = new ArrayList<Camping>();
			 
			 for(int i = 0; i<resList.size(); i++) {
				 campList.add(campService.selectCampingOne(resList.get(i).getcNo())); //캠핑장번호로 캠핑장정보를 가져와서 campList에 저장
			 }
			 
			 model.addAttribute("campList", campList); //캠핑장정보들
			 
			return "member/myCheckOut";
		}
	

}
