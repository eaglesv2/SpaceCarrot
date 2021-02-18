package com.userinfo.sc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spacecarrotDAO.SpaceCarrotDAO_UserInfo;

public class UserLogin implements UserImpl {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;Charset=UTF-8");
		
		SpaceCarrotDAO_UserInfo sc = null;	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		sc = new SpaceCarrotDAO_UserInfo();
		int result = sc.loginCheck(id, pw);
		response.getWriter().write(sc.loginCheck(id, pw) + "");
		System.out.println(sc.loginCheck(id, pw));
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("sessionID", id);
			session.setAttribute("sessionNickName", sc.getNickName(id));
			System.out.println(id);
			/*response.sendRedirect("/main.html");*/
		}
	}
}