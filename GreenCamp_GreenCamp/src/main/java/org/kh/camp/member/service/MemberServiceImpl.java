package org.kh.camp.member.service;


import org.kh.camp.member.domain.Member;
import org.kh.camp.member.store.MemberStoreLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberStoreLogic memberStore;
	
	@Override
	public Member loginMember(Member mem) {
		// 로그인
		Member loginUser = memberStore.selectMember(mem);
	      return loginUser;
	}

	@Override
	public int checkIdDup(String id) {
		// 아이디 중복 검사
		return memberStore.checkIdDup(id);
	}

	@Override
	public int updateMember(Member mem) {
		//회원정보수정
		return memberStore.updateMember(mem);
	}

	@Override
	public int deleteMember(String id) {
		// 회원탈퇴
		return memberStore.deleteMember(id);
	}

	@Override
	public int deleteMemberRevert(String mId) {
		// 회원 탈퇴후 다시 사용자로 돌아가는 메소드(회원 탈퇴 취소)
		return memberStore.deleteMemberRevert(mId);
	}

	@Override
	public int idpwdCheck(Member mem) {
		// 아이디 비밀번호 맞는지 확인
		return memberStore.idpwdCheck(mem);
	}

	@Override
	public Member findIdAfter(Member mem) {
		// ID찾기 후 회원정보
		return memberStore.findIdAfter(mem);
	}

	@Override
	public Member findPwdAfter(Member mem) {
		// Pwd찾기 후 회원정보
		return memberStore.findPwdAfter(mem);
	}

	@Override
	public int findPwdUpdate(Member mem) {
		// Pwd찾기 후 비번변경
		return memberStore.findPwdUpdate(mem);
	}

	

}
