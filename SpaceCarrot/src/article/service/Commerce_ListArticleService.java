package article.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.commerce.sc.CommerceArticlePageVO;
import com.commerce.sc.CommerceArticleVO;
import com.commerce.sc.Commerce_DAO;

public class Commerce_ListArticleService {
	
	Commerce_DAO boardDao = null;
	private int size = 9; // 한 페이지에 나타낼 게시글 수
	
	public CommerceArticlePageVO getArticlePage_reset(int pageNum) throws SQLException, IOException {
		boardDao = new Commerce_DAO();
		System.out.println("error4");
		int total = boardDao.selectCount();
		System.out.println("error5");
		List<CommerceArticleVO> content = boardDao.select((pageNum - 1) * size, size);
		System.out.println("error11");
		return new CommerceArticlePageVO(total, pageNum, size, content);
	}		
}
