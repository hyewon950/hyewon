package orderList.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import orderList.model.vo.OrderList;

public class OrderListDAO {

	// 구매 조회 메소드(장바구니 = Y / 구매 = N )
	public ArrayList<OrderList> selectOrderList(Connection conn, String mId) {

		ArrayList<OrderList> list = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select buy_no,prd_name, prd_brand, buy_amount,prd_price,product.PRD_PRICE*ORDERLIST.BUY_AMOUNT ,SALE_IMAGE.SALE_IMG_NAME from product join ORDERLIST using(prd_no) join SALE_IMAGE on(product.SALE_NO = SALE_IMAGE.sale_no ) where M_ID=? and ORDERLIST.BUY_CHECK='N' and ORDERLIST.BUY_BASKET='Y'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mId);
			rset = pstmt.executeQuery();

			list = new ArrayList<OrderList>();

			while (rset.next()) {
				OrderList order = new OrderList();
				order.setBuyNo(rset.getInt("buy_no"));
				// order.setPrdNo(rset.getInt("prd_no"));
				// order.setmId(rset.getString("m_id"));
				order.setBuyAmount(rset.getInt("buy_amount"));
				// order.setBuyCheck(rset.getString("buy_check"));
				// order.setBuyBasket(rset.getString("buy_basket"));
				// order.setBuyDate(rset.getDate("buy_date"));
				order.setPrdName(rset.getString("prd_name"));
				order.setPrdBrand(rset.getString("prd_brand"));
				order.setPrdPrice(rset.getInt("prd_price"));
				order.setSumPrice(rset.getInt("product.PRD_PRICE*ORDERLIST.BUY_AMOUNT"));
				order.setImgName(rset.getString("SALE_IMG_NAME"));
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}

	// 결제 버튼 클릭시
	public int updateOrderList(Connection conn, String mId) {

		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE ORDERLIST SET BUY_CHECK='Y',BUY_BASKET='Y',BUY_DATE=sysdate WHERE M_ID=? and BUY_CHECK='N' and BUY_BASKET='Y'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return result;
	}

