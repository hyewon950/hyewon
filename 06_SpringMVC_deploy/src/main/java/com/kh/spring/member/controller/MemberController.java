package com.kh.spring.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.member.domain.Member;
import com.kh.spring.member.service.MemberService;

@SessionAttributes({"loginUser"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;

	@RequestMapping(value="login.kh", method=RequestMethod.POST)
	public ModelAndView memberLogin(Member mem,
							ModelAndView mv) {
		Member loginUser = mService.loginMember(mem);
		if(loginUser != null) {
			mv.addObject("loginUser", loginUser);
			//model.addAttribute("loginUser", loginUser);
			mv.setViewName("home");
			//return "home";
		}else {
			mv.addObject("msg", "로그인 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("logout.kh")
	public String memberLogout(SessionStatus status) {
		// @SessionAttributes 를 사용하였을 때
		// Session을 만료시키기 위해서는 
		// status.setComplete()를 호출해야 함.
		status.setComplete();
		return "redirect:home.kh";
	}
	
	@RequestMapping("enrollView.kh")
	public String enrollView() {
		return "member/memberJoin";
	}
	
	@RequestMapping(value="minsert.kh", method=RequestMethod.POST)
	public String memberInsert(Member mem, Model model,
						String post, String address1,
						String address2) {
		mem.setAddress(post+","+address1+","+address2);
		int result = mService.insertMember(mem);
		if ( result > 0 ) {
			return "redirect:home.kh";
		}else {
			model.addAttribute("msg", "회원 가입 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("dupid.kh")
	public String idDuplicateCheck(String userId) {
		boolean isUsable
			= mService
				.checkIdDup(userId) == 0 ? true : false;
		return isUsable+""; // /WEB-INF/views/true.jsp
	}
	
	@RequestMapping("myinfo.kh")
	public String myInfoView() {
		return "member/myPage";
	}
	
	
	@RequestMapping(value="mupdate.kh", method=RequestMethod.POST)
	public String memberUpdate(Member mem, Model model, 
							String post,
							String address1,
							String address2,
							RedirectAttributes rd) {
		mem.setAddress(post+","+address1+","+address2);
		int result = mService.updateMember(mem);
		if ( result > 0 ) {
			model.addAttribute("loginUser", mem);
			rd.addFlashAttribute("msg", "정보 수정 성공");
			return "redirect:home.kh";
		}else {
			model.addAttribute("msg", "정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("mdelete.kh")
	public String memberDelete(String userId, 
			SessionStatus status,Model model, 
							RedirectAttributes rd) {
		int result = mService.deleteMember(userId);
		if ( result > 0 ) {
			rd.addFlashAttribute("msg", "회원 탈퇴 성공");
			status.setComplete();
			return "redirect:home.kh";
		}else {
			model.addAttribute("msg", "회원 탈퇴 실패");
			return "common/errorPage";
		}
	}
	
	
	
	
}
