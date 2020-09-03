package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.ProductPageData;
import sale.model.service.SaleService;
import sale.model.vo.Sale;
import saleImage.model.service.SaleImageService;
import saleImage.model.vo.SaleImage;

/**
 * Servlet implementation class ProductSearchServelt
 */
@WebServlet("/productSearch")
public class ProductSearchServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int currentPage = 0;
		int searchKey1 = 0;
		int searchKey2 = 0;
		String prdClass = request.getParameter("prdClass");
		System.out.println(prdClass);
		String searchOption = request.getParameter("searchOption");
		String searchKey = request.getParameter("searchKey");
		

		if(request.getParameter("searchKey1")==null) {
			searchKey1 = 1;
		} else {
			searchKey1 = Integer.parseInt(request.getParameter("searchKey1"));
		}
		
		if(request.getParameter("searchKey2")==null) {
			searchKey2 = 1;
		} else {
			searchKey2 = Integer.parseInt(request.getParameter("searchKey2"));
		}
		
		if(request.getParameter("currentPage")==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ProductPageData ProductPageData = new ProductService().searchProduct(prdClass, searchOption, searchKey, searchKey1, searchKey2, currentPage);
		RequestDispatcher view = request.getRequestDispatcher("/views/sale/productSearchView.jsp");
		request.setAttribute("pageData", ProductPageData);
		request.setAttribute("prdClass", prdClass);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
}
