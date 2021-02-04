package com.TMall.www;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tMallDAO.TMallDAO;
import tMallVO.TMallProductVO;

/**
 * Servlet implementation class TMallmainScrenController
 */
//@WebServlet("/TMallmainScrenController")
@WebServlet("*.main")
public class TMallmainScreenController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TMallmainScreenController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String path = request.getRequestURI().substring(request.getContextPath().length());
		String nextPath = null;
		
		//검색창에서 검색시
		if(path.equals("/productSearch.main")) {
			String language = request.getParameter("language1");
			String genderTemp = request.getParameter("gender1");
			String ageTemp = request.getParameter("age1");
			String classTimeTemp = request.getParameter("classTime1");
			int gender = -2;
			int age = -2;
			int classTime = -2;
			
			//성별작업
			if((genderTemp == null) || (genderTemp.equals("genderNoChoice"))) {
				gender = -1;
			} else {
				if(genderTemp.equals("male"))
					gender = 1;
				if(genderTemp.equals("female"))
					gender = 2;
			}
			//나이작업
			if(ageTemp == null) {
				age = -1;
			} else {
				age = Integer.parseInt(ageTemp.substring(3));
			}
			//강의시간작업
			if(classTimeTemp == null) {
				classTime = -1;
			} else {
				if(classTimeTemp.equals("cTime-1"))
					classTime = 1;
				if(classTimeTemp.equals("cTime1-2"))
					classTime = 2;
				if(classTimeTemp.equals("cTime2-3"))
					classTime = 3;
				if(classTimeTemp.equals("cTime3-"))
					classTime = 4;
			}
			
			TMallDAO tmdao = null;
			ArrayList<TMallProductVO> allProduct = null;
			
			try {
				tmdao = new TMallDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			//allProduct = tmdao.productSearch(language, gender, age, classTime);		
			allProduct = tmdao.productSearch(language, gender, age, classTime);
			request.setAttribute("allProduct", allProduct);
			
			nextPath = "mainScreen.jsp";
		}
		if(path.equals("/SeqSearch.main")) {
			int sSeq = Integer.parseInt(request.getParameter("sSeqNum"));
			TMallDAO tmdao = null;
			TMallProductVO product = null;
			
			try {
				tmdao = new TMallDAO();
				product = tmdao.getInfo(sSeq);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("product", product);
			nextPath = "payment/paymentScreen.jsp";
			
		}
		if(path.equals("/paymentConfirmed.main")) {
			TMallDAO tmdao = null;
			TMallProductVO product = null;
			int sSeq = Integer.parseInt(request.getParameter("sSeqNum"));
			String bID = request.getParameter("bID");
			boolean flag;
			System.out.println("물품시퀀스 : " + sSeq);
			System.out.println("구매자ID : " + bID);
			
			try {
				tmdao = new TMallDAO();
				product = tmdao.getInfo(sSeq);
				flag = tmdao.purchaseCheck(bID, sSeq);
				
				if(!flag) {
					System.out.println("true들어옴");
					tmdao.insertPList(
							bID,
							sSeq,
							product.getsID(),
							product.getsNickname(),
							product.getLanguage(),
							product.getClassName(),
							product.getClassPrice()
							);
				} else {
					System.out.println("false들어옴");
					tmdao.updatePList(bID, sSeq);
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			nextPath = "mainScreen.jsp";
		}
		
		request.getRequestDispatcher(nextPath).forward(request, response);
		
	}

}