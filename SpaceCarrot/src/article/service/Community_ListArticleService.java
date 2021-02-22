package article.service;

import java.sql.SQLException;
import java.util.List;

import com.comment.sc.CommentVO;
import com.comment.sc.Community_CommentDAO;

import spacecarrotDAO.SpaceCarrotDAO_Board_Community;
import spacecarrotVO.SpaceCarrotVO_Board_Community;

public class Community_ListArticleService {

	private SpaceCarrotDAO_Board_Community boardDao = null;
	private int size = 15; // 한 페이지에 나타낼 게시글 수
	private Community_CommentDAO commentDao = null;
	
	public Community_ArticlePage getArticlePage(int pageNum) throws ClassNotFoundException {
		// pageNum에 해당하는 게시글 목록을 구한다. select() 첫번째 파라미터는 조회할 레코드의 시작행이다.
		try {
			boardDao = new SpaceCarrotDAO_Board_Community();
			int total = boardDao.selectCount();
			List<SpaceCarrotVO_Board_Community> content = boardDao.select(
					(pageNum - 1) * size, size);
			return new Community_ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Community_ArticlePage getArticlePage_search_Category(int pageNum, String input_category) throws ClassNotFoundException {
		// 카테고리 서치 한 후 ArticlePage로 반환
		try {
			String category = input_category;
			boardDao = new SpaceCarrotDAO_Board_Community();
			int total = boardDao.selectCount(category);
			List<SpaceCarrotVO_Board_Community> content = boardDao.select_Search_Category(category, (pageNum - 1) * size, size);
			return new Community_ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Community_ArticlePage getArticlePage_search(int pageNum, String searchArea) throws ClassNotFoundException {
		// 검색할 값을 입력 받은 후 ArticlePage로 반환
		String search = searchArea;
		try {
			boardDao = new SpaceCarrotDAO_Board_Community();
			int total = boardDao.selectCount_search(search);
			List<SpaceCarrotVO_Board_Community> content = boardDao.select_Search(search, (pageNum - 1) * size, size);
			return new Community_ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Community_ArticlePage getArticlePage_reset(int pageNum) throws ClassNotFoundException {
		// List 처음 들어왔을때 여기 메소드를 거쳐 VO를 가져감
		try {
			boardDao = new SpaceCarrotDAO_Board_Community();
			int total = boardDao.selectCount();
			List<SpaceCarrotVO_Board_Community> content = boardDao.select((pageNum - 1) * size, size);
			return new Community_ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}	
	
	public Community_ArticlePage getArticlePage_search_In_Category(int pageNum, String input_category, String input_search) throws ClassNotFoundException {
		// 카테고리 서치 한 후 ArticlePage로 반환
		try {
			String category = input_category;
			String search = input_search;
			boardDao = new SpaceCarrotDAO_Board_Community();
			int total = boardDao.selectCount(category, search);
			List<SpaceCarrotVO_Board_Community> content = boardDao.select_Search_Category(category, search, (pageNum - 1) * size, size);
			return new Community_ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Community_ArticlePage Writer_search(int pageNum, String input_UserNickName) throws ClassNotFoundException {
		// 글 작성자 게시글 검색 후 ArticlePage로 반환 
		try {
			String userNickName = input_UserNickName;
			boardDao = new SpaceCarrotDAO_Board_Community();
			int total = boardDao.selectCount_Writer(userNickName);
			// 테스트 System.out.println("List Page userID = " + userID);
			List<SpaceCarrotVO_Board_Community> content = boardDao.select_Search_Writer(userNickName, (pageNum - 1) * size, size);
			return new Community_ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Community_CommentPage Writer_search_comment(int pageNum, String input_UserNickName) throws ClassNotFoundException {
		// 글 작성자 댓글 검색 후 ArticlePage로 반환 
		try {
			String userNickName = input_UserNickName;
			commentDao = new Community_CommentDAO();
			int total = commentDao.selectCount_Writer_Comment(userNickName);
			// 테스트 System.out.println("List Page userID = " + userID);
			List<CommentVO> content = commentDao.select_Search_Writer_Comment(userNickName, (pageNum - 1) * size, size);
			return new Community_CommentPage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
