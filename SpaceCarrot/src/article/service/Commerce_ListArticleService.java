package article.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.commerce.sc.CommerceArticlePageVO;
import com.commerce.sc.CommerceArticleVO;
import spacecarrotDAO.SpaceCarrotDAO_Board_Commerce;

	// 중고거래 게시글 리스트를 도와주는 클래스입니다
public class Commerce_ListArticleService {

	SpaceCarrotDAO_Board_Commerce boardDao = null;
	private int size = 9; // 한 페이지에 나타낼 게시글 수
	
	public CommerceArticlePageVO getArticlePage_reset(int pageNum) throws SQLException, IOException, ClassNotFoundException {
		boardDao = new SpaceCarrotDAO_Board_Commerce();
		int total = boardDao.selectCount();
		List<CommerceArticleVO> content = boardDao.select((pageNum - 1) * size, size);
		return new CommerceArticlePageVO(total, pageNum, size, content);
	}		
}