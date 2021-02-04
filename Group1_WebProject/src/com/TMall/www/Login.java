package com.TMall.www;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tMallDAO.TMallDAO;
import tMallVO.TMalltUserVO;

@WebServlet("*.login")
public class Login extends HttpServlet {
	
	TMallDAO dao;
	RequestDispatcher rd;
	String referer;
	String[] refererArray;
	HttpSession session;
	
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doRequest(request, response, "get");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		try {
			doRequest(request, response, "post");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doRequest(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException, ClassNotFoundException, SQLException {
		
		String uri = request.getRequestURI();
		String[] uriArray = uri.split("\\/");
		uri = uriArray[uriArray.length-1].split("\\.")[0];
		System.out.println("============================================================");
		System.out.println("URL : " + uri);
		
		switch (uri) {

		case "login":
			if (method.equals("get")) {
				System.out.println("로그인 페이지 요청");
				referer = request.getHeader("referer");
				refererArray = referer.split("\\/");
				referer = refererArray[refererArray.length - 1].split("\\.")[0];
				System.out.println("전 페이지 : " + referer);
				rd = request.getRequestDispatcher("/login/login.jsp");
				rd.forward(request, response);
			} else {
				System.out.println("로그인 요청");
				String id = request.getParameter("userId");
				String pw = request.getParameter("userPw");
				System.out.println("ID : " + id + ", PW : " + pw);
				int result;
				dao = new TMallDAO();
				TMalltUserVO vo = dao.getOneUserInfo(id);
				if (vo != null) {
					result = (pw.equals(vo.getPw())) ? 0 : 1;
				} else
					result = 2;
				if (result == 0) {
					HttpSession session = request.getSession();
					session.setAttribute("user", vo);
				}
				response.getWriter().write(String.valueOf(result));
			}
			break;

		case "logout":
			System.out.println("로그아웃 요청");
			session = request.getSession();
			if (session.getAttribute("user") != null)
				session.removeAttribute("user");
			response.sendRedirect(request.getContextPath() + "/mainScreen.jsp");
			break;
			
		case "register":
			if (method.equals("get")) {
				System.out.println("회원가입 페이지 요청");
				rd = request.getRequestDispatcher("/login/signUp_Form.jsp");
				rd.forward(request, response);
			} else {
				System.out.println("상세 입력 페이지 요청");
				String flag = request.getParameter("flag");
				System.out.println("flag : " + flag);
				request.setAttribute("flag", flag);
				rd = request.getRequestDispatcher("/login/signUp_Buyer.jsp");
				rd.forward(request, response);
			}
			break;
			
		case "idcheck":
			System.out.println("아이디 중복 확인 요청 (ajax)");
			String id = request.getParameter("userId");
			System.out.println("중복검사 아이디 : " + id);
			dao = new TMallDAO();
			response.getWriter().write(String.valueOf(dao.checkOverlap(id, true)));
			break;
			
		case "nickcheck":
			System.out.println("닉네임 중복 확인 요청 (ajax)");
			String nick = request.getParameter("usernick");
			System.out.println("중복검사 닉네임 : " + nick);
			dao = new TMallDAO();
			response.getWriter().write(String.valueOf(dao.checkOverlap(nick, false)));
			break;
			
		case "insert":
			if (method.equals("post")) {
				System.out.println("회원가입 완료 요청");
				TMalltUserVO vo = new TMalltUserVO();
				vo.setFlag(Integer.parseInt(request.getParameter("flag")));
				vo.setId(request.getParameter("userId"));
				vo.setPw(request.getParameter("userPw"));
				vo.setName(request.getParameter("userName"));
				vo.setNickname(request.getParameter("userNickname"));
				vo.setTel(request.getParameter("userTel"));
				vo.setAddress(request.getParameter("userAddress"));
				vo.setGender(Integer.parseInt(request.getParameter("gender")));
				vo.setAge(Integer.parseInt(request.getParameter("age")));
				if (vo.getFlag() == 2) {
					vo.setLanguage(request.getParameter("lang"));
					vo.setIntroduce(request.getParameter("intro"));
				} else {
					vo.setLanguage(null);
					vo.setIntroduce(null);
				}
				System.out.println(vo.getFlag());
				System.out.println(vo.getId());
				System.out.println(vo.getPw());
				System.out.println(vo.getName());
				System.out.println(vo.getNickname());
				System.out.println(vo.getTel());
				System.out.println(vo.getAddress());
				System.out.println(vo.getGender());
				System.out.println(vo.getAge());
				System.out.println(vo.getLanguage());
				System.out.println(vo.getIntroduce());
				dao = new TMallDAO();
				dao.insertUser(vo);
				response.sendRedirect(request.getContextPath() + "/mainScreen.jsp");
			}
			break;
			
		case "main":
			System.out.println("메인 화면 요청");
			response.sendRedirect(request.getContextPath() + "/mainScreen.jsp");
			break;
		}
	}
}
