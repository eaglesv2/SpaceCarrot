package com.commerce.sc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommerceImpl {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public CommerceArticlePageVO reset(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
