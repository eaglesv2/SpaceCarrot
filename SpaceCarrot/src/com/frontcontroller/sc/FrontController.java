package com.frontcontroller.sc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.userinfo.sc.UserImpl;
import com.userinfo.sc.UserInfoInsert;

import spacecarrotDAO.SpaceCarrotDAO_Board_Community;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
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
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String c = request.getRequestURI().substring(request.getContextPath().length());
		
		String str = null;
		UserImpl u1 = null;
		
		switch(c) {
		
		case "/UserInfoInsert.do" :
			u1 = new UserInfoInsert();
			
			try {
				u1.userinfo(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			str = "SignUpComplete.jsp";
			break;
			
		case "/Write_Community.do" :
			// 커뮤니티 글쓰기 insert 진행중..
			String category = request.getParameter("category");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			System.out.println(category);
			System.out.println(title);
			System.out.println(content);
			
			String testuserID = "tuche24";
			String testuserNickName = "hiyo";
			
			System.out.println(testuserID);
			
			SpaceCarrotDAO_Board_Community boarddao = null;
			
			try {
				boarddao = new SpaceCarrotDAO_Board_Community();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			boolean daoexecute = boarddao.insertPost_Community(category, testuserID, testuserNickName, title, content);
			
			if(daoexecute){
				System.out.println("dao insert success");
				str = "Community_List.jsp";
				break;
			} else {
				System.out.println("dao failed");
				str = "Community_List.jsp";
				break;
			}
		}
		
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);
	}
}
