package article.service;

import java.util.List;

import spacecarrotVO.SpaceCarrotVO_Board_Community;

public class Community_ArticlePage {

	private int total; // 게시글 총 수
	private int currentPage; // 현재 페이지
	private List<SpaceCarrotVO_Board_Community> content; // VO
	private int totalPages; // 전체페이지
	private int startPage; // 시작 페이지
	private int endPage; // 끝페이지

	public Community_ArticlePage(int total, int currentPage, int size, List<SpaceCarrotVO_Board_Community> content) {
		// 게시글 총 수, 현재 페이지, 게시글 사이즈, VO
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		if (total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPages = total / size;
			if (total % size > 0) {
				totalPages++;
			}
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			if (modVal == 0) startPage -= 5;
			
			endPage = startPage + 4;
			if (endPage > totalPages) endPage = totalPages;
		}
	}

	public int getTotal() {
		return total;
	}

	public boolean hasNoArticles() {
		return total == 0;
	}

	public boolean hasArticles() {
		return total > 0;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public List<SpaceCarrotVO_Board_Community> getContent() {
		return content;
	}

	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
}
