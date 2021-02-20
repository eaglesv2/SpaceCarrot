package com.userinfo.sc;

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
		String tel = request.getParameter("tel");
		String userID = request.getParameter("userID");
		
		sc = new SpaceCarrotDAO_UserInfo();
		sc.updateUserInfo(pw, nickname, tel, userID);
		RequestDispatcher rd1 = request.getRequestDispatcher("/view.mypage/Mypage_Modify_Menu.jsp");
		rd1.forward(request, response);
	}
}