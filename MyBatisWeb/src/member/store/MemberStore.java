package member.store;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import member.domain.Member;

public interface MemberStore {

	public Member selectOneMember(SqlSession session, Member member);
	public Member selectOneMember(SqlSession session, String userId);
	public ArrayList<Member> selectListMember(SqlSession session);
	public int insertMember(SqlSession session, Member member);
	public int updateMember(SqlSession session, Member member);
	public int deleteMember(SqlSession session, Member member);
	/*
	 * public ArrayList<Member> searchMember(SqlSession session, Search search);
	 * public ArrayList<Member> checkMemberList(SqlSession session, Check check);
	 * public ArrayList<Member> search2Member(SqlSession session, Member member);
	 * public ArrayList<Member> search3Member(SqlSession session, String [] data);
	 */
	
}
