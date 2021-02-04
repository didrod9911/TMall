package com.TMall.www;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tMallDAO.TMallDAO;
import tMallVO.TMallProductVO;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("*.product")
@MultipartConfig
public class ProductController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	TMallDAO dao;
	RequestDispatcher rd;
       
    public ProductController() throws ClassNotFoundException, SQLException {
        super();
        dao = new TMallDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			doRequest(request, response, "get");			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			doRequest(request, response, "post");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doRequest(HttpServletRequest request, HttpServletResponse response, String method) throws Exception {
		String[] uriArray = request.getRequestURI().split("\\/");
		String uri = uriArray[uriArray.length-1].split("\\.")[0];
		System.out.println("Request URI : " + uri + ", Method : " + method);
		
		switch (uri) {
		case "register":
			if (method.equals("get")) {
				System.out.println("상품 등록 화면 요청");
				rd = request.getRequestDispatcher("/product/reg_product.jsp");
				rd.forward(request, response);				
			} else {
				System.out.println("상품 등록 요청");
				TMallProductVO vo = new TMallProductVO();
				vo.setsID(request.getParameter("sId"));
				vo.setsNickname(request.getParameter("sNickname"));
				vo.setLanguage(request.getParameter("language"));
				vo.setsGender(Integer.parseInt(request.getParameter("sGender")));
				vo.setsAge(Integer.parseInt(request.getParameter("sAge")));
				vo.setClassName(request.getParameter("className"));
				vo.setClassTime(Integer.parseInt(request.getParameter("classTime")));
				vo.setClassNum(Integer.parseInt(request.getParameter("classNum")));
				vo.setClassPlace(request.getParameter("classPlace"));
				vo.setClassPrice(Integer.parseInt(request.getParameter("classPrice")));
				String data = request.getParameter("classData");
				vo.setClassData(data);
				dao = new TMallDAO();
				dao.insertProduct(vo);
			}
			break;
			
		case "main":
			System.out.println("메인 화면 요청");
			response.sendRedirect(request.getContextPath() + "/mainScreen.jsp");
			break;
		}
	}
}

