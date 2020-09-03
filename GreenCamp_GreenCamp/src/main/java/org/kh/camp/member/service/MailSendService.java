package org.kh.camp.member.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.kh.camp.member.domain.Member;
import org.kh.camp.member.store.MemberStoreLogic;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {

	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberStoreLogic memberStore;
	
	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	// 회원가입 발송 이메일(인증하기 누르면 회원가입 완료) : 인증키 값 알아서 db에 들어감
	public int mailSendWithUserKey(Member mem, HttpServletRequest request) {
		String key = getKey(false, 20);
		
		mem.setmKey(key); //난수키값저장
		
		
		
		MimeMessage mail = mailSender.createMimeMessage();
		//get방식으로 보낼 url을 작성하는데 param값으로 id와 key값을 보낸다. 
		//만약 id와 key값이 동일하다면 key값을 특정값으로 바꿔 이메일 인증 상태로 바꾼다.
		String htmlStr = "<h2>안녕하세요 GREEN CAMP 입니다!</h2><h2>저희 홈페이지를 찾아주셔서 감사합니다</h2><br><br>" 
				+ "<h3>" + mem.getmName() + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost:8855/key_alter.do?mKey="+ mem.getmKey() +"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증] Green Camp의 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(mem.getmEmail()));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return memberStore.insertMemberEmailKey(mem);
		
	}
	
	
	// 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
	public int alter_userKey_service(String key) {
			int resultCnt = 0;
			
			resultCnt = memberStore.alterMemberKey(key);
			
			return resultCnt;
		}
	
	
	// Id찾기시 이메일로 인증키값 보냄
		public int mailSendFindId(Member mem, HttpServletRequest request) { //이름, 이메일값이 들어가있음
			String key = getKey(false, 20);
			
			mem.setmKey(key); //난수키값저장
			
			MimeMessage mail = mailSender.createMimeMessage();
			//get방식으로 보낼 url을 작성하는데 param값으로 id와 key값을 보낸다. 
			//만약 id와 key값이 동일하다면 key값을 특정값으로 바꿔 이메일 인증 상태로 바꾼다.
			String htmlStr = "<h2>안녕하세요 GREEN CAMP 입니다!</h2><h2>저희 홈페이지를 찾아주셔서 감사합니다</h2><br><br>" 
					+ "<h3>" + mem.getmName() + "님</h3>" + "<b>인증번호 : " 
					+ mem.getmKey() +"</b><br>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[본인인증] Green Camp의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(mem.getmEmail()));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			return memberStore.findIdEmailKey(mem);
			
		}
		
}
