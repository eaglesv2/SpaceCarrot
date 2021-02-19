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
import com.comment.sc.CommentAction;
import com.comment.sc.CommentVO;
import com.commerce.sc.CommerceImpl;
import com.commerce.sc.CommerceInsert;
import com.userinfo.sc.MyPagePWCheck;
import com.userinfo.sc.UserIDCheck;
import com.userinfo.sc.UserImpl;
import com.userinfo.sc.UserInfoInsert;
import com.userinfo.sc.UserInfoUpdate;
import com.userinfo.sc.UserLogin;
import com.userinfo.sc.UserNickNameCheck;

import article.service.Community_ArticlePage;
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

		String str = null;
		UserImpl u1 = null;

		ArticleInfoList al = null;

		CommerceImpl c1 = null;

		// 게시판 객체
		Community_ArticlePage articlePage = null;
		// 게시판 이동 Dispatcher 속성
		RequestDispatcher rd = null;
		// 게시글 글 들어왔는지 확인하는 속성
		Object articleCheck;

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

			al = new ArticleInfoList();

			try {
				articlePage = al.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// setAttribute
			request.setAttribute("articlePage", articlePage);

			// setAttribute 잘 되었나 확인
			articleCheck = request.getAttribute("articlePage");

			if (articleCheck != null) {
				System.out.println("setAttribute 성공");
				str = "/view.community/Community_List.jsp";
			} else {
				System.out.println("setAttribute 실패");
				str = "/view.community/error.jsp";
			}

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.community/Category_Community.do":

			al = new ArticleInfoList();

			try {
				articlePage = al.execute_search_Category(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// setAttribute
			request.setAttribute("articlePage", articlePage);

			// setAttribute 잘 되었나 확인
			articleCheck = request.getAttribute("articlePage");

			if (articleCheck != null) {
				System.out.println("category setAttribute 성공");
				str = "/view.community/Community_List.jsp";
			} else {
				System.out.println("category setAttribute 실패");
				str = "/view.community/error.jsp";
			}

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.community/Search_Community.do":

			al = new ArticleInfoList();

			try {
				articlePage = al.execute_search(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// setAttribute
			request.setAttribute("articlePage", articlePage);

			// setAttribute 잘 되었나 확인
			articleCheck = request.getAttribute("articlePage");

			if (articleCheck != null) {
				System.out.println("search setAttribute 성공");
				str = "/view.community/Community_List.jsp";
			} else {
				System.out.println("search setAttribute 실패");
				str = "/view.community/error.jsp";
			}

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		// 게시글 읽기 컨트롤러
		case "/view.community/Read_Community.do":
			// test
			System.out.println("디스패처확인");
			// 게시글 읽기 서비스 객체 생성
			Community_ReadArticleService readService = new Community_ReadArticleService();

			// 게시글번호를 가져오고 int로 변환한다
			String noVal = request.getParameter("no");
			int postNum = Integer.parseInt(noVal);

			// VO
			SpaceCarrotVO_Board_Community article_VO;
			try {
				// 읽기 서비스 메소드 getArticle을 통해 VO를 가져오고, 조회수를 1 늘린다.
				article_VO = readService.getArticle(postNum, true);
				// VO 객체를 attribute
				request.setAttribute("article_VO", article_VO);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			System.out.println("error1");
			CommentAction ca = new CommentAction();
			List<CommentVO> commentVO = null;
			try {
				// test
				System.out.println("error2");
				commentVO = ca.readExecute(request, response, postNum);
				request.setAttribute("comment_VO", commentVO);
				// test
				if (request.getAttribute("comment_VO") != null) {
					System.out.println("VO 들어옴");
				}
				// test
				System.out.println("error3");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// test
			System.out.println("error4");

			str = "/view.community/Community_Comment_3ja.jsp";

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.board/CommerceInsert.do":
			c1 = new CommerceInsert();

			try {
				c1.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		case "/view.community/Reset_Community.do":

			al = new ArticleInfoList();

			try {
				articlePage = al.reset(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// setAttribute
			request.setAttribute("articlePage", articlePage);

			// setAttribute 잘 되었나 확인
			articleCheck = request.getAttribute("articlePage");

			if (articleCheck != null) {
				System.out.println("category setAttribute 성공");
				str = "/view.community/Community_List.jsp";
			} else {
				System.out.println("category setAttribute 실패");
				str = "/view.community/error.jsp";
			}

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		case "/view.community/Comment_Community.do":
			// 게시글번호를 가져오고 int로 변환한다
			String postsno = request.getParameter("no");
			int postNum1 = Integer.parseInt(postsno);

			String content = request.getParameter("text");

			CommentAction ca1 = new CommentAction();
			try {
				ca1.insertExecute(request, response, postNum1, content);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.setAttribute("no", postNum1);
			str = "/view.community/Community_Comment_3ja.jsp";

			rd = request.getRequestDispatcher(str);
			rd.forward(request, response);

			break;

		} // case-end

	} // http -end
}
