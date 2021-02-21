package com.main.sc;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spacecarrotDAO.SpaceCarrotDAO_Board_Community;
import spacecarrotVO.SpaceCarrotVO_Board_Community;

public class MainAction {

	
	
	public List<SpaceCarrotVO_Board_Community> readExecute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException, ClassNotFoundException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 코멘트 읽기 
		
		SpaceCarrotDAO_Board_Community CommunityDAO = new SpaceCarrotDAO_Board_Community();
		List<SpaceCarrotVO_Board_Community> MainVO = new ArrayList<>();
		MainVO = CommunityDAO.getSubject_Community();
		CommunityDAO.getAllInfoClose();
		return MainVO;
	}
}
