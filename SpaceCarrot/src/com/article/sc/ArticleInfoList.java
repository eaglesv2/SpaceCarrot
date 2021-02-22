package com.article.sc;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.service.Community_ArticlePage;
import article.service.Community_CommentPage;
import article.service.Community_ListArticleService;
import spacecarrotDAO.SpaceCarrotDAO_Board_Community;

public class ArticleInfoList implements ArticleImpl {

	SpaceCarrotDAO_Board_Community boarddao = null;	
	Community_ListArticleService listService = null;
	Community_ArticlePage articlePage = null;
	Community_CommentPage commentPage = null;
	
	@Override
	public Community_ArticlePage execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 컨트롤러에서 메소드 실행시 게시판 리스트를 출력한다
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String userID = (String) session.getAttribute("sessionID");
		String userNickName = (String) session.getAttribute("sessionNickName");
		String pageNoVal = request.getParameter("pageNo");
		
		// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다
		listService = new Community_ListArticleService();

		// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
		int pageNo = 1;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		try {
			boarddao = new SpaceCarrotDAO_Board_Community();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		boarddao.insertPost_Community(category, userID, userNickName, title, content);
		
		try {
			articlePage= listService.getArticlePage(pageNo);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		return articlePage;
	}
	
	public Community_ArticlePage execute_search_Category(HttpServletRequest request, HttpServletResponse response, String input_category) throws Exception {
		// 게시판에서 특정 카테고리 리스트를 반환한다.
		HttpSession session = request.getSession();
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String category = input_category;
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String userID = (String) session.getAttribute("sessionID");
		String userNickName = (String) session.getAttribute("sessionNickName");
		String pageNoVal = request.getParameter("pageNo");
		
		// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다
		listService = new Community_ListArticleService();

		// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
		int pageNo = 1;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		try {
			articlePage= listService.getArticlePage_search_Category(pageNo, category);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		return articlePage;
	}

	public Community_ArticlePage execute_search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 게시판에서 특정 검색어에 해당되는 게시글을 반환한다.
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String userID = (String) session.getAttribute("sessionID");
		String userNickName = (String) session.getAttribute("sessionNickName");
		String pageNoVal = request.getParameter("pageNo");
		String search = request.getParameter("searchArea");
		// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다
		listService = new Community_ListArticleService();
	
		// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
		int pageNo = 1;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		try {
			articlePage= listService.getArticlePage_search(pageNo, search);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		return articlePage;
	}
	
	public Community_ArticlePage reset(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 게시판에서 특정 검색어에 해당되는 게시글을 반환한다.
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String userID = (String) session.getAttribute("sessionID");
		String userNickName = (String) session.getAttribute("sessionNickName");
		String pageNoVal = request.getParameter("pageNo");
		
		// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다
		listService = new Community_ListArticleService();
	
		// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
		int pageNo = 1;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		articlePage= listService.getArticlePage_reset(pageNo);
		return articlePage;
	}
	// url 찾아가는 메소드입니다
	public String find_url(String category) {
		String result = null;
		if(category.equals("자유")) {
			result = "Community_List_Free.jsp";
		} else if (category.equals("정보")) {
			result = "Community_List_Info.jsp"; 
		} else if (category.equals("QnA")) {
			result = "Community_List_QnA.jsp"; 
		} else if (category.equals("리뷰")) {
			result = "Community_List_Review.jsp"; 
		} else {
			result = "error.jsp";
		}
		return result;
	}
	
	public Community_ArticlePage execute_search_In_Category(HttpServletRequest request, HttpServletResponse response, String input_category, String input_textArea) throws Exception {
		// 게시판에서 특정 카테고리 리스트를 반환한다.
		HttpSession session = request.getSession();
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String category = input_category;
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String userID = (String) session.getAttribute("sessionID");
		String userNickName = (String) session.getAttribute("sessionNickName");
		String pageNoVal = request.getParameter("pageNo");
		String search = input_textArea;
		
		// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다
		listService = new Community_ListArticleService();

		// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
		int pageNo = 1;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		try {
			articlePage= listService.getArticlePage_search_In_Category(pageNo, category, search);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		return articlePage;
	}
	
	public Community_ArticlePage search_Writer(HttpServletRequest request, HttpServletResponse response, String input_UserNickName) throws Exception {
		// 특정 작성자가 쓴 글을 VO에 담아 반환하는 메소드
		HttpSession session = request.getSession();
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userNickName = input_UserNickName;
		String pageNoVal = request.getParameter("pageNo");
		
		// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다
		listService = new Community_ListArticleService();

		// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
		int pageNo = 1;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		try {
			// 테스트 System.out.println("Action Page userID = " + userID);
			articlePage= listService.Writer_search(pageNo, userNickName);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		return articlePage;
	}
	
	public Community_CommentPage search_Writer_comment(HttpServletRequest request, HttpServletResponse response, String input_UserID) throws Exception {
		// 특정 작성자가 쓴 댓글을 VO에 담아 반환하는 메소드
		HttpSession session = request.getSession();
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userID = input_UserID;
		String pageNoVal = request.getParameter("pageNo");
		
		// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다
		listService = new Community_ListArticleService();

		// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
		int pageNo = 1;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		try {
			// 테스트 System.out.println("Action Page userID = " + userID);
			commentPage= listService.Writer_search_comment(pageNo, userID);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		return commentPage;
	}
}
