package com.TMall.www;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tMallDAO.TMallDAO;
import tMallVO.TMallProductVO;
import tMallVO.TMalltUserVO;

/**
 * Servlet implementation class ModifyGo
 */ 
@WebServlet("*.modify")
public class ModifyGo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TMallDAO dao;
	HttpSession session;
	RequestDispatcher rd;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModifyGo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			actionDo(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			actionDo(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		String uri = request.getRequestURI();
		String[] uriArray = uri.split("\\/");
		uri = uriArray[uriArray.length - 1];
		uri = uri.split("\\.")[0];
		System.out.println(uri);
		
		switch (uri) {
		
		case "ModifyMain":
			// 수정 페이지로 이동
			session = request.getSession();
			Object s = session.getAttribute("user"); 
			int separateuser = ((TMalltUserVO) s).getFlag();
			String page;
			if(separateuser == 1) { // 구매자 수정 페이지
				page = "A_ConsumerModify.jsp";
				dao = new TMallDAO();
				List<TMallProductVO> list = dao.selectPurchaseList(((TMalltUserVO)session.getAttribute("user")).getId());
				request.setAttribute("list", list);
			}
			else { // 판매자 수정 페이지
				page = "A_SellerModify.jsp";
				dao = new TMallDAO();
				List<TMallProductVO> list = dao.selectProduct(((TMalltUserVO)session.getAttribute("user")).getId());
				request.setAttribute("list", list);
			}
			rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			break;
			
		case "ModifyConfirm": // 구매자 수정
			// 수정된 내용을 데이터베이스에 저장 후 메인 페이지로 이동
			session = request.getSession();
			TMalltUserVO vo = (TMalltUserVO) session.getAttribute("user");
			String pw = request.getParameter("pw"); // 유저가 수정한 비밀번호 값
			String nickname1 = request.getParameter("nickname");
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			String address = request.getParameter("address");
			String tel = request.getParameter("tel");
			int gender = Integer.parseInt(request.getParameter("gender"));
			vo.setPw(pw);
			vo.setNickname(nickname1);
			vo.setName(name);
			vo.setAge(age);
			vo.setAddress(address);
			vo.setGender(gender);
			vo.setTel(tel);
			session.setAttribute("user", vo);
			dao = new TMallDAO();
			dao.UpdateUSer(pw, name, nickname1, age, address, tel, gender, request.getParameter("id"));
			rd = request.getRequestDispatcher("A_ConsumerModify.jsp");
			rd.forward(request, response);
			break;
			
		case "ModifyConfirm2": // 판매자 수정
			// 수정된 내용을 데이터베이스에 저장 후 메인 페이지로 이동
			session = request.getSession();
			TMalltUserVO vo2 = (TMalltUserVO) session.getAttribute("user");
			String pw2 = request.getParameter("pw"); // 유저가 수정한 비밀번호 값
			String nickname2 = request.getParameter("nickname");
			String name2 = request.getParameter("name");
			int age2 = Integer.parseInt(request.getParameter("age"));
			String address2 = request.getParameter("address");
			String tel2 = request.getParameter("tel");
			int gender2 = Integer.parseInt(request.getParameter("gender"));
			String language = request.getParameter("language");
			String id = request.getParameter("id");
			vo2.setPw(pw2);
			vo2.setNickname(nickname2);
			vo2.setName(name2);
			vo2.setAge(age2);
			vo2.setAddress(address2);
			vo2.setGender(gender2);
			vo2.setTel(tel2);
			session.setAttribute("user", vo2);
			dao = new TMallDAO();
			dao.UpdateUSer2(pw2, name2, nickname2, age2, address2, tel2, gender2, language, id);
			rd = request.getRequestDispatcher("A_SellerModify.jsp");
			rd.forward(request, response);
			break;
			
		case "Overlap":
			// 중복체크
			String nickname = request.getParameter("sendData");
			System.out.println(nickname);
			try {
				dao = new TMallDAO();
				int result = dao.checkOverlap(nickname, false);
				response.getWriter().write(String.valueOf(result));
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		}
	}
}