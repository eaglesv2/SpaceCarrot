package com.comment.sc;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommentAction {

	public List<CommentVO> readExecute(HttpServletRequest request, HttpServletResponse response, int postNum) throws SQLException {
		
//		HttpSession session = request.getSession();
		
		/*String boardsNum = request.getParameter("no");
		if(boardsNum != null) {
			System.out.println(boardsNum);
		}*/
		int boardNum = postNum;
		System.out.println(postNum);
//		String sessionNickName = (String) session.getAttribute("sessionNickName");
		
		CommentDAO comdao = new CommentDAO();
		List<CommentVO> commentVO = new ArrayList<>();
		commentVO = comdao.select(boardNum);
		
		return commentVO;
	}
	
	public void insertExecute(HttpServletRequest request, HttpServletResponse response, int input_postNum, String input_content) throws SQLException {
		
		HttpSession session = request.getSession();
		int boardNum = input_postNum;
		
		String nickName = (String) session.getAttribute("sessionNickName");
		String content = input_content;
		
		
		CommentDAO comdao = new CommentDAO();
		
		comdao.insert_Comment(boardNum, nickName, content);
		
	}
	
}
