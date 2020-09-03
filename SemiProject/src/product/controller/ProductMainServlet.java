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
import sale.model.vo.SalePageData;
import saleImage.model.service.SaleImageService;
import saleImage.model.vo.SaleImage;

/**
 * Servlet implementation class ProductMainServlet
 */
@WebServlet("/productMain")
public class ProductMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 전송값에 한글이 있을 경우 인코딩 처리
		request.setCharacterEncoding("utf-8");
		int currentPage = 0;
		String prdClass = request.getParameter("prdClass"); 
		ArrayList<Sale> saleList = null;
		ArrayList<SaleImage> bestImage = null;
		
		if(request.getParameter("currentPage")==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		saleList = new SaleService().bestSaleList(prdClass); 	
		bestImage = new SaleImageService().showBestSaleImage(prdClass, saleList); 
		
		SalePageData salePageData = new SaleService().selectSaleList(prdClass, currentPage); 
		RequestDispatcher view = request.getRequestDispatcher("/views/sale/ProductMain.jsp");
		request.setAttribute("pageData", salePageData);
		request.setAttribute("prdClass", prdClass);
		
		request.setAttribute("saleList", saleList);		
		request.setAttribute("bestImage", bestImage);	
		
		/*System.out.println(salePageData.getPageList().get(0).getSaleId());*/
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