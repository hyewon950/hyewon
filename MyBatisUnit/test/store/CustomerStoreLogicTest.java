package store;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import domain.Customer;

public class CustomerStoreLogicTest {
	
	private CustomerStoreLogic store;
	
	@Before
	public void setUp() {
		store=new CustomerStoreLogic();
	}
	
	@Test
	public void testRegisterCustomer() {
		Customer customer=new Customer();
		customer.setId("user11");
		customer.setName("일용자");
		customer.setAge(55);
		assertEquals(1, store.registerCustomer(customer));
	}

	@Test
	public void testSearchById() {
		String userId="user11";
		assertEquals(55, store.searchById(userId).getAge());
		
		
	}
	@Test
	public void testSearchAll() {
	//	assertNotNull(store.searchAll());
		assertEquals("user11", store.searchAll().get(0).getId());
	}
	@Test
	public void  testupdateCustomer() {
		Customer customer =store.searchById("user11");
		customer.setName("이용자");
		customer.setAge(66);
		assertEquals(true, store.updateCustomer(customer)>0);
	}
	@Test
	public void testDeleteById() {
		Customer customer= new Customer();
		customer=store.searchAll().get(0);
		//customer.setId("user11"); 바로 위에줄이랑 같음!!
		assertEquals(1,store.deleteCustomer(customer));
		
		
		
		
		
		
	}
	
	
}
