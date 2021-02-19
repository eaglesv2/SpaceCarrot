package com.commerce.sc;

import java.sql.Blob;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spacecarrotDAO.SpaceCarrotDAO_Board_Commerce;
import spacecarrotDAO.SpaceCarrotDAO_UserInfo;

public class CommerceInsert implements CommerceImpl {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		SpaceCarrotDAO_Board_Commerce sc = null;
		
		String category = request.getParameter("category");
		String subject = request.getParameter("title");
		String userID = (String)session.getAttribute("sessionID");
		Blob repImage = request.getParameter("file1");
		int amount = Integer.parseInt(request.getParameter("amount"));
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");
		
		sc = new SpaceCarrotDAO_Board_Commerce();
		sc.insertPost_Commerce(category, subject, userID, repImage, price, amount, content);
		RequestDispatcher rd1 = request.getRequestDispatcher("/view.board/Board_Commerce_List_Fashion.jsp");
		rd1.forward(request, response);
		/*response.sendRedirect("../view.login/SignUpComplete.jsp");*/
	}
}
