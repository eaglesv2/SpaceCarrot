package com.userinfo.sc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserImpl {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}