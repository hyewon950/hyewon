package questAnswer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectionFactory;
import questAnswer.model.vo.QuestAnswer;
import sale.model.vo.SaleDetailPage;


public class QuestAnswerDAO {
   
	// Q&A 작성
   public int insertQuestAnswer(Connection conn, String qTitle, String qContents, String userId, int saleNo) {
      
	   int result = 0;
	   PreparedStatement pstmt = null;
	   String query = "insert into QNA values(QNA_NO_SEQ.NEXTVAL,?,?,?,?,'')";
	   
	   try {
		pstmt= conn.prepareStatement(query);
		pstmt.setString(1, userId );
		pstmt.setInt(2, saleNo);
		pstmt.setString(3, qTitle);
		pstmt.setString(4, qContents);
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		ConnectionFactory.close(pstmt);
	}
	   
	   return result;
   }
   
   public ArrayList<QuestAnswer> selectQnaList(Connection conn, int currentPage, int recordCountPerPage,int saleNo){
	   PreparedStatement pstmt=null;
	   ResultSet rset=null;
	   ArrayList<QuestAnswer> sList=new ArrayList<QuestAnswer>();
	   String query="SELECT * FROM ( SELECT QNA.*, ROW_NUMBER() OVER(ORDER BY QNA_NO DESC) AS NUM FROM QNA) WHERE NUM BETWEEN ? AND ? AND SALE_NO=?";
		int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
		int end = currentPage * recordCountPerPage;
	   
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setInt(3, saleNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				QuestAnswer qna =new QuestAnswer();
				qna.setmId(rset.getString("M_ID"));
				qna.setqAnswer(rset.getString("Q_ANSWER"));
				qna.setqContents(rset.getString("Q_CONTENTS"));
				qna.setQnaNo(rset.getInt("QNA_NO"));
				qna.setqTitle(rset.getString("Q_TITLE"));
				qna.setSaleNo(rset.getInt("SALE_NO"));
				sList.add(qna);
				
				
			}
			
			
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
	   return sList;
   }
   
   public int totalCount(Connection conn,int saleNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int recordTotalCount = 0;

		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM QNA WHERE SALE_NO=? ";
		// 게시글 총 갯수를 알아오는 쿼리

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, saleNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				recordTotalCount = rset.getInt("TOTALCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return recordTotalCount;
	}
   
	public String getPageNavigation(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage,int saleNo) {
		int recordTotalCount = totalCount(conn,saleNo);
		int pageTotalCount = 0; 

		if (recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// 6 7 8 9 10
		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder();
		if (needPrev) {
			sb.append("<li class='page-item'><a class='page-link' a href='/productDetail?currentPage="+(startNavi-1)+"&saleNo="+saleNo+"'>Previous</a></li>");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class='page-item'><a class='page-link' a href='/ptoductDetail?saleNo="+saleNo+"&currentPage="+i+"'><b>" + i + "</b></a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' a href='/productDetail?saleNo="+saleNo+"&currentPage="+i+"'>" + i + "</a></li>");
			}
		}
		if (needNext) {
			sb.append("<li class='page-item'><a class='page-link' a href='/productDetail?saleNo="+saleNo+"&currentPage="+(endNavi +1)+"'>Next</a></li>");
		}
		return sb.toString();
	}
	   
		
//
//		StringBuilder sb = new StringBuilder();
//		if (needPrev) {
//			sb.append("<a href='/productDetail?currentPage=" + (startNavi - 1) + "&saleNo="+saleNo+"'><</a>");
//		}
//		for (int i = startNavi; i <= endNavi; i++) {
//			if (i == currentPage) {
//				sb.append("<a href='/productDetail?saleNo="+saleNo+"&currentPage=" + i + "'><b>" + i + "</b></a>");
//			} else {
//				sb.append("<a href='/productDetail?saleNo="+saleNo+"&currentPage=" + i + "'>" + i + "</a>");
//			}
//		}
//		if (needNext) {
//			sb.append("<a href='/productDetail?saleNo="+saleNo+"&currentPage=" + (endNavi + 1) + "'>></a>");
//		}
//		return sb.toString();
//	}
//   
//   
   /*
	StringBuilder sb = new StringBuilder();
	if (needPrev) {
		sb.append("<li class='page-item'><a class='page-link' a href='/productDetail?currentPage="+(starNavi-1)+"&saleNo="+saleNo+"'>Previous</a></li>");
	}
	for (int i = startNavi; i <= endNavi; i++) {
		if (i == currentPage) {
			sb.append("<li class='page-item'><a class='page-link' a href='/ptoductDetail?saleNo="+saleNo+"&currentPage="+i+"'><b>" + i + "</b></a></li>");
		} else {
			sb.append("<li class='page-item'><a class='page-link' a href='/productDetail?saleNo="+saleNo+"&currentPage="+i+"'>" + i + "</a></li>");
		}
	}
	if (needNext) {
		sb.append("<li class='page-item'><a class='page-link' a href='/productDetail?saleNo="+saleNo+"&currentPage="+(endNavi +1)+"'>Next</a></li>");
	}
	return sb.toString();
}
   */
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
//   public ArrayList<QuestAnswer> printQusetAnswerList(Connection conn, int postNo) {
//      // Q&A리스트 출력
//      
//   }
}