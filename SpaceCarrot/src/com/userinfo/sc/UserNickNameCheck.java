package com.userinfo.sc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spacecarrotDAO.SpaceCarrotDAO_UserInfo;

public class UserNickNameCheck implements UserImpl {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;Charset=UTF-8");
		
		SpaceCarrotDAO_UserInfo sc = null;	
		String nickname = request.getParameter("nickname").trim();
		
		sc = new SpaceCarrotDAO_UserInfo();
		response.getWriter().write(sc.checkOverlapNickName(nickname) + "");
		System.out.println(sc.checkOverlapNickName(nickname));
		
	}
}