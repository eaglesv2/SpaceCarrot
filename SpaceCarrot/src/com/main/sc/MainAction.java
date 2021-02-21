package com.main.sc;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commerce.sc.CommerceArticleVO;

import spacecarrotDAO.SpaceCarrotDAO_Board_Commerce;
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
	
	public List<SpaceCarrotVO_Board_Community> readExecute_hot(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException, ClassNotFoundException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 코멘트 읽기 
		
		SpaceCarrotDAO_Board_Community CommunityDAO = new SpaceCarrotDAO_Board_Community();
		List<SpaceCarrotVO_Board_Community> MainVO = new ArrayList<>();
		MainVO = CommunityDAO.getHotSubject_Community();
		CommunityDAO.getAllInfoClose();
		return MainVO;
	}
	
	
	public List<CommerceArticleVO> commerce_readExecute(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 코멘트 읽기 
		
		SpaceCarrotDAO_Board_Commerce CommerceDAO = new SpaceCarrotDAO_Board_Commerce();
		List<CommerceArticleVO> MainCommerceVO = new ArrayList<>();
		MainCommerceVO = CommerceDAO.getSubject_Commerce();
		CommerceDAO.getAllInfoClose();
		return MainCommerceVO;
	}
}
