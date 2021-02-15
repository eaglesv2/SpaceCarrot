package com.haeva.my;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spacecarrotDAO.SpaceCarrotDAO_UserInfo;


public class HaevaInsert implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		SpaceCarrotDAO_UserInfo tidao = null;
		
		String userID = request.getParameter("userid");
		String userName = request.getParameter("username");
		String userPW = request.getParameter("userpw");
		String userGender = request.getParameter("usergender");
		String userBirth = request.getParameter("userbirth");
		String userTel = request.getParameter("usertel");
		
		tidao = new SpaceCarrotDAO_UserInfo();

		tidao.insertUserInfo(userName, userID, userPW, userGender, userBirth, userTel);

		
	}
	
}