package sale.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import product.model.vo.Product;
import sale.model.vo.Sale;
import sale.model.vo.SaleDetailPage;
import sale.model.vo.SalePageData;

public class SaleDAO {
   
   public SaleDetailPage selectProductOne(Connection conn,int saleNo) {
      PreparedStatement pstmt =null;
      ResultSet rset=null;
      SaleDetailPage salepage=null;
      String query= "SELECT \r\n" + 
            "SALE_SUBJECT,\r\n" + 
            "SALE_CONTENT,\r\n" + 
            "SALE_VIEW,\r\n" +    //0603 다은 추가
            "SALE_REGDATE,\r\n" + 
            "SALE_IMG_NAME,\r\n" + 
            "SALE.BM_SELLERNO,\r\n" + 
            "PRD_BRAND,\r\n" + 
            "PRD_CLASS,\r\n" + 
            "PRD_PRICE,\r\n" + 
            "PRD_AREA,\r\n" + 
            "PRD_NO\r\n" + 
            "FROM SALE LEFT JOIN SALE_IMAGE  USING(SALE_NO) JOIN PRODUCT USING(SALE_NO)\r\n" + 
            "WHERE SALE_NO=?";
            
      try {
         pstmt=conn.prepareStatement(query);
         pstmt.setInt(1,saleNo);
         rset=pstmt.executeQuery();
         while(rset.next()) {
            salepage=new SaleDetailPage();
            
            salepage.setSaleSubject(rset.getString("SALE_SUBJECT"));
            salepage.setSaleContent(rset.getString("SALE_CONTENT"));
            salepage.setSaleView(rset.getInt("SALE_VIEW"));      //0603 다은 추가
            salepage.setSaleRegDate(rset.getDate("SALE_REGDATE"));
            salepage.setSaleImgName(rset.getString("SALE_IMG_NAME"));
            salepage.setBmSellerNo(rset.getInt("BM_SELLERNO"));
            salepage.setPrdBrand(rset.getString("PRD_BRAND"));
            salepage.setPrdClass(rset.getString("PRD_CLASS"));
            salepage.setPrdPrice(rset.getInt("PRD_PRICE"));
            salepage.setPrdArea(rset.getString("PRD_AREA"));
            salepage.setPrdNo(rset.getInt("PRD_NO"));
            salepage.setSaleNo(saleNo);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }   
      return salepage;
   }
   
   public ArrayList<Sale> recentSale(Connection conn){
      //select * from (select row_number() over(order by saleRegdate) as row_no from sale) where row_no between 1 and 3;
      //메인페이지에서 최근 입고 상품 보여주는 메소드 
      Statement stmt = null;
      ResultSet rset = null;
      ArrayList<Sale> saleList = null;
      saleList = new ArrayList<Sale>();
      String query = "select * from(select s.*, row_number() over (order by s.sale_no desc) as num, p.prd_class from sale s left join product p on (s.sale_no=p.sale_no)) where num between 1 and 3";
      
      try {
         stmt = conn.createStatement();
         rset = stmt.executeQuery(query);
         while(rset.next()) {
            Sale sale = new Sale();
            sale.setSaleSubject(rset.getString("SALE_SUBJECT"));
            sale.setPrdClass(rset.getString("PRD_CLASS"));
            sale.setSaleNo(rset.getInt("SALE_NO"));
            saleList.add(sale);
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
      return saleList;
   }

   public int updateSaleView(Connection conn, int saleNo) {
      // 상품 조회수
      SaleDetailPage salepage=null;
      PreparedStatement pstmt = null;
      String query = "UPDATE SALE SET SALE_VIEW = SALE_VIEW + 1 WHERE SALE_NO = ?";
      int result = 0;
      
      try {
         salepage = new SaleDetailPage();
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, saleNo);
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         try {
            pstmt.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      return result;
   } 
   
   
   public ArrayList<Sale> bestSaleList(Connection conn, String prdClass) {
      // 각각의 농산물 카데고리에서 조회수 베스트 상품 3개 보여주는 메소드
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<Sale> saleList = null;
      saleList = new ArrayList<Sale>();
      String query = "";
      if(prdClass == null) {
         query = "SELECT * FROM(SELECT S.*, i.sale_img_name FROM SALE S left join SALE_IMAGE I on (I.sale_no = S.sale_no) ORDER BY S.SALE_VIEW DESC) WHERE ROWNUM<4";
      }else {
         query = "SELECT * FROM(SELECT S.*, p.prd_price, p.prd_class, p.prd_name, i.sale_img_name FROM SALE S left join PRODUCT  P on (P.sale_no = S.sale_no) join SALE_IMAGE I on(I.sale_no = S.sale_no) ORDER BY S.SALE_VIEW DESC) WHERE PRD_CLASS=? AND ROWNUM<4";
      }
      
      try {
         if(prdClass == null) {
            pstmt = conn.prepareStatement(query);
         }else {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, prdClass);
         }
         rset = pstmt.executeQuery();
         while(rset.next()) {
            Sale sale = new Sale();
            if(prdClass != null) {
            sale.setPrdName(rset.getString("PRD_NAME"));
            sale.setPrdClass(rset.getString("PRD_CLASS"));
            sale.setPrdPrice(rset.getInt("PRD_PRICE"));
            }
            sale.setSaleNo(rset.getInt("SALE_NO"));
            sale.setBmSellerNo(rset.getInt("BM_SELLERNO"));
            sale.setSaleId(rset.getString("SALE_ID"));
            sale.setSaleSubject(rset.getString("SALE_SUBJECT"));
            sale.setSalecontent(rset.getString("SALE_CONTENT"));
            sale.setSaleView(rset.getInt("SALE_VIEW"));
            sale.setSaleRecommend(rset.getInt("SALE_RECOMMEND"));
            sale.setSaleRegDate(rset.getDate("SALE_REGDATE"));
            sale.setSaleImgName(rset.getString("SALE_IMG_NAME"));
            System.out.println(sale.getPrdName());
            saleList.add(sale);
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
      return saleList;
   }

   
   public ArrayList<Sale> selectSaleList(Connection conn, String prdClass, int currentPage, int recordCountPerPage) {
      // 농산물 페이지 들어가면 상품들 보여주는 메소드
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<Sale> sList = new ArrayList<Sale>();
      String query;
      if(prdClass == null) {
         query = "SELECT T.* FROM (( SELECT  S.*, p.prd_class, p.prd_name, p.prd_price, i.sale_img_name, ROW_NUMBER() OVER(ORDER BY S.SALE_NO DESC) AS NUM FROM SALE S left join PRODUCT P on (P.sale_no = S.sale_no) join SALE_IMAGE I on(I.sale_no = S.sale_no))T) WHERE NUM BETWEEN ? AND ?";
      }else {
         query = "SELECT T.* FROM (( SELECT  S.*, p.prd_class, p.prd_name, p.prd_price, i.sale_img_name, ROW_NUMBER() OVER(ORDER BY S.SALE_NO DESC) AS NUM FROM SALE S left join PRODUCT P on (P.sale_no = S.sale_no) join SALE_IMAGE I on(I.sale_no = S.sale_no) WHERE P.PRD_CLASS = ?)T) WHERE NUM BETWEEN ? AND ?";
      }
      int start = currentPage*recordCountPerPage - (recordCountPerPage-1);
      int end = currentPage*recordCountPerPage;
   
      try {
         pstmt = conn.prepareStatement(query);
         if(prdClass == null) {
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
         }else {
            pstmt.setString(1, prdClass);
            pstmt.setInt(2, start);
            pstmt.setInt(3, end);
         }
         rset = pstmt.executeQuery();
         while(rset.next()) {
            Sale sale = new Sale();
            sale.setPrdName(rset.getString("PRD_NAME"));
            sale.setPrdClass(rset.getString("PRD_CLASS"));
            sale.setPrdPrice(rset.getInt("PRD_PRICE"));
            sale.setSaleNo(rset.getInt("SALE_NO"));
            sale.setBmSellerNo(rset.getInt("BM_SELLERNO"));
            sale.setSaleId(rset.getString("SALE_ID"));
            sale.setSaleSubject(rset.getString("SALE_SUBJECT"));
            sale.setSalecontent(rset.getString("SALE_CONTENT"));
            sale.setSaleView(rset.getInt("SALE_VIEW"));
            sale.setSaleRecommend(rset.getInt("SALE_RECOMMEND"));
            sale.setSaleRegDate(rset.getDate("SALE_REGDATE"));
            sale.setSaleImgName(rset.getString("SALE_IMG_NAME"));
            System.out.println(sale.getPrdName());
            sList.add(sale);
         }         
      } catch (SQLException e) {
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
      System.out.println(sList.size()+"DAO");
      return sList;
   }
   
   
   public int totalCount(Connection conn, String prdClass) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      int recordTotalCount = 0;
      String query;
      if(prdClass == null) {
         query = "SELECT COUNT(*) AS TOTALCOUNT FROM SALE LEFT JOIN PRODUCT USING(SALE_NO)";
      } else {
         query = "SELECT COUNT(*) AS TOTALCOUNT FROM SALE LEFT JOIN PRODUCT USING(SALE_NO) WHERE PRD_CLASS = ?";
      }
      //게시글 총 갯수를 알아오는 쿼리
      
      try {
         if(prdClass == null) {
            pstmt = conn.prepareStatement(query);
            rset = pstmt.executeQuery();
         }else {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, prdClass);;
            rset = pstmt.executeQuery();
         }
         if(rset.next()) {
            recordTotalCount = rset.getInt("TOTALCOUNT");
            }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return recordTotalCount;
   }
   
   public String getPageNavigation(Connection conn, String prdClass, int currentPage, int recordCountPerPage, int naviCountPerPage) {
      int recordTotalCount = totalCount(conn, prdClass);
      int pageTotalCount = 0; //전체 페이지의 개수
      //전체 게시물 갯수: 124개 10개씩 페이지를 만들면 페이지 갯수는 13개
      
      //만들 전체 페이지의 갯수
      if(recordTotalCount % recordCountPerPage > 0) {
         pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;
      } else {
         pageTotalCount = recordTotalCount / recordCountPerPage;
      }
      
      // 현재 페이지를 기준으로 네비게이션을 구해야하므로 현재 페이지 정보를 확인해서 0보다는 크고 전체 페이지 수보다는 작은 위치에 있는지 확인
      //(오류방지용)
      if(currentPage < 1) {
         currentPage = 1;
      }else if(currentPage > pageTotalCount) {
         currentPage = pageTotalCount;
      }
      
      // 6 7 8 9 10
      int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
      //currentPage = 8, naviCountPerPage = 5;
      //((8-1)/5)*5+1 -> 6
      // 41 42 43 44 45
      //currentPage = 42, naviCountPerPage = 5;
      //((42-1)/5)*5+1 -> 41
      int endNavi = startNavi + naviCountPerPage - 1;
      
      // 오류방지
      if(endNavi > pageTotalCount) {
         endNavi = pageTotalCount;
      }
      
      //<1 2 3 4 5>
      //'<' 모양과 '>' 모양을 준비하기 위해 필요한 변수
      boolean needPrev = true;
      boolean needNext = true;
      
      if(startNavi == 1) {
         needPrev = false;
      }
      if(endNavi == pageTotalCount) {
         needNext = false;
      }
      // 준비 완료
      StringBuilder sb = new StringBuilder();
      if(prdClass == null) {
         if(needPrev) {
            sb.append("<li class='page-item'><a class='page-link' href='/productMain?currentPage="+(startNavi-1)+"'>Previous</a></li>");
         }
         for(int i = startNavi; i<=endNavi; i++) {
            if(i==currentPage) {
               sb.append("<li class='page-item'><a class='page-link' href='/productMain?currentPage="+i+"'><b>"+i+"</b></a></li>");
            }else {
               sb.append("<li class='page-item'><a class='page-link' href='/productMain?currentPage="+i+"'>"+i+"</a></li>");
            }
         }
         if(needNext) {
            sb.append("<li class='page-item'><a class='page-link' href='/productMain?currentPage="+(endNavi+1)+"'>Next</a></li>");
         }
      }else {
         if(needPrev) {
            sb.append("<li class='page-item'><a class='page-link' href='/productMain?prdClass="+prdClass+"&currentPage="+(startNavi-1)+"'>Previous</a></li>");
         }
         for(int i = startNavi; i<=endNavi; i++) {
            if(i==currentPage) {
               sb.append("<li class='page-item'><a class='page-link' href='/productMain?prdClass="+prdClass+"&currentPage="+i+"'><b>"+i+"</b></a></li>");
            }else {
               sb.append("<li class='page-item'><a class='page-link' href='/productMain?prdClass="+prdClass+"&currentPage="+i+"'>"+i+"</a></li>");
            }
         }
         if(needNext) {
            sb.append("<li class='page-item'><a class='page-link' href='/productMain?prdclass="+prdClass+"&currentPage="+(endNavi+1)+"'>Next</a></li>");
         }
      }
      return sb.toString();
   }


   
}