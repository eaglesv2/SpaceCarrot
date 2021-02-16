package article.service;

import java.sql.SQLException;
import java.util.List;

import spacecarrotDAO.SpaceCarrotDAO_Board_Community;
import spacecarrotVO.SpaceCarrotVO_Board_Community;

public class ListArticleService {

	private SpaceCarrotDAO_Board_Community boardDao = null;
	private int size = 10;

	public ArticlePage getArticlePage(int pageNum) throws ClassNotFoundException {
		
		try {
			boardDao = new SpaceCarrotDAO_Board_Community();
			int total = boardDao.selectCount();
			List<SpaceCarrotVO_Board_Community> content = boardDao.select(
					(pageNum - 1) * size, size);
			return new ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
