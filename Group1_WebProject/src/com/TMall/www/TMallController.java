package com.TMall.www;

import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import tMallDAO.TMallDAO;
import tMallVO.TMallProductVO;
import tMallVO.USERSAY;



/**
 * Servlet implementation class TMallController
 */
//@WebServlet("/TMallController")
@WebServlet("*.do")
public class TMallController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TMallController() {
        super();
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
		switch (path) {			
			case "/test.do":
				TMallDAO tmdao = null;
				TMallProductVO tvo =null;
				String introduce = null; //12.8 손혜지 추가
				String Seq=request.getParameter("sSeqNum");				
				int sSeq=Integer.parseInt(Seq);
				try {
					tmdao = new TMallDAO();
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				try {
					tvo=tmdao.getInfo(sSeq);
					introduce=tmdao.getOneUserinInfo(tvo.getsID()); //12.8손혜지 추가
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				request.setAttribute("tvo", tvo);	 //상품 정보가 들어있는 객체
				request.setAttribute("introduce", introduce); //12.8 손혜지 추가
				nextPath = "product_detail/depro.jsp";
				break;
				
			case "/board/writeAction.do":
				String TITLE = request.getParameter("TITLE");
				String UCON = request.getParameter("UCON");
				String USERID="임시";
				try {
					TMallDAO wadao = new TMallDAO();
					int result = wadao.write(TITLE, USERID, UCON);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				nextPath = "usersay.jsp";
				break;
		}//switch end

		request.getRequestDispatcher(nextPath).forward(request, response);
		
	}//do post end
	
}//controller end
