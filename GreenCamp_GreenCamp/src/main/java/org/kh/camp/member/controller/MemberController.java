package org.kh.camp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kh.camp.member.domain.Member;
import org.kh.camp.member.service.MailSendService;
import org.kh.camp.member.service.MemberService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@SessionAttributes({"loginUser"})
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private MailSendService mailsender;	//이메일인증서비스

	//회원가입
	@RequestMapping(value = "emailEnroll.do", method = RequestMethod.POST)
	public String userRegPass(Member mem, Model model, HttpServletRequest request) {

		// 인증 메일 보내기 메서드
		mailsender.mailSendWithUserKey(mem, request);

		model.addAttribute("loginUser", mem);
		
		return "/member/checkEmailKey";
	}
	
	
	// e-mail 인증 컨트롤러(key값을 Y로) : 회원가입 후 인증완료시
		@RequestMapping(value = "key_alter.do", method = RequestMethod.GET)
			public String key_alterConfirm(@RequestParam("mKey") String key) {

			mailsender.alter_userKey_service(key); // mailsender의 경우 @Autowired

			return "/member/emailCheckOk";
		}

	
	//로그인페이지로 이동
	@RequestMapping("loginView.do")
	public String loginView() {
		return "/member/loginPage";
	}
	
	//로그인
		@RequestMapping(value="login.do", method=RequestMethod.POST)
		public String memberLogin(Member mem, Model model) {
			
			Member loginUser = mService.loginMember(mem);
			
			if(loginUser != null) {
				if(loginUser.getmKey().equals("Y") && loginUser.getmStatusYN().equals("N")) {
				model.addAttribute("loginUser", loginUser);
				model.addAttribute("msg", "로그인 성공!");
				return "redirect:home.do";
				}else if(!loginUser.getmKey().equals("Y")) {
					model.addAttribute("loginUser", loginUser);
					//이메일 인증하라는 페이지로
					return "/member/checkEmailKey";
				}else if(loginUser.getmStatusYN().equals("Y")) {
					//로그인했는데 회원탈퇴한 유저일 경우
					model.addAttribute("loginUser", loginUser);
					return "/member/loginNo";
				}else{
					model.addAttribute("msg", "로그인 실패!");
					return "common/errorPage";
				}
				
			}else{
					model.addAttribute("msg", "로그인 실패!");
					return "common/errorPage";
				}
				
			}
			
		
		
		//로그아웃
		@RequestMapping("logout.do")
		public String memberLogout(SessionStatus status) {
			//Session.invalidate();을 썼지만 Spring에서는 status도 쓴다.
			//SessionStatus는 세션의 상태를 관리하는 객체
			status.setComplete();
			return "redirect:home.do";
		}
		
		//회원가입 페이지로 뷰를 이동시키는 메소드
		@RequestMapping("enrollView.do")
		public String enrollView() {
			//member-context.xml에서 주소를 WEB-INF/views/member/ .jsp를 해두었기때문에 파일명만 적으면 된다.
			return "member/enrollPage";
		}
		
			
		
		// 아이디 중복 검사
		// Spring에서 ajax를 쓸때 ResponseBody을 쓴다.
		@ResponseBody		// ResponseBody	: 데이터의 값을 true값으로 보내겠다는 의미!!, 안쓰면 문자열자체를 보냄
		@RequestMapping("dupid.do")
		public String idDuplicateCheck(String mId){
		//키값을 userId라고해서 userId라고 해야함
			
			boolean isUsale = mService.checkIdDup(mId) == 0 ? true : false;
			
			return isUsale + ""; //boolean형을 String형으로 변환하기 위해서 + ""을함
			
		}
		
		// 로그인시 아이디 비밀번호 일치하는지 확인
				// Spring에서 ajax를 쓸때 ResponseBody을 쓴다.
				@ResponseBody		// ResponseBody	: 데이터의 값을 true값으로 보내겠다는 의미!!, 안쓰면 문자열자체를 보냄
				@RequestMapping("idpwdCheck.do")
				public String idpwdCheck(Member mem){
				//키값을 userId라고해서 userId라고 해야함
					
					boolean isUsale = mService.idpwdCheck(mem) == 0 ? true : false;
					
					return isUsale + ""; //boolean형을 String형으로 변환하기 위해서 + ""을함
					
				}
		
		//회원 정보 페이지로 이동
		@RequestMapping("memberModifyView.do")
		public String myInfoView() {
			return "member/memberModify";
		}
		
		//회원 정보 수정
		@RequestMapping("mupdate.do")
		public String memberUpadte(Member mem, Model model, RedirectAttributes rd) {
			//name값이 다르면 @requestParam을 써서 가져온다. 
			//RedirectAttributes
			// Redirect시 데이터를 전달할 수 있는 객체
			
			// addFlashAttribute() 메소드
			// Redirect시 데이터 전달 시 URL에 데이터가 노출되지 않게 하는 메소드
			
			int result = mService.updateMember(mem);
			if( result > 0 ) {
				model.addAttribute("loginUser",mem);
				rd.addFlashAttribute("msg","정보 수정 성공!");
				return "redirect:home.do";
			}else {
				model.addAttribute("msg","정보 수정 실패");
				return "common/errorPage";
			}
			
			
		}
		
		// 회원 탈퇴
		@RequestMapping("mdelete.do")
		public String memberDelete(String mId, SessionStatus status, Model model) {
			
			int result = mService.deleteMember(mId);
			if( result > 0 ) {
				status.setComplete(); //세션파괴
				model.addAttribute("msg",mId+"회원 탈퇴!");
				return "redirect:home.do";
			}else {
				model.addAttribute("msg","회원 탈퇴 실패");
				return "common/errorPage";
			}
			
			
		}
		
		//마이페이지(회원정보조회) 페이지로 이동
		@RequestMapping("myPageMemberSelectView.do")
		public String myPageMemberSelectView() {
			return "member/myPageMemberSelect";
		}
		
		
		
		//마이페이지(회원탈퇴) 페이지로 이동
		@RequestMapping("memberDeleteView.do")
		public String memberDeleteView() {
			return "member/memberDelete";
		}
		
		//회원탈퇴후 다시 사용자로 돌아오기(회원 탈퇴 취소)
		@RequestMapping("memberDeleteRevert.do")
		public String memberDeleteRevert(String mId, Model model) {
			
			int result = mService.deleteMemberRevert(mId);
			if( result > 0 ) { //사용자로 돌아오기
				model.addAttribute("mId", mId);
				return "member/comebackMember";
			}else {
				model.addAttribute("msg","회원 돌리기 실패");
				return "common/errorPage";
			}
		
		}
		
		//아이디찾기페이지로 이동
		@RequestMapping("findIDView.do")
		public String findIDView() {
			return "member/findID";
		}
		
		//아이디 찾기
		@RequestMapping(value = "findId.do", method = RequestMethod.POST)
		@ResponseBody // ajax할때 String값을 보낼때 써야한다.
		public String findId(Member mem, Model model, HttpServletRequest request) {

			// 인증 메일 보내기 메서드
			int result = mailsender.mailSendFindId(mem, request);
			
			if( result > 0 ) { 
				model.addAttribute("loginUser", mem);
				return mem.getmKey();
			}else {
				return "no";
			}
			
		}
		
		//아이디 찾기 성공
		@RequestMapping(value = "findIdSuccess.do", method = RequestMethod.POST)
		public String findIdSuccess(Member mem, Model model, HttpServletRequest request) {

			int result = mailsender.alter_userKey_service(mem.getmKey());
			
			Member member = mService.findIdAfter(mem);
			
			if( result > 0 ) { 
				model.addAttribute("member", member);
				return "member/findIdAfter";
			}else {
				return "common/errorPage";
			}
			
		}
		
		//비밀번호찾기페이지로 이동
		@RequestMapping("findPwdView.do")
		public String findPwdView() {
				return "member/findPWD";
		}
		
		//비밀번호 찾기 성공
		@RequestMapping(value = "findPwdSuccess.do", method = RequestMethod.POST)
		public String findPwdSuccess(Member mem, Model model, HttpServletRequest request) {

			int result = mailsender.alter_userKey_service(mem.getmKey());
			
			Member member = mService.findPwdAfter(mem);
			
			if( result > 0 ) { 
				model.addAttribute("member", member);
				System.out.println("컨트롤러 mem : " + mem);
				return "member/findPwdAfter";
			}else {
				return "common/errorPage";
			}
			
		}
		
		
		// 비밀번호 회원 정보 수정
				@RequestMapping("findPwdUpdate.do")
				public String findPwdUpdate(Member mem, Model model, RedirectAttributes rd) {
					//RedirectAttributes
					// Redirect시 데이터를 전달할 수 있는 객체
					
					
					int result = mService.findPwdUpdate(mem);
					if( result > 0 ) {
						model.addAttribute("member",mem);
						return "redirect:home.do";
					}else {
						return "common/errorPage";
					}
					
					
				}
		
				
}
