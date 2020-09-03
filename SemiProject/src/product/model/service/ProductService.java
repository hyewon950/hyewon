package product.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import common.ConnectionFactory;
import product.model.dao.ProductDAO;
import product.model.vo.Product;
import product.model.vo.ProductPageData;

public class ProductService {
	ConnectionFactory factory;

	public ProductService() {
		factory = ConnectionFactory.getConnection();
	}
			
	public ProductPageData searchProduct(String prdClass, String searchOption, String searchKey, int searchKey1, int searchKey2, int currentPage/*재배지역*/) {
		//select * from product where (price between ? and ?) and pname in (?) plocation in (?)
		// 상품 검색해서 상품리스트 페이지 나오는 메소드
		Connection conn = null;
		int recordCountPerPage = 8;
		int naviCountPerPage = 5;
		ProductPageData ProductPageData = null;
		
		try {
			conn = factory.createConnection();
			ProductPageData = new ProductPageData();
			ProductPageData.setPageList(new ProductDAO().getSearchPage(conn, prdClass, searchOption, searchKey, searchKey1, searchKey2, currentPage, recordCountPerPage));
			ProductPageData.setPageNavi(new ProductDAO().getSearchNavi(conn, prdClass, searchOption, searchKey, searchKey1, searchKey2, currentPage, recordCountPerPage, naviCountPerPage));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		return ProductPageData;
	}
	
	
	/*public int insertBasket(Product product) {
		// 상품 상세페이지에서 장바구니로 넘기는 메소드
		
	}*/
	
	/*public int insertOrderList(Product product) {
		// 상품 상세페이지에서 결제화면으로 넘기는 메소드
		
	}*/
}
