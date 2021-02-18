package com.frontcontroller.sc;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.article.sc.ArticleInfo;
import com.userinfo.sc.UserIDCheck;
import com.userinfo.sc.UserImpl;
import com.userinfo.sc.UserInfoInsert;
import com.userinfo.sc.UserLogin;

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
		
		String c = request.getRequestURI().substring(request.getContextPath().length());
		
		String str = null;
		UserImpl u1 = null;
		ArticleInfo al = null;
		
		// request로 받아올 parameter
		String category = null;
		String title = null;
		String content = null;
		String testuserID = null;
		String testuserNickName = null; 
		String pageNoVal = null;
		int pageNo = 0;
		boolean daoexecute = false;
		// CommunityList에 필요한 객체
		Community_ListArticleService listService = null;
		SpaceCarrotDAO_Board_Community boarddao = null;
		Community_ArticlePage articlePage = null;
		
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
			
		case "/view.login/idOverLapCheck.do" : // 아이디 중복체크!!!!!!!!!!!!!!!!!!!!!!!
			u1 = new UserIDCheck();
			
			try {
				u1.userinfo(request, response);
			} catch (Exception e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			
			str = "/view.login/SignUp.jsp";
			break;
		
		case "/view.login/UserLogin.do" :
			u1 = new UserLogin();
			
			try {
				u1.userinfo(request, response);
			} catch (Exception e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			int result = Integer.parseInt(request.getParameter("result"));
			request.setAttribute("result", result);
			
			if(result == 1) {
				str = "/MainPage/main.html";
			}
			else { 
				str = "/view.login/Login.jsp";	
			}

			break;
			
		case "/view.community/Write_Community.do" :
			
			category = request.getParameter("category");
			title = request.getParameter("title");
			content = request.getParameter("content");
			testuserID = "tuche24";
			testuserNickName = "hiyo";
			
			
			// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
			pageNoVal = request.getParameter("pageNo");
			pageNo = 1;
			if(pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
			
			try {
				boarddao = new SpaceCarrotDAO_Board_Community();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			daoexecute = boarddao.insertPost_Community(category, testuserID, testuserNickName, title, content);
			
			// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다
			listService = new Community_ListArticleService();
			
			try {
				articlePage= listService.getArticlePage(pageNo);
			} catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			}
			
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
			
		case "/view.community/Category_Community.do" :
			
			category = request.getParameter("category");
			title = request.getParameter("title");
			content = request.getParameter("content");
			testuserID = "tuche24";
			testuserNickName = "hiyo";
					
			// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
			pageNoVal = request.getParameter("pageNo");
			pageNo = 1;
			if(pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
			
			// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다
			listService = new Community_ListArticleService();
			
			try {
				articlePage= listService.getArticlePage_search_Category(pageNo, category);
			} catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			}
			
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
			
		case "/view.community/Search_Community.do" :
			
			String searchArea = request.getParameter("searchArea");
			category = request.getParameter("category");
			title = request.getParameter("title");
			content = request.getParameter("content");
			testuserID = "tuche24";
			testuserNickName = "hiyo";
			
			// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
			pageNoVal = request.getParameter("pageNo");
			pageNo = 1;
			if(pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
			
			// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다
			listService= new Community_ListArticleService();
			
			try {
				articlePage= listService.getArticlePage_search(pageNo, searchArea);
			} catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			}
			
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
