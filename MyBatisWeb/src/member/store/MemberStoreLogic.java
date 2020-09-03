package member.store;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import member.domain.Member;

public class MemberStoreLogic implements MemberStore {

	//sqlsession 생성했지만..
	
	@Override
	public Member selectOneMember(SqlSession session, Member member) {
		Member m=session.selectOne("Member.loginMember",member);
		return m;
	}

	@Override
	public Member selectOneMember(SqlSession session, String userId) {
		Member m=session.selectOne("Member.selectOneMember",userId);
		return m;
	}
	
	@Override
	public ArrayList<Member> selectListMember(SqlSession session) {
		List<Member> mList=session.selectList("Member.selectAllMember");
		return (ArrayList<Member>)mList;
	}

	@Override
	public int insertMember(SqlSession session, Member member) {
		// insert메소드 첫번째 부분에 namespace.id값을 입력
		int result = session.insert("Member.insertMember", member);
		
		return result;
	}


	@Override
	public int updateMember(SqlSession session, Member member) {
		int result=session.update("Member.updateMember",member);
		return result;
	}

	@Override
	public int deleteMember(SqlSession session, Member member) {
		int result=session.delete("Member.deleteMember",member);
		return result;
	}

}
