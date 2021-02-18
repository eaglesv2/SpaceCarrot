package com.userinfo.sc;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spacecarrotDAO.SpaceCarrotDAO_UserInfo;

public class UserInfoUpdate implements UserImpl {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		SpaceCarrotDAO_UserInfo sc = null;	
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		String birth = request.getParameter("birth");
		String tel = request.getParameter("tel");
		String userID = request.getParameter("userId");
		sc = new SpaceCarrotDAO_UserInfo();
		sc.updateUserInfo(pw, nickname, birth, tel, userID);
		
		try {
			sc =new SpaceCarrotDAO_UserInfo();
			
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		try {
			sc.updateUserInfo(pw, nickname, birth, tel,userID);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}