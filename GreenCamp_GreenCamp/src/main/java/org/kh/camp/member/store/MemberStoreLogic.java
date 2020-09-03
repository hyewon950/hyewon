package org.kh.camp.member.store;

import org.kh.camp.member.domain.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberStore")
public class MemberStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 로그인
	public Member selectMember(Member mem) {
		Member loginUser = sqlSession.selectOne("memberMapper.selectOne", mem);
		return loginUser;
	}

	// 아이디 중복검사
	public int checkIdDup(String id) {
		return sqlSession.selectOne("memberMapper.checkIdDup", id);
	}

	// 아이디 비밀번호 일치하는 확인
	public int idpwdCheck(Member mem) {
		return sqlSession.selectOne("memberMapper.idpwdCheck", mem);
	}

	// 회원 정보 수정
	public int updateMember(Member mem) {
		return sqlSession.update("memberMapper.updateMember", mem);
	}

	// 회원 탈퇴
	public int deleteMember(String mId) {
		return sqlSession.delete("memberMapper.deleteMember", mId);
	}

	// 회원 탈퇴후 다시 사용자로 돌아가는 메소드(회원 탈퇴 취소)
	public int deleteMemberRevert(String mId) {
		return sqlSession.delete("memberMapper.deleteMemberRevert", mId);
	}

	// 회원가입시 mkey에 난수값을 저장
	public int insertMemberEmailKey(Member mem) {
		return sqlSession.insert("memberMapper.insertMemberEmailKey", mem);
	}

	// 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
	public int alterMemberKey(String key) {
		return sqlSession.update("memberMapper.alterMemberKey", key);
	}

	// ID찾기시 이메일 인증키값
	public int findIdEmailKey(Member mem) {
		int result = 0;
		result = sqlSession.update("memberMapper.findIdEmailKey", mem);
		return result;
	}

	// ID찾고 회원조회
	public Member findIdAfter(Member mem) {
		return sqlSession.selectOne("memberMapper.findIdAfter", mem);
	}

	// Pwd찾고 회원조회
	public Member findPwdAfter(Member mem) {
		return sqlSession.selectOne("memberMapper.findPwdAfter", mem);
	}

	// Pwd찾고 비번변경
	public int findPwdUpdate(Member mem) {
		return sqlSession.update("memberMapper.findPwdUpdate", mem);
	}

}
