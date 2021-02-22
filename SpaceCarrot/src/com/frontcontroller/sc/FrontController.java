package com.frontcontroller.sc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.article.sc.ArticleInfoList;
import com.comment.sc.CommentVO;
import com.comment.sc.Commerce_CommentAction;
import com.comment.sc.Community_CommentAction;
import com.commerce.sc.CommerceArticlePageVO;
import com.commerce.sc.CommerceArticleVO;
import com.commerce.sc.CommerceInsert;
import com.main.sc.MainAction;
import com.userinfo.sc.MyPagePWCheck;
import com.userinfo.sc.UserIDCheck;
import com.userinfo.sc.UserImpl;
import com.userinfo.sc.UserInfoInsert;
import com.userinfo.sc.UserInfoUpdate;
import com.userinfo.sc.UserLogin;
import com.userinfo.sc.UserNickNameCheck;

import article.service.Commerce_ReadArticleService;
import article.service.Community_ArticlePage;
import article.service.Community_CommentPage;
import article.service.Community_ReadArticleService;
import spacecarrotVO.SpaceCarrotVO_Board_Community;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		// url 너무 헷갈림 서블릿 올때마다 url 체크하기
		String url = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(url);
		// 세션 받아오기?
		HttpSession session = request.getSession();
		
		String str = null;
		UserImpl u1 = null;
		ArticleInfoList al = null;

		// 게시판 객체
		Community_ArticlePage articlePage = null;
		// 게시판 이동 Dispatcher 속성
		RequestDispatcher rd = null;
		// 공통변수
		int postNum;
		String category;
		String userNickName;
		
		
		switch (url) {

		case "/view.login/UserInfoInsert.do":
			u1 = new UserInfoInsert();

			try {
				u1.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		case "/view.login/idOverLapCheck.do": // 아이디 중복체크!!!!!!!!!!!!!!!!!!!!!!!

			u1 = new UserIDCheck();

			try {
				u1.execute(request, response);
			} catch (Exception e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}

			break;

		case "/view.login/nicknameOverLapCheck.do": // 회원가입 닉네임 중복체크

			u1 = new UserNickNameCheck();

			try {
				u1.execute(request, response);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			break;

		case "/view.mypage/nicknameOverLapCheck.do": // 회원정보수정닉네임 중복체크

			u1 = new UserNickNameCheck();

			try {
				u1.execute(request, response);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			break;

		case "/view.login/UserLogin.do":
			u1 = new UserLogin();

			try {
				u1.execute(request, response);
			} catch (Exception e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}

			break;

		case "/view.mypage/MyPagePWCheck.do":
			u1 = new MyPagePWCheck();

			try {
				u1.execute(request, response);
			} catch (Exception e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}

			break;

		case "/view.mypage/UserInfoUpdate.do":
			u1 = new UserInfoUpdate();
			try {
				u1.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			break;

		case "/view.community/Write_Community.do":
			// 커뮤니티 게시판 글 작성시
			al = new ArticleInfoList();

			try {
				articlePage = al.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("articlePage", articlePage);

			str = "/view.community/Community_List_Default.jsp";
			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.community/Category_Community.do":
			// 커뮤니티 카테고리 검색시
			category = (String) request.getParameter("category");
			if (category == null) {
				category = (String) request.getAttribute("category");
			}
			String search55 = (String) request.getParameter("searchArea");
			al = new ArticleInfoList();
			System.out.println("first controller = " + search55);
			try {
				if (search55 == null) {
					articlePage = al.execute_search_Category(request, response, category);
					request.setAttribute("articlePage", articlePage);
				} else {
					articlePage = al.execute_search_In_Category(request, response, category, search55);
					request.setAttribute("articlePage", articlePage);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			str = al.find_url(category);

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.community/Search_Community.do":
			// 게시글 검색시 (제목으로 검색)

			al = new ArticleInfoList();

			try {
				articlePage = al.execute_search(request, response);
				request.setAttribute("articlePage", articlePage);
			} catch (Exception e) {
				e.printStackTrace();
			}

			str = "/view.community/Community_List_Search.jsp";

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.community/Reset_Community.do":
			// 커뮤니티 게시판 검색시
			al = new ArticleInfoList();

			try {
				articlePage = al.reset(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("articlePage", articlePage);

			str = "/view.community/Community_List_Default.jsp";

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		// 커뮤니티 게시글 읽기 컨트롤러
		case "/view.community/Read_Community.do":
			// 게시글번호를 가져오고 int로 변환한다
			postNum = Integer.parseInt(request.getParameter("no"));
			System.out.println("postNum : " + postNum);
			// 게시글 읽기 서비스 객체 생성
			Community_ReadArticleService readService = new Community_ReadArticleService();
			SpaceCarrotVO_Board_Community article_VO;
			try {
				// 읽기 서비스 메소드 getArticle을 통해 VO를 가져오고, 조회수를 1 늘린다.
				article_VO = readService.getArticle(postNum, true);
				request.setAttribute("article_VO", article_VO);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

			// 게시글 코멘트 읽기
			Community_CommentAction ca = new Community_CommentAction();
			List<CommentVO> commentVO = null;
			try {
				commentVO = ca.readExecute(request, response, postNum);
				request.setAttribute("comment_VO", commentVO);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			str = "/view.community/Community_Comment_3ja.jsp";

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);
			break;

		// 게시글에 댓글 작성시
		case "/view.community/Comment_Community.do":
			// 게시글번호와 댓글내용을 가져옴
			postNum = Integer.parseInt(request.getParameter("no"));
			String community_conmment = request.getParameter("text");

			Community_CommentAction ca1 = new Community_CommentAction();
			try {
				ca1.insertExecute(request, response, postNum, community_conmment);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("no", postNum);

			str = "/view.community/Community_Comment_3ja.jsp";
			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.board/CommerceInsert.do":
			// 중고거래 글 쓰기 컨트롤러
			CommerceInsert c1 = new CommerceInsert();

			try {
				c1.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		case "/view.board/Commerce_Reset.do":
			// 중고거래 게시판 입장 컨트롤러
			CommerceInsert c2 = new CommerceInsert();

			try {
				CommerceArticlePageVO articlePage5 = c2.reset(request, response);
				request.setAttribute("articlePage", articlePage5);
				str = "Board_Commerce_List.jsp";
			} catch (ClassNotFoundException | SQLException e) {
				request.setAttribute("articlePage", articlePage);
				str = "error.jsp";
				e.printStackTrace();
			}

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		// 중고거래 게시글 읽기 컨트롤러
		case "/view.board/Read_Commerce.do":
			// 게시글번호를 가져오고 int로 변환한다
			postNum = Integer.parseInt(request.getParameter("no"));

			// 게시글 읽기 서비스 객체 생성
			Commerce_ReadArticleService readService1 = new Commerce_ReadArticleService();
			CommerceArticleVO commerce_article_VO;
			try {
				// 읽기 서비스 메소드 getArticle을 통해 VO를 가져오고, 조회수를 1 늘린다.
				commerce_article_VO = readService1.getArticle(postNum, true);
				request.setAttribute("commerce_article_VO", commerce_article_VO);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			// 게시글 코멘트 읽기
			Commerce_CommentAction ca3 = new Commerce_CommentAction();
			List<CommentVO> commerce_comment_VO = null;
			try {
				commerce_comment_VO = ca3.readExecute(request, response, postNum);
				request.setAttribute("commerce_comment_VO", commerce_comment_VO);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			str = "/view.board/Board_Commerce_purchase_3ja.jsp";
			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		// 중고거래 게시글에 댓글 작성시
		case "/view.board/Comment_Commerce.do":
			// 게시글번호와 댓글내용을 가져옴
			postNum = Integer.parseInt(request.getParameter("no"));
			String content = request.getParameter("text");

			Commerce_CommentAction ca4 = new Commerce_CommentAction();
			try {
				ca4.insertExecute(request, response, postNum, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("no", postNum);

			str = "/view.board/Board_Commerce_purchase_3ja.jsp";
			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.board/Search_Category_Commerce.do":

			category = (String) request.getParameter("category");
			if (category == null) {
				category = (String) request.getAttribute("category");
			}

			CommerceInsert c3 = new CommerceInsert();

			try {
				CommerceArticlePageVO articlePage5 = c3.search_category(request, response);
				request.setAttribute("articlePage", articlePage5);
				str = c3.find_url(category);
			} catch (ClassNotFoundException | SQLException e) {
				request.setAttribute("articlePage", articlePage);
				str = "error.jsp";
				e.printStackTrace();
			}

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/MainPage/Reset_Main.do":
			MainAction ma = new MainAction();

			List<SpaceCarrotVO_Board_Community> MainVO = null;
			try {
				MainVO = ma.readExecute(request, response);
				request.setAttribute("community_VO", MainVO);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			List<SpaceCarrotVO_Board_Community> MainHotVO = null;
			try {
				MainHotVO = ma.readExecute_hot(request, response);
				request.setAttribute("communityHot_VO", MainHotVO);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			List<CommerceArticleVO> MainCommerceVO = null;
			try {
				MainCommerceVO = ma.commerce_readExecute(request, response);
				request.setAttribute("commerce_VO", MainCommerceVO);
			} catch (ClassNotFoundException | SQLException e2) {
				// TODO Auto-generated catch block;
				e2.printStackTrace();
			}

			str = "/MainPage/Main.jsp";

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);
			break;

		case "/MainPage/Read_Community.do":
			// 게시글번호를 가져오고 int로 변환한다
			postNum = Integer.parseInt(request.getParameter("no"));
			System.out.println("postNum : " + postNum);
			// 게시글 읽기 서비스 객체 생성
			Community_ReadArticleService MainReadService = new Community_ReadArticleService();
			SpaceCarrotVO_Board_Community MainArticle_VO;
			try {
				// 읽기 서비스 메소드 getArticle을 통해 VO를 가져오고, 조회수를 1 늘린다.
				MainArticle_VO = MainReadService.getArticle(postNum, true);
				request.setAttribute("article_VO", MainArticle_VO);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

			// 게시글 코멘트 읽기
			Community_CommentAction MainPageca = new Community_CommentAction();
			List<CommentVO> MainPageCommentVO = null;
			try {
				MainPageCommentVO = MainPageca.readExecute(request, response, postNum);
				request.setAttribute("comment_VO", MainPageCommentVO);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			str = "/view.community/Community_Comment_3ja.jsp";

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);
			break;

		// 중고거래 게시글 읽기 컨트롤러
		case "/MainPage/Read_Commerce.do":
			// 게시글번호를 가져오고 int로 변환한다
			postNum = Integer.parseInt(request.getParameter("no"));
			// 게시글 읽기 서비스 객체 생성
			Commerce_ReadArticleService MainreadService1 = new Commerce_ReadArticleService();
			CommerceArticleVO main_commerce_article_VO;
			try {
				// 읽기 서비스 메소드 getArticle을 통해 VO를 가져오고, 조회수를 1 늘린다.
				main_commerce_article_VO = MainreadService1.getArticle(postNum, true);
				request.setAttribute("commerce_article_VO", main_commerce_article_VO);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			// 게시글 코멘트 읽기
			Commerce_CommentAction MainPageca1 = new Commerce_CommentAction();
			List<CommentVO> main_commerce_comment_VO = null;
			try {
				main_commerce_comment_VO = MainPageca1.readExecute(request, response, postNum);
				request.setAttribute("commerce_comment_VO", main_commerce_comment_VO);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			str = "/view.board/Board_Commerce_purchase_3ja.jsp";
			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.board/Commerce_Search_Product.do":
			String search = request.getParameter("searchArea");
			String search_category = request.getParameter("category");
			System.out.println(search);
			System.out.println(search_category);
			request.setAttribute("search", search);
			CommerceInsert c5 = new CommerceInsert();
			try {
				if (search_category == null) {
					CommerceArticlePageVO articlePage8 = c5.search_product(request, response);

					request.setAttribute("articlePage", articlePage8);
				} else {
					CommerceArticlePageVO articlePage8 = c5.search_category_product(request, response);
					request.setAttribute("articlePage", articlePage8);
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			str = "/view.board/Board_Commerce_Search_Result.jsp";
			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);
			
		case "/view.community/Writer_Search.do":
			userNickName = request.getParameter("userNickName");
			if(userNickName == null) {
				System.out.println("frontController 파라미터 받기 실패");
				userNickName = (String) session.getAttribute("sessionNickName");
			}
			if(userNickName == null) {
				System.out.println("frontController 어트리뷰트 받기 실패");
				userNickName = "hiyo"; // 테스트용
			}
			System.out.println("frontcontroller sessionID = " + userNickName);
			
			al = new ArticleInfoList();

			try {
				articlePage = al.search_Writer(request, response, userNickName);
				request.setAttribute("articlePage", articlePage);
			} catch (Exception e) {
				e.printStackTrace();
			}

			
			str = "/view.community/Community_Writer_Writting.jsp";

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;
			
		// 작성자가 올린 댓글 보기 컨트롤러
		case "/view.community/Writer_Search_Comment.do":
			// CommentVO에 ID가 없어서 닉네임으로 검색
			userNickName = request.getParameter("userNickName");
			if(userNickName == null) {
				System.out.println("frontController 파라미터 받기 실패");
				userNickName = (String) session.getAttribute("sessionNickName");
			}
			if(userNickName == null) {
				System.out.println("frontController 어트리뷰트 받기 실패");
				userNickName = "hiyo"; // 테스트용
			}
			System.out.println("frontcontroller sessionID = " + userNickName);
			
			al = new ArticleInfoList();
			
			Community_CommentPage commentPage = null;
			
			try {
				commentPage = al.search_Writer_comment(request, response, userNickName);
				request.setAttribute("articlePage", commentPage);
			} catch (Exception e) {
				e.printStackTrace();
			}

			str = "/view.community/Community_Writer_Comment.jsp";

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;
		} // case-end
	} // http -end
}
