package store;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;

import common.SqlSessionTemplate;
import member.domain.Member;
import member.store.MemberStoreLogic;

public class MemberStoreLogicTest {

	public MemberStoreLogic store;
	private SqlSession session;
	
	@Before
	public void setUp() {
		store = new MemberStoreLogic();
		session=SqlSessionTemplate.getSqlSession();
	}

	
	
	@Test
	public void testSelectOneMember() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectListMember() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsertMember() {
		Member member =new Member();
		member.setUserId("user22");
		member.setUserPwd("1234");
		member.setUserName("사용자");
		member.setEmail("user23@iei.or.kr");
		member.setBirthDay("900060");
		member.setGender("F");
		member.setPhone("01023456789");
		member.setAddress("서울시 영등포구");
		assertEquals(1, store.insertMember(session, member));
		
	}

	@Test
	public void testUpdateMember() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteMember() {
		fail("Not yet implemented");
	}

}
