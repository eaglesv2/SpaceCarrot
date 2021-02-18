package com.article.sc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.Community_ArticlePage;

public interface ArticleImpl {
// Article Controller 인터페이스
	public Community_ArticlePage execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
