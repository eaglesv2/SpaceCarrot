package article.service;

import java.sql.SQLException;

import spacecarrotDAO.SpaceCarrotDAO_Board_Commerce;
import spacecarrotVO.SpaceCarrotVO_Board_Commerce;

public class Commerce_ReadArticleService {

	private SpaceCarrotDAO_Board_Commerce boardDao = null;
	
	public SpaceCarrotVO_Board_Commerce getArticle(int postNum, boolean increaseReadCount) throws ClassNotFoundException {
		try {
			boardDao = new SpaceCarrotDAO_Board_Commerce();
			// DAO를 통해 게시글넘버를 입력한 후 그에 맞는 VO를 가져온다.
			System.out.println("error1");
			SpaceCarrotVO_Board_Commerce VO_article = boardDao.getOnePost_Commerce(postNum);
			System.out.println("error2");
			if (VO_article == null) {
				// VO를 못 불러 왔을 시에 오류
				throw new ArticleContentNotFoundException();
			}
			if(increaseReadCount) {
				// 조회수 1씩 증가 메소드 실행
				boardDao.hitUpdate_Commerce(postNum);
			}
			return VO_article;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				boardDao.getAllInfoClose();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
