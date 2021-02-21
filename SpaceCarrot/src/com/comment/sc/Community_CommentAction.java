package com.comment.sc;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Community_CommentAction {

	public List<CommentVO> readExecute(HttpServletRequest request, HttpServletResponse response, int input_postNum) throws SQLException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 코멘트 읽기 
		
		// Dao에 넣은 변수 받아오기 
		int boardNum = input_postNum;
		
		Community_CommentDAO comdao = new Community_CommentDAO();
		List<CommentVO> commentVO = new ArrayList<>();
		commentVO = comdao.select(boardNum);
		comdao.getAllInfoClose();
		return commentVO;
	}
	
	public void insertExecute(HttpServletRequest request, HttpServletResponse response, int input_postNum, String input_content) throws SQLException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 코멘트 인서트
		HttpSession session = request.getSession();
		
		// Dao에 넣을 변수 받아오기
		int boardNum = input_postNum;
		String nickName = (String) session.getAttribute("sessionNickName");
		String content = input_content;
		
		Community_CommentDAO comdao = new Community_CommentDAO();
		
		comdao.insert_Comment(boardNum, nickName, content);
		comdao.getAllInfoClose();
	}
	
}
