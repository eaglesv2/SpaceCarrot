package article.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.commerce.sc.CommerceArticlePageVO;
import com.commerce.sc.CommerceArticleVO;
import com.commerce.sc.Commerce_DAO;
	// 중고거래 게시글 리스트를 도와주는 클래스입니다
public class Commerce_ListArticleService {

	Commerce_DAO boardDao = null;
	private int size = 9; // 한 페이지에 나타낼 게시글 수
	
	public CommerceArticlePageVO getArticlePage_reset(int pageNum) throws SQLException, IOException {
		boardDao = new Commerce_DAO();
		int total = boardDao.selectCount();
		List<CommerceArticleVO> content = boardDao.select((pageNum - 1) * size, size);
		return new CommerceArticlePageVO(total, pageNum, size, content);
	}		
}
