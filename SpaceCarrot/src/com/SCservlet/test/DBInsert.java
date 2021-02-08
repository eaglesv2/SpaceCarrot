package com.SCservlet.test;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spacecarrotDAO.SpaceCarrotDAO_UserInfo;

/**
 * Servlet implementation class DBInsert
 */
@WebServlet("/DBInsert")
public class DBInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		int userSerial = Integer.parseInt(request.getParameter("userserial"));
		String userName = request.getParameter("username");
		String userID = request.getParameter("userid");
		String userPW = request.getParameter("userpw");
		String userGender = request.getParameter("usergender");
		String userBirth = request.getParameter("userbirth");
		String userTel = request.getParameter("usertel");
		SpaceCarrotDAO_UserInfo scv = null;
		
		try {
			scv = new SpaceCarrotDAO_UserInfo();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		Boolean b = scv.insertUserInfo(userSerial, userName, userID, userPW, userGender, userBirth, userTel);
		
		
		if(b) {//true면 insert 되었으므로
			request.setAttribute("result1", "입력good");
		} else {
			request.setAttribute("result1", "입력오류");
		}
		
		RequestDispatcher rd1 = request.getRequestDispatcher("result.jsp");
		rd1.forward(request, response);
	}

}
