package com.commerce.sc;

import java.sql.Blob;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import spacecarrotDAO.SpaceCarrotDAO_Board_Commerce;

public class CommerceInsert implements CommerceImpl {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		SpaceCarrotDAO_Board_Commerce sc = null;
		
		MultipartRequest multi = null;
		int sizeLimit = 10 *1024 * 1024;
		String savePath = request.getRealPath("/upload");
		
		try {
			multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String category = multi.getParameter("category");
		String subject = multi.getParameter("title");
		String userID = (String)session.getAttribute("sessionID");
		String repImage = multi.getParameter("file1");
		int amount = Integer.parseInt(multi.getParameter("amount"));
		int price = Integer.parseInt(multi.getParameter("price"));
		String content = multi.getParameter("content");
		
		sc = new SpaceCarrotDAO_Board_Commerce();
		sc.insertPost_Commerce(category, subject, userID, repImage, price, amount, content);
		RequestDispatcher rd1 = request.getRequestDispatcher("/view.board/Board_Commerce_List_Fashion.jsp");
		rd1.forward(request, response);
		/*response.sendRedirect("../view.login/SignUpComplete.jsp");*/
	}
}
