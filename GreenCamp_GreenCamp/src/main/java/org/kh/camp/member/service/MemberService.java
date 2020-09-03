package org.kh.camp.member.service;

import org.kh.camp.member.domain.Member;

public interface MemberService {

	/**
	 * 로그인 서비스를 위한 메소드/ 회원 한명 세부정보조회
	 * 
	 * @param mem
	 * @return loginUser
	 */
	public Member loginMember(Member mem);

	/**
	 * 아이디 중복 검사
	 * 
	 * @param id
	 * @return result
	 */
	public int checkIdDup(String id);
	
	/**
	 * 아이디 비밀번호 일치확인
	 * 
	 * @param mem
	 * @return result
	 */
	public int idpwdCheck(Member mem);
	

	/**
	 * 회원 정보 수정 서비스를 위한 메소드
	 * 
	 * @param mem
	 * @return result
	 */
	public int updateMember(Member mem);

	/**
	 * 회원 탈퇴 서비스를 위한 메소드
	 * 
	 * @param id
	 * @return result
	 */

	public int deleteMember(String id);
	
	/**
	 * 회원 탈퇴후 다시 사용자로 돌아가는 메소드(회원탈퇴취소)
	 * @param mId
	 * @return
	 */
	public int deleteMemberRevert(String mId);
	
	/**
	 * ID찾기 후 회원정보알려주기위해서 사용
	 * 
	 * @param mem
	 * @return member
	 */
	public Member findIdAfter(Member mem);
	
	/**
	 * Pwd찾기 후 회원정보알려주기위해서 사용
	 * 
	 * @param mem
	 * @return member
	 */
	public Member findPwdAfter(Member mem);
	
	
	/**
	 * Pwd찾기 후 비밀번호 수정 서비스를 위한 메소드
	 * 
	 * @param mem
	 * @return result
	 */
	public int findPwdUpdate(Member mem);

}
