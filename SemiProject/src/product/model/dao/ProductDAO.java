package product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.management.Query;

import product.model.vo.Product;
/*import sale.model.vo.Sale;*/

public class ProductDAO {

   
   public ArrayList<Product> getSearchPage(Connection conn, String prdClass, String searchOption, String searchKey, int searchKey1, int searchKey2, int currentPage, int recordCountPerPage) {
      ArrayList<Product> list = new ArrayList<Product>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = null;
      
      if(!(searchOption.equals("productPrice"))) {
         if(!searchKey.contains("%")) {
            String keyValue = "%";
            searchKey = keyValue.concat(searchKey.concat(keyValue));
         }
      }
      
      if(prdClass == null) {
      if(searchOption.equals("productName")){
         query = "SELECT S.sale_subject as sale_subject, I.sale_img_name as sale_img_name, P.* FROM (( SELECT  PRODUCT.* , ROW_NUMBER() OVER(ORDER BY SALE_NO DESC) AS NUM FROM PRODUCT WHERE PRD_NAME LIKE ?)P) left join SALE  S on (P.sale_no = S.sale_no) join SALE_IMAGE I on(I.sale_no = S.sale_no) WHERE NUM BETWEEN ? AND ?";
      }else if(searchOption.equals("productPlace")) {
         query = "SELECT S.sale_subject as sale_subject, I.sale_img_name as sale_img_name, P.* FROM (( SELECT  PRODUCT.* , ROW_NUMBER() OVER(ORDER BY SALE_NO DESC) AS NUM FROM PRODUCT WHERE PRD_AREA LIKE ?)P) left join SALE  S on (P.sale_no = S.sale_no) join SALE_IMAGE I on(I.sale_no = S.sale_no) WHERE NUM BETWEEN ? AND ?";
      }else if(searchOption.equals("productPrice")) {
         query = "SELECT S.sale_subject as sale_subject, I.sale_img_name as sale_img_name, P.* FROM (( SELECT  PRODUCT.* , ROW_NUMBER() OVER(ORDER BY SALE_NO DESC) AS NUM FROM PRODUCT WHERE PRD_PRICE BETWEEN ? AND ?)P) left join SALE  S on (P.sale_no = S.sale_no) join SALE_IMAGE I on(I.sale_no = S.sale_no) WHERE NUM BETWEEN ? AND ?";
      }
   }else {
      if(searchOption.equals("productName")){
         query = "SELECT S.sale_subject as sale_subject, I.sale_img_name as sale_img_name, P.* FROM (( SELECT  PRODUCT.* , ROW_NUMBER() OVER(ORDER BY SALE_NO DESC) AS NUM FROM PRODUCT WHERE PRD_CLASS = ? AND PRD_NAME LIKE ?)P) left join SALE  S on (P.sale_no = S.sale_no) join SALE_IMAGE I on(I.sale_no = S.sale_no) WHERE NUM BETWEEN ? AND ?";
      }else if(searchOption.equals("productPlace")) {
         query = "SELECT S.sale_subject as sale_subject, I.sale_img_name as sale_img_name, P.* FROM (( SELECT  PRODUCT.* , ROW_NUMBER() OVER(ORDER BY SALE_NO DESC) AS NUM FROM PRODUCT WHERE PRD_CLASS = ? AND PRD_AREA LIKE ?)P) left join SALE  S on (P.sale_no = S.sale_no) join SALE_IMAGE I on(I.sale_no = S.sale_no) WHERE NUM BETWEEN ? AND ?";
      }else if(searchOption.equals("productPrice")) {
         query = "SELECT S.sale_subject as sale_subject, I.sale_img_name as sale_img_name, P.* FROM (( SELECT  PRODUCT.* , ROW_NUMBER() OVER(ORDER BY SALE_NO DESC) AS NUM FROM PRODUCT WHERE PRD_CLASS = ? AND PRD_PRICE BETWEEN ? AND ?)P) left join SALE  S on (P.sale_no = S.sale_no) join SALE_IMAGE I on(I.sale_no = S.sale_no) WHERE NUM BETWEEN ? AND ?";
      }
   }   

      int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
      int end = currentPage * recordCountPerPage;

      try {
         if(prdClass == null) {
            pstmt = conn.prepareStatement(query);
            if(searchOption.equals("productPrice")) {
               pstmt.setInt(1, searchKey1);
               pstmt.setInt(2, searchKey2);
               pstmt.setInt(3, start);
               pstmt.setInt(4, end);
            } else {
               pstmt.setString(1, searchKey);
               pstmt.setInt(2, start);
               pstmt.setInt(3, end);
            }
         }else {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1,  prdClass);
            if(searchOption.equals("productPrice")) {
               pstmt.setInt(2, searchKey1);
               pstmt.setInt(3, searchKey2);
               pstmt.setInt(4, start);
               pstmt.setInt(5, end);
            } else {
               pstmt.setString(2, searchKey);
               pstmt.setInt(3, start);
               pstmt.setInt(4, end);
            }
         }
         rset = pstmt.executeQuery();
         while (rset.next()) {
            Product product = new Product();
            product.setPrdNo(rset.getInt("PRD_NO"));
            product.setSaleNo(rset.getInt("SALE_NO"));
            product.setBmSellerNo(rset.getInt("BM_SELLERNO"));
            product.setPrdBrand(rset.getString("PRD_BRAND"));
            product.setPrdName(rset.getString("PRD_NAME"));
            product.setPrdClass(rset.getString("PRD_CLASS"));
            product.setPrdPrice(rset.getInt("PRD_PRICE"));
            product.setPrdAmount(rset.getInt("PRD_AMOUNT"));
            product.setPrdArea(rset.getString("PRD_AREA"));
            product.setSaleSubject(rset.getString("SALE_SUBJECT"));
            product.setSaleImgName(rset.getString("SALE_IMG_NAME")); // 얘가 안 불러와짐
            list.add(product);
         }
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
      System.out.println(list.size()+"DAO"); 
      return list;
   }
   
   
   public String getSearchNavi(Connection conn, String prdClass, String searchOption, String searchKey, int searchKey1, int searchKey2, int currentPage, int recordCountPerPage, int naviCountPerPage) {
      int recordTotalCount = searchTotalCount(conn, prdClass, searchOption, searchKey, searchKey1, searchKey2);
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
   
   
   public int searchTotalCount(Connection conn, String prdClass, String searchOption, String searchKey, int searchKey1, int searchKey2) {
      // return recordTotalCount ->검색한 상품의 갯수를 반환해야함
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      int recordTotalCount = 0;
      String query = null;
      
      if(!(searchOption.equals("productPrice"))) {
         if(!searchKey.contains("%")) {
            String keyValue = "%";
            searchKey = keyValue.concat(searchKey.concat(keyValue));
         }
      }
      
      if(prdClass == null) {
         if(searchOption.equals("productName")){
            query = "SELECT COUNT(*) AS TOTALCOUNT FROM PRODUCT WHERE PRD_NAME LIKE ? ";
         }else if(searchOption.equals("productPlace")) {
            query = "SELECT COUNT(*) AS TOTALCOUNT FROM PRODUCT WHERE PRD_AREA LIKE ? ";
         }else if(searchOption.equals("productPrice")) {
            query = "SELECT COUNT(*) AS TOTALCOUNT FROM PRODUCT WHERE PRD_PRICE BETWEEN ? AND ? ";
         }
      }else {
         if(searchOption.equals("productName")){
            query = "SELECT COUNT(*) AS TOTALCOUNT FROM PRODUCT WHERE PRD_CLASS = ? AND PRD_NAME LIKE ? ";
         }else if(searchOption.equals("productPlace")) {
            query = "SELECT COUNT(*) AS TOTALCOUNT FROM PRODUCT WHERE PRD_CLASS = ? AND PRD_AREA LIKE ? ";
         }else if(searchOption.equals("productPrice")) {
            query = "SELECT COUNT(*) AS TOTALCOUNT FROM PRODUCT WHERE PRD_CLASS = ? AND PRD_PRICE BETWEEN ? AND ? ";
         }
      }

      try {
         if(prdClass == null) {
            pstmt = conn.prepareStatement(query);
            if(searchOption.equals("productPrice")) {
               pstmt.setInt(1, searchKey1);
               pstmt.setInt(2, searchKey2);
               rset = pstmt.executeQuery();
            } else {
               pstmt.setString(1, searchKey);
               rset = pstmt.executeQuery();
            }
         }else {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, prdClass);
            if(searchOption.equals("productPrice")) {
               pstmt.setInt(2, searchKey1);
               pstmt.setInt(3, searchKey2);
               rset = pstmt.executeQuery();
            } else {
               pstmt.setString(2, searchKey);
               rset = pstmt.executeQuery();
            }
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
   
   
   /*
    * public int insertBasket(Product product) { 
    * // 상품을 장바구니에 추가
    * }
    * 
    * public int insertOrderList(Product product) { 
    * // 구매목록에 상품을 추가
    * }
    */
}