package member.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import member.domain.Member;

public interface MemberService {


	public Member selectOneMember(Member member);
	public Member selectOneMember(String userId);
	public ArrayList<Member> selectListMember();
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(Member member);
	
	
	
	
}
