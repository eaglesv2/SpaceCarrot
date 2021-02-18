package com.userinfo.sc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spacecarrotDAO.SpaceCarrotDAO_UserInfo;

public class UserLogin implements UserImpl {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		SpaceCarrotDAO_UserInfo sc = null;	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		sc = new SpaceCarrotDAO_UserInfo();
		response.getWriter().write(sc.loginCheck(id, pw) + "");

	}
}