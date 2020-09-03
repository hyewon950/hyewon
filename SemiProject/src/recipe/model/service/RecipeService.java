package recipe.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectionFactory;
import recipe.model.dao.RecipeDAO;
import recipe.model.vo.Recipe;

public class RecipeService {
	private ConnectionFactory factory;
	RecipeDAO recipeDAO;

	public RecipeService() {
		// TODO Auto-generated constructor stub
		factory = ConnectionFactory.getConnection();
		recipeDAO = new RecipeDAO();
	}

	public int insertRecipe(ArrayList<Recipe> rList) {
		// 레시피 넣는 법
		Connection conn = null;
		int result = 0;
		int dao = 0;
		try {
			conn = factory.createConnection();
			for (Recipe recipe : rList) {
				dao = recipeDAO.insertRecipe(conn, recipe);
				if (dao > 0) {
					result += dao;
					factory.commit(conn);
				} else {
					factory.rollback(conn);
					result = 0;
				}
				dao = 0;
			}
			if (result > 0) {
				factory.commit(conn);
			} else {
				factory.rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}

		return result;
	}
	public int insertRecipe(ArrayList<Recipe> rList,int postNo) {
		// 레시피 넣는 법
		Connection conn = null;
		int result = 0;
		int dao = 0;
		try {
			conn = factory.createConnection();
			for (Recipe recipe : rList) {
				dao = recipeDAO.insertRecipe(conn, recipe, postNo);
				if (dao > 0) {
					result += dao;
					factory.commit(conn);
				} else {
					factory.rollback(conn);
					result = 0;
				}
				dao = 0;
			}
			if (result > 0) {
				factory.commit(conn);
			} else {
				factory.rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}

		return result;
	}
	public int deleteRecipe(int postNo) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = factory.createConnection();
			result = recipeDAO.deleteRecipe(conn, postNo);
			if (result > 0) {
				factory.commit(conn);
			} else {
				factory.rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		
		return result;
	}
	public ArrayList<Recipe> selectRecipe(int postNo) {
		Connection conn = null;
		ArrayList<Recipe> recipes = null;

		try {
			conn = factory.createConnection();
			recipes = recipeDAO.selectRecipe(conn, postNo);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			factory.close(conn);
		}
		return recipes;
	}

	
}
