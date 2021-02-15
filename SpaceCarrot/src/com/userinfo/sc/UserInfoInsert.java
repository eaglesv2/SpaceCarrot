package com.userinfo.sc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spacecarrotDAO.SpaceCarrotDAO_UserInfo;

public class UserInfoInsert implements UserImpl {
	public void userinfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		SpaceCarrotDAO_UserInfo sc = null;	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String tel = request.getParameter("tel");
		
		sc = new SpaceCarrotDAO_UserInfo();
		sc.insertUserInfo(id, pw, name, nickname, gender, birth, tel);
	}
}
