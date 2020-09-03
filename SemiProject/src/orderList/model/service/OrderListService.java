package orderList.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectionFactory;
import orderList.model.dao.OrderListDAO;
import orderList.model.vo.OrderList;

public class OrderListService {

	private ConnectionFactory factory;

	public OrderListService() {
		factory = ConnectionFactory.getConnection();
	}

	// 구매 조회 메소드
	public ArrayList<OrderList> selectOrderList(String mId) {

		Connection conn = null;
		ArrayList<OrderList> list = null;

		try {
			conn = factory.createConnection();
			list = new OrderListDAO().selectOrderList(conn, mId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}

		return list;

	}

	//결제버튼클릭
	public int updateOrderList(String mId) {

		Connection conn = null;
		int result = 0;

		try {
			conn = factory.createConnection();
			result = new OrderListDAO().updateOrderList(conn, mId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}

		return result;

	}
	
	public OrderList selectOrderListCompleted(int buyNo) {
		
		Connection conn = null;
		OrderList list = null;

		try {
			conn = factory.createConnection();
			list = new OrderListDAO().selectOrderListCompleted(conn, buyNo);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}

		return list;
		
		}
	
	public int InsertproductDetailpay(int prdAmount,int prdNo,String mId) {
		
		int orderList=0;
		Connection conn=null;
		
		try {
			conn=factory.createConnection();
			orderList=new OrderListDAO().InsertproductDetailpay(prdAmount,prdNo,mId,conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			factory.close(conn);
		}	
		if (orderList > 0) {
			factory.commit(conn);
		} else {
			factory.rollback(conn);
		}
		
		

		return orderList;
		
	}


	
	public int addBasketList(int prdAmount,int prdNo,String mId) {
		int result=0;
		Connection conn=null;
		
		try {
			conn=factory.createConnection();
			result=new OrderListDAO().addBasketList(prdAmount,prdNo,mId,conn);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			factory.close(conn);
		}		
		if (result > 0) {
			factory.commit(conn);
		} else {
			factory.rollback(conn);
		}
		
		
		
		
		return result;
	}
	
	
	// 장바구니 조회 메소드
	public ArrayList<OrderList> selectBasket(String mId){
		
		Connection conn = null;
		ArrayList<OrderList> list = null;

		try {
			conn = factory.createConnection();
			list = new OrderListDAO().selectBasket(conn, mId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}

		return list;
	
	}
	
	public ArrayList<OrderList> myOrderList(String mId){
		Connection conn = null;
		ArrayList<OrderList> list = null;

		try {
			conn = factory.createConnection();
			list = new OrderListDAO().myOrderList(conn, mId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}

		return list;
		
	}
	
	
	// 장바구니에 있는 상품 삭제 메소드
	public int deleteBasket(int buyNo){
		int result=0;
		Connection conn=null;
		
		try {
			conn=factory.createConnection();
			result=new OrderListDAO().deleteBasket(conn, buyNo);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			factory.close(conn);
		}
		
		if (result > 0) {
			factory.commit(conn);
		} else {
			factory.rollback(conn);
		}
		
		return result;
	}

	// 장바구니에서 선택된 물품들 구매버튼 클릭
		public int updateBasket(int buyNo) {
			
			int result=0;
			Connection conn=null;
			
			try {
				conn=factory.createConnection();
				result=new OrderListDAO().updateBasket(conn, buyNo);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				factory.close(conn);
			}
			
			if (result > 0) {
				factory.commit(conn);
			} else {
				factory.rollback(conn);
			}
			
			return result;
			
		}

	public OrderList selectMemberCheck(int prdNo,String mId) {
		Connection conn=null;
		OrderList orList=null;
		
		try {
			conn=factory.createConnection();
			orList=new OrderListDAO().selectMemberCheck(conn,prdNo,mId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		
		return orList;
	}
	
}

