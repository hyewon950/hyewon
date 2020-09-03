package com.kh.spring.member.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.domain.Member;

@Repository("mStore")
public class MemberStoreLogic {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public Member selectMember(Member mem) {
		Member loginUser 
		= sqlSession.selectOne("memberMapper.selectOne", mem);
		return loginUser;
	}
	
	public int insertMember(Member mem) {
		int result 
		= sqlSession.insert("memberMapper.insertMember", mem);
		return result;
	}
	
	public int checkIdDup(String userId) {
		int result 
		= sqlSession
			.selectOne("memberMapper.checkIdDup", userId);
		return result;
	}
	
	public int updateMember(Member mem) {
		return sqlSession
					.update("memberMapper.updateMember", mem);
	}
	
	public int deleteMember(String userId) {
		return sqlSession
				.update("memberMapper.deleteMember",userId);
	}
	
}
