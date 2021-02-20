package article.service;

import java.sql.SQLException;

import spacecarrotDAO.SpaceCarrotDAO_Board_Community;
import spacecarrotVO.SpaceCarrotVO_Board_Community;

public class Community_ReadArticleService {

	private SpaceCarrotDAO_Board_Community boardDao = null;
	
	public SpaceCarrotVO_Board_Community getArticle(int postNum, boolean increaseReadCount) throws ClassNotFoundException, SQLException {
		try {
			boardDao = new SpaceCarrotDAO_Board_Community();
			// DAO를 통해 게시글넘버를 입력한 후 그에 맞는 VO를 가져온다.
			System.out.println("error1");
			SpaceCarrotVO_Board_Community VO_article = boardDao.getOnePost_Community(postNum);
			System.out.println("error2");
			if (VO_article == null) {
				// VO를 못 불러 왔을 시에 오류
				throw new ArticleContentNotFoundException();
			}
			if(increaseReadCount) {
				// 조회수 1씩 증가 메소드 실행
				boardDao.hitUpdate_Community(postNum);
			}
			return VO_article;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		} finally {
			boardDao.getAllInfoClose();
		}
	}
}
