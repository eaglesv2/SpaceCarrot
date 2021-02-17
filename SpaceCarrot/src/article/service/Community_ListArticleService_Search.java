package article.service;

import java.sql.SQLException;
import java.util.List;

import spacecarrotDAO.SpaceCarrotDAO_Board_Community;
import spacecarrotVO.SpaceCarrotVO_Board_Community;

public class Community_ListArticleService_Search {

	private SpaceCarrotDAO_Board_Community boardDao = null;
	private int size = 15; // 한 페이지에 나타낼 게시글 수

	public Community_ArticlePage getArticlePage(int pageNum, String searchArea) throws ClassNotFoundException {
		// pageNum에 해당하는 게시글 목록을 구한다. select() 첫번째 파라미터는 조회할 레코드의 시작행이다.
		try {
			boardDao = new SpaceCarrotDAO_Board_Community();
			int total = boardDao.selectCount();
			List<SpaceCarrotVO_Board_Community> content = boardDao.select_Search(searchArea, (pageNum - 1) * size, size);
			return new Community_ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
