package store;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import domain.Customer;

public class CustomerStoreLogic {

	private static final String resource = "mybatis-config.xml";
	private SqlSessionFactory getSessionFactory() {
		Reader reader = null;
		
		try {
			reader = Resources.getResourceAsReader(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(reader);
	}
	
		public int registerCustomer(Customer customer) {
		
		SqlSession session = getSessionFactory().openSession(false);
		
		int result = session.insert("CustomerMapper.insertCustomer", customer);
		if ( result > 0 ) {
			session.commit();
		}else {
			session.rollback();
		}
		return result;
	}

		public Customer searchById(String userId) {
			SqlSession session=getSessionFactory().openSession(false);
			
			return session.selectOne("CustomerMapper.selectById",userId);
		}
		
		public List<Customer> searchAll(){
			SqlSession session =getSessionFactory().openSession(false);
			
			return session.selectList("CustomerMapper.selectAll");
			
		}
		
		public int updateCustomer(Customer customer) {
			SqlSession session=getSessionFactory().openSession(false);
			int result=session.update("CustomerMapper.updateCustomer",customer);
			if ( result > 0 ) {
				session.commit();
			}else {
				session.rollback();
			}
			return result;
		}
		
		public int deleteCustomer(Customer customer) {
			SqlSession session=getSessionFactory().openSession(false);
			
			int result=session.delete("CustomerMapper.deleteById",customer);
			if ( result > 0 ) {
				session.commit();
			}else {
				session.rollback();
			}
			return result;
		}
		
	}

	
	

