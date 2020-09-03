package recipe.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import recipe.model.vo.Recipe;

public class RecipeDAO {
	public int getPostNo(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select max(post_no) as post_no from COMMUNITY where post_kinds = '레시피'";
		int result = 0;
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt("post_no");
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
		
		return result;
	}
	
	public int insertRecipe(Connection conn, Recipe recipe) {
		// 레시피 넣는 법
		PreparedStatement pstmt = null;
		int result = 0;
		int postNo = getPostNo(conn);
		String query = "INSERT INTO RECIPE VALUES(COOK_NO_SEQ.NEXTVAL,?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			pstmt.setInt(2, recipe.getCookSeq());
			pstmt.setString(3, recipe.getCookContents());
			
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
	public int insertRecipe(Connection conn, Recipe recipe, int postNo) {
		// 레시피 넣는 법
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println(postNo+"DAO");
		String query = "INSERT INTO RECIPE VALUES(COOK_NO_SEQ.NEXTVAL,?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			pstmt.setInt(2, recipe.getCookSeq());
			pstmt.setString(3, recipe.getCookContents());
			
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
	public int deleteRecipe(Connection conn, int postNo) {
		// 레시피 넣는 법
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from recipe where post_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
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
	public ArrayList<Recipe> selectRecipe(Connection conn, int postNo){
		ArrayList<Recipe> recipes = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from recipe where post_no = ? order by cook_stuff";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			recipes = new ArrayList<Recipe>();
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Recipe recipe = new Recipe();
				recipe.setCookContents(rset.getString("cook_step"));
				recipe.setCookNo(rset.getInt("cook_no"));
				recipe.setCookSeq(rset.getInt("cook_stuff"));
				recipe.setPostNo(postNo);
				recipes.add(recipe);
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
		
		
		return recipes;
		
	}
}