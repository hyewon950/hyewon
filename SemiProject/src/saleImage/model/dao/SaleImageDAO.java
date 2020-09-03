package saleImage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import sale.model.vo.Sale;
import saleImage.model.vo.SaleImage;

public class SaleImageDAO {

	public ArrayList<SaleImage> showSaleImage(Connection conn, int saleNo) {
		// 판매게시글 이미지 보여주는 메소드
		ArrayList<SaleImage> sList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from sale_image where sale_no = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, saleNo);
			rset = pstmt.executeQuery();
			sList = new ArrayList<SaleImage>();
			while (rset.next()) {
				SaleImage saleImage = new SaleImage();
				saleImage.setSaleImgNo(rset.getInt("SALE_IMG_NO"));
				saleImage.setSaleNo(rset.getInt("SALE_NO"));
				saleImage.setBmSellerNo(rset.getInt("BM_SELLERNO"));
				saleImage.setSaleImgName(rset.getString("SALE_IMG_NAME"));
				saleImage.setSaleImgPath(rset.getString("SALE_IMG_PATH"));
				saleImage.setSaleImgSize(rset.getInt("SALE_IMG_SIZE"));
				saleImage.setSaleImgUser(rset.getString("SALE_IMG_USER"));
				// saleImage.setSaleUpload(rset.getTimestamp("SALE_UPLOAD"));
				sList.add(saleImage);
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
		return sList;
	}

	public ArrayList<SaleImage> showBestSaleImage(Connection conn, String prdClass, ArrayList<Sale> sale) {
		ArrayList<SaleImage> sList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query;
		if(prdClass == null) {
			query = "select * from (select sale_view,prd_class,prd_name,I.*, row_number() over(order by sale_view desc) as num from sale_image I left join product P on (I.sale_no = P.sale_no) left join sale S on (P.sale_no = S.sale_no)) where num<4";
		}else {
			query = "select * from (select sale_view,prd_class,prd_name,I.*, row_number() over(order by sale_view desc) as num from sale_image I left join product P on (I.sale_no = P.sale_no) left join sale S on (P.sale_no = S.sale_no)where prd_class = ?) where num<4";
		}
		try {
			pstmt = conn.prepareStatement(query);
			if(prdClass != null) {
			pstmt.setString(1, sale.get(0).getPrdClass());
			}
			rset = pstmt.executeQuery();
			sList = new ArrayList<SaleImage>();
			while(rset.next()) {
				SaleImage saleImage = new SaleImage();
				saleImage.setSaleImgNo(rset.getInt("SALE_IMG_NO"));
				saleImage.setSaleNo(rset.getInt("SALE_NO"));
				saleImage.setBmSellerNo(rset.getInt("BM_SELLERNO"));
				saleImage.setSaleImgName(rset.getString("SALE_IMG_NAME"));
				saleImage.setSaleImgPath(rset.getString("SALE_IMG_PATH"));
				saleImage.setSaleImgSize(rset.getInt("SALE_IMG_SIZE"));
				saleImage.setSaleImgUser(rset.getString("SALE_IMG_USER"));
				saleImage.setPrdName(rset.getString("PRD_NAME"));
				saleImage.setPrdClass(rset.getString("PRD_CLASS"));
				saleImage.setSaleView(rset.getInt("SALE_VIEW"));
				// saleImage.setSaleUpload(rset.getTimestamp("SALE_UPLOAD"));
				sList.add(saleImage);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return sList;
	}

	public ArrayList<SaleImage> saleNewImage(Connection conn, ArrayList<Sale> recentSale) {
		ArrayList<SaleImage> sList = null;
		sList = new ArrayList<SaleImage>();
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select * from sale_image where sale_no in (select sale_no from (select sale.*, row_number() over(order by sale_no desc) as row_no from sale) where row_no between 1 and 3)";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				SaleImage saleImage = new SaleImage();
				saleImage.setSaleImgNo(rset.getInt("SALE_IMG_NO"));
				saleImage.setSaleNo(rset.getInt("SALE_NO"));
				saleImage.setBmSellerNo(rset.getInt("BM_SELLERNO"));
				saleImage.setSaleImgName(rset.getString("SALE_IMG_NAME"));
				saleImage.setSaleImgPath(rset.getString("SALE_IMG_PATH"));
				saleImage.setSaleImgSize(rset.getInt("SALE_IMG_SIZE"));
				saleImage.setSaleImgUser(rset.getString("SALE_IMG_USER"));
				// saleImage.setSaleUpload(rset.getTimestamp("SALE_UPLOAD"));
				sList.add(saleImage);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				rset.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sList;
	}
	
}