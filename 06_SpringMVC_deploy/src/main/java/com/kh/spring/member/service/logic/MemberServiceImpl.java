package com.kh.spring.member.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.common.Log4jAdvice;
import com.kh.spring.common.LogAdvice;
import com.kh.spring.member.domain.Member;
import com.kh.spring.member.service.MemberService;
import com.kh.spring.member.store.MemberStoreLogic;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	//@Qualifier("mStore")
	private MemberStoreLogic mStore;
	
	/*private Log4jAdvice log4j;
	
	public MemberServiceImpl() {
		log4j = new Log4jAdvice();
	}*/
	/*private LogAdvice log;
	
	public MemberServiceImpl() {
		log = new LogAdvice();
	}*/

	@Override
	public Member loginMember(Member mem) {
		/*log4j.printLogging();*/
		/*log.printLog();*/
		System.out.println("loginMember 메소드 동작");
		return mStore.selectMember(mem);
	}

	@Override
	@Transactional
	public int checkIdDup(String id) {
		/*log.printLog();*/
		return mStore.checkIdDup(id);
	}

	@Override
	@Transactional
	public int insertMember(Member mem) {
		/*log.printLog();*/
		return mStore.insertMember(mem);
	}

	@Override
	@Transactional
	public int updateMember(Member mem) {
		/*log.printLog();*/
		return mStore.updateMember(mem);
	}

	@Override
	@Transactional
	public int deleteMember(String id) {
		/*log.printLog();*/
		return mStore.deleteMember(id);
	}
	

}
