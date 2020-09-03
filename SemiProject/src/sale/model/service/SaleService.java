package sale.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectionFactory;
import questAnswer.model.dao.QuestAnswerDAO;
import questAnswer.model.vo.QnaPageData;
import questAnswer.model.vo.QuestAnswer;
import sale.model.vo.SalePageData;
import sale.model.dao.SaleDAO;
import sale.model.vo.Sale;
import sale.model.vo.SaleDetailPage;

public class SaleService {
	
	private ConnectionFactory factory;
	public SaleService() {
		factory = ConnectionFactory.getConnection();
	}

	//상품을 클릭하면 상세페이지를 출력하는 메소드
	
	public SaleDetailPage selectProductOne(int saleNo) {
		Connection conn=null;
		SaleDetailPage salepage=null;
		int result = 0; //0603 다은

		try {
			conn=factory.createConnection();
			result =  new SaleDAO().updateSaleView(conn, saleNo);
			if(result>0) {
				salepage=new SaleDAO().selectProductOne(conn,saleNo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.commit(conn);
			factory.close(conn);
		}
		return salepage;
		
	}
	
	public ArrayList<Sale> recentSale(){
		//select * from (select row_number() over(order by saleRegdate) as row_no from sale) where row_no between 1 and 3;
		Connection conn = null;
		ArrayList<Sale> list = null; 
		try {
			conn = factory.createConnection();
			list = new SaleDAO().recentSale(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		return list;
	}
	
	public ArrayList<Sale> bestSaleList(String prdClass){
		// 각각의 농산물 카데고리에서 조회수 베스트 상품 3개 보여주는 메소드
		Connection conn = null;
		ArrayList<Sale> result = null;
		try {
			conn = factory.createConnection();
			result = new SaleDAO().bestSaleList(conn, prdClass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		return result;
	}

	public SalePageData selectSaleList(String prdClass, int currentPage) {
		// 농산물 페이지 들어가면 상품들 보여주는 메소드
		Connection conn = null;
		int recordCountPerPage = 8;
		int naviCountPerPage = 5;
		SalePageData salePageData = new SalePageData();
		ArrayList<Sale> saleList = null;
		
		try {
			conn = factory.createConnection();
			saleList = new SaleDAO().selectSaleList(conn, prdClass, currentPage, recordCountPerPage);
			salePageData.setPageList(saleList);
			salePageData.setPageNavi(new SaleDAO().getPageNavigation(conn, prdClass, currentPage, recordCountPerPage, naviCountPerPage));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		return  salePageData;
	}

}

