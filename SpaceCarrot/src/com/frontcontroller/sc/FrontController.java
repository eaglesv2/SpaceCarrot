package com.frontcontroller.sc;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.userinfo.sc.UserImpl;
import com.userinfo.sc.UserInfoInsert;

import article.service.Community_ArticlePage;
import article.service.Community_ListArticleService;
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
		
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getContextPath());
		
		String c = request.getRequestURI().substring(request.getContextPath().length());
//		System.out.println(c);
		
		String str = null;
		UserImpl u1 = null;
		switch(c) {
		
		case "/view.login/UserInfoInsert.do" :
			u1 = new UserInfoInsert();
			
			try {
				u1.userinfo(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			str = "/view.login/SignUpComplete.jsp";
			break;
			
		case "/view.community/Write_Community.do" :
			// 커뮤니티 글쓰기 insert 정리 진행중.. 
			
			Community_ListArticleService listService = new Community_ListArticleService();
			
			// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
			String pageNoVal = request.getParameter("pageNo");
			int pageNo = 1;
			if(pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
			
			// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다  
			Community_ArticlePage articlePage = null;
			try {
				articlePage= listService.getArticlePage(pageNo);
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			String category = request.getParameter("category");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			/* 테스트용
			System.out.println(category);
			System.out.println(title);
			System.out.println(content);*/
			
			// 받아올 유저 정보
			String testuserID = "tuche24";
			String testuserNickName = "hiyo";
			
			SpaceCarrotDAO_Board_Community boarddao = null;
			
			try {
				boarddao = new SpaceCarrotDAO_Board_Community();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			boolean daoexecute = boarddao.insertPost_Community(category, testuserID, testuserNickName, title, content);
			
			request.setAttribute("articlePage", articlePage);
				
			if(daoexecute){
				System.out.println("dao insert success");
				str = "/view.community/Community_List.jsp";
				break;
			} else {
				System.out.println("dao failed");
				str = "/view.community/Community_List.jsp";
				break;
			}
		}
	
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);
	}
}