	// 주문완료리스트출력
	public OrderList selectOrderListCompleted(Connection conn, int buyNo) {

		OrderList list = null;

		Statement stmt = null;
		ResultSet rset = null;

		String query = "select buy_no, prd_name, prd_brand,buy_amount,prd_price,product.PRD_PRICE*ORDERLIST.BUY_AMOUNT, SALE_IMAGE.SALE_IMG_NAME from product join ORDERLIST using(prd_no) join SALE_IMAGE on(product.SALE_NO = SALE_IMAGE.sale_no ) where buy_no= "
				+ buyNo;

		try {

			stmt = conn.createStatement();

			rset = stmt.executeQuery(query);

			while (rset.next()) {
				list = new OrderList();
				list.setBuyNo(rset.getInt("buy_no"));
				list.setBuyAmount(rset.getInt("buy_amount"));
				list.setPrdName(rset.getString("prd_name"));
				list.setPrdBrand(rset.getString("prd_brand"));
				list.setPrdPrice(rset.getInt("prd_price"));
				list.setSumPrice(rset.getInt("product.PRD_PRICE*ORDERLIST.BUY_AMOUNT"));
				list.setImgName(rset.getString("SALE_IMG_NAME"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}

	public int InsertproductDetailpay(int prdAmount, int prdNo, String mId, Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "INSERT INTO ORDERLIST VALUES(ORDERLIST_NO_SEQ.NEXTVAL,?,?,?,'N','Y',null)";
		// sysdate는 결제 완료시 sysdate처리 해야하기때문에 null값으로 넣었습니다.구매여부 no(결제전이기때문에)
		// 장바구니 여부는 바로구매시 'Y'로 처리!!!!!!!!!!!!!!!!!!!!!!
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, prdNo);
			pstmt.setString(2, mId);
			pstmt.setInt(3, prdAmount);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}

	public int addBasketList(int prdAmount, int prdNo, String mId, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO ORDERLIST VALUES(ORDERLIST_NO_SEQ.NEXTVAL,?,?,?,'N','N',SYSDATE)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, prdNo);
			pstmt.setString(2, mId);
			pstmt.setInt(3, prdAmount);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}


	// 장바구니에 있는 상품 삭제 메소드
	public int deleteBasket(Connection conn, int buyNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String query = "delete from ORDERLIST where BUY_NO=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, buyNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return result;
	}

	// 상품을 장바구니에 추가
	public int updateBasket(Connection conn, int buyNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update ORDERLIST set BUY_BASKET='Y' where BUY_NO=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, buyNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return result;

	}

	// 장바구니 조회 메소드
	   public ArrayList<OrderList> selectBasket(Connection conn, String mId) {

	      ArrayList<OrderList> list = null;

	      PreparedStatement pstmt = null;
	      ResultSet rset = null;

	      String query = "select buy_no,prd_name, prd_brand, buy_amount,prd_price,product.PRD_PRICE*ORDERLIST.BUY_AMOUNT ,SALE_IMAGE.SALE_IMG_NAME from product join ORDERLIST using(prd_no) join SALE_IMAGE on(product.SALE_NO = SALE_IMAGE.sale_no ) where M_ID=? and ORDERLIST.BUY_CHECK='N' and ORDERLIST.BUY_BASKET='N'";

	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, mId);
	         rset = pstmt.executeQuery();

	         list = new ArrayList<OrderList>();

	         while (rset.next()) {
	            OrderList order = new OrderList();
	            order.setBuyNo(rset.getInt("buy_no"));
	            // order.setPrdNo(rset.getInt("prd_no"));
	            // order.setmId(rset.getString("m_id"));
	            order.setBuyAmount(rset.getInt("buy_amount"));
	            // order.setBuyCheck(rset.getString("buy_check"));
	            // order.setBuyBasket(rset.getString("buy_basket"));
	            // order.setBuyDate(rset.getDate("buy_date"));
	            order.setPrdName(rset.getString("prd_name"));
	            order.setPrdBrand(rset.getString("prd_brand"));
	            order.setPrdPrice(rset.getInt("prd_price"));
	            order.setSumPrice(rset.getInt("product.PRD_PRICE*ORDERLIST.BUY_AMOUNT"));
	            order.setImgName(rset.getString("SALE_IMG_NAME"));
	            list.add(order);
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         try {
	            pstmt.close();
	            rset.close();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	      }

	      return list;
	   }
	public ArrayList<OrderList> myOrderList(Connection conn, String userId) {
		ArrayList<OrderList> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select s.sale_no,prd_name,prd_price,sale_img_name, o.buy_amount from orderlist o left join product p using (prd_no) left join sale s on (p.sale_no=s.sale_no) left join sale_image i on(s.sale_no = i.sale_no) where buy_check='Y' and m_id = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			list = new ArrayList<OrderList>();
			System.out.println("DAO");
			while (rset.next()) {
				System.out.println("DAO");
				OrderList orderList = new OrderList();
				orderList.setSaleNo(rset.getInt("sale_no"));
				orderList.setPrdName(rset.getString("prd_name"));
				orderList.setPrdPrice(rset.getInt("prd_price"));
				orderList.setImgName(rset.getString("sale_img_name"));
				orderList.setBuyAmount(rset.getInt("buy_amount"));
				list.add(orderList);
				System.out.println(list.get(0).getPrdName());
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public OrderList selectMemberCheck(Connection conn,int prdNo,String mId) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		OrderList oList=null;
		String query="SELECT * FROM ORDERLIST WHERE PRD_NO=? AND M_ID=? AND BUY_CHECK='Y'";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, prdNo);
			pstmt.setString(2, mId);
			rset=pstmt.executeQuery();
			while (rset.next()) {
				
				oList=new OrderList();
				oList.setBuyNo(rset.getInt("BUY_NO"));
				oList.setPrdNo(rset.getInt("PRD_NO"));
				oList.setmId(rset.getString("M_ID"));
				oList.setBuyAmount(rset.getInt("BUY_AMOUNT"));
				oList.setBuyCheck(rset.getString("BUY_CHECK"));
				oList.setBuyBasket(rset.getString("BUY_BASKET"));
				oList.setBuyDate(rset.getDate("BUY_DATE"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return oList;
		
		
		
	}
	
	
	
	
	
	
	
}

