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

import com.article.sc.ArticleInfoList;
import com.comment.sc.CommentAction;
import com.comment.sc.CommentVO;
import com.commerce.sc.CommerceArticlePageVO;
import com.commerce.sc.CommerceArticleVO;
import com.commerce.sc.CommerceInsert;
import com.userinfo.sc.MyPagePWCheck;
import com.userinfo.sc.UserIDCheck;
import com.userinfo.sc.UserImpl;
import com.userinfo.sc.UserInfoInsert;
import com.userinfo.sc.UserInfoUpdate;
import com.userinfo.sc.UserLogin;
import com.userinfo.sc.UserNickNameCheck;

import article.service.Commerce_ReadArticleService;
import article.service.Community_ArticlePage;
import article.service.Community_ReadArticleService;
import spacecarrotVO.SpaceCarrotVO_Board_Commerce;
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

		String str = null;
		UserImpl u1 = null;
		ArticleInfoList al = null;

		// 게시판 객체
		Community_ArticlePage articlePage = null;
		// 게시판 이동 Dispatcher 속성
		RequestDispatcher rd = null;
		// 공통변수
		int postNum;

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

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.community/Category_Community.do":
			// 커뮤니티 카테고리 검색시
			al = new ArticleInfoList();

			try {
				articlePage = al.execute_search_Category(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("articlePage", articlePage);

			str = "/view.community/Community_List.jsp";

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.community/Search_Community.do":
			// 게시글 검색시 (제목으로 검색)
			al = new ArticleInfoList();

			try {
				articlePage = al.execute_search(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("articlePage", articlePage);

			str = "/view.community/Community_List.jsp";

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

			str = "/view.community/Community_List.jsp";

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		// 커뮤니티 게시글 읽기 컨트롤러
		case "/view.community/Read_Community.do":
			// 게시글번호를 가져오고 int로 변환한다
			postNum = Integer.parseInt(request.getParameter("no"));

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
			CommentAction ca = new CommentAction();
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
			String content = request.getParameter("text");

			CommentAction ca1 = new CommentAction();
			try {
				ca1.insertExecute(request, response, postNum, content);
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
				CommerceArticleVO article_VO1;
				try {
					// 읽기 서비스 메소드 getArticle을 통해 VO를 가져오고, 조회수를 1 늘린다.
					article_VO1 = readService1.getArticle(postNum, true);
					request.setAttribute("article_VO1", article_VO1);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}

				// 게시글 코멘트 읽기
				CommentAction ca3 = new CommentAction();
				List<CommentVO> commentVO3 = null;
				try {
					commentVO3 = ca3.readExecute(request, response, postNum);
					request.setAttribute("comment_VO3", commentVO3);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				str = "/view.board/Board_Commerce_purchase_3ja.jsp";

				rd = request.getRequestDispatcher(str);
				rd.forward(request, response);
				break;
			case "/view.board/Search_Category_Commerce.do":
				
				String category = (String) request.getParameter("category");
				if(category == null) {
				category = (String) request.getAttribute("category");
				}
				
				CommerceInsert c3 = new CommerceInsert();
				
				System.out.println(category);
				
				try {
					CommerceArticlePageVO articlePage5 = c3.search_category(request, response);
					request.setAttribute("articlePage", articlePage5);
					str = "Board_Commerce_List_Book.jsp";
				} catch (ClassNotFoundException | SQLException e) {
					request.setAttribute("articlePage", articlePage);
					str = "error.jsp";
					e.printStackTrace();
				}

				rd = request.getRequestDispatcher(str);
				rd.forward(request, response);

				break;
				
		} // case-end
	} // http -end
}
