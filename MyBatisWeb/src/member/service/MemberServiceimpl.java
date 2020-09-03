package member.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import common.SqlSessionTemplate;
import member.domain.Member;
import member.store.MemberStore;
import member.store.MemberStoreLogic;

public class MemberServiceimpl implements MemberService {

	
	MemberStoreLogic memberStore = new MemberStoreLogic();

	
	@Override
	public Member selectOneMember(Member member) {
		SqlSession session=SqlSessionTemplate.getSqlSession();
		Member m=memberStore.selectOneMember(session, member);
		session.close();
		return m;
	}

	@Override
	public Member selectOneMember(String userId) {
		SqlSession session=SqlSessionTemplate.getSqlSession();
		Member m=memberStore.selectOneMember(session, userId);
		session.close();
		return m;
	}
	
	@Override
	public ArrayList<Member> selectListMember() {
		SqlSession session=SqlSessionTemplate.getSqlSession();
		ArrayList<Member> list=memberStore.selectListMember(session);
		session.close();
		return list;
	}

	@Override
	public int insertMember(Member member) {
		//세션을 가져옴 (기존 connection과 동일)
		SqlSession session=SqlSessionTemplate.getSqlSession();
		int result=memberStore.insertMember(session,member);
		if(result>0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}

	@Override
	public int updateMember(Member member) {
		SqlSession session=SqlSessionTemplate.getSqlSession();
		int result=memberStore.updateMember(session, member);
		
		if(result>0) {
			session.commit();
		}else {
			session.rollback();
		}
		return result;
	}

	@Override
	public int deleteMember(Member member) {
		SqlSession session=SqlSessionTemplate.getSqlSession();
		int result=memberStore.deleteMember(session, member);
		if(result>0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		return result;
	}

}
