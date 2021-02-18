package com.userinfo.sc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spacecarrotDAO.SpaceCarrotDAO_UserInfo;

public class MyPagePWCheck implements UserImpl {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;Charset=UTF-8");
		
		SpaceCarrotDAO_UserInfo sc = null;	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		sc = new SpaceCarrotDAO_UserInfo();
		
		response.getWriter().write(sc.loginCheck(id, pw) + "");
		System.out.println(sc.loginCheck(id, pw));

	}
}