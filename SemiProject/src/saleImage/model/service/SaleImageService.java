package saleImage.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectionFactory;
import sale.model.vo.Sale;
import saleImage.model.dao.SaleImageDAO;
import saleImage.model.vo.SaleImage;

public class SaleImageService {
	ConnectionFactory factory;
	
	public SaleImageService() {
		factory = ConnectionFactory.getConnection();
	}

	public ArrayList<SaleImage> showSaleImage(int saleNo) {
		// 판매게시글 이미지 보여주는 메소드
		 ArrayList<SaleImage> sImage = null;
		 Connection conn = null;
		 
		 try {
			conn = factory.createConnection();
			sImage = new SaleImageDAO().showSaleImage(conn, saleNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return sImage;
	}
	
	
	public ArrayList<SaleImage> showBestSaleImage(String prdClass, ArrayList<Sale>sale){
		 ArrayList<SaleImage> list = null;
		Connection conn =  null;
		
		try {
			conn = factory.createConnection();
			list = new SaleImageDAO().showBestSaleImage(conn, prdClass, sale);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		return list;
	}

	public ArrayList<SaleImage> saleNewImage(ArrayList<Sale> recentSale) {
		ArrayList<SaleImage> list = null;
		Connection conn = null;
		
		try {
			conn = factory.createConnection();
			list = new SaleImageDAO().saleNewImage(conn, recentSale);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		return list;
	}
	
	
	
	
}
