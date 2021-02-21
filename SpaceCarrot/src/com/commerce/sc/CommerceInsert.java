package com.commerce.sc;

import java.io.File;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import java.nio.file.Files;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.apache.tomcat.util.http.fileupload.FileUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import article.service.Commerce_ListArticleService;
import article.service.Community_ArticlePage;
import article.service.Community_ListArticleService;
import spacecarrotDAO.SpaceCarrotDAO_Board_Commerce;

public class CommerceInsert {
	// 클래스 이름 바꿔야할듯
	// 리스트페이징서비스를 위한 객체공간 생성	
	Commerce_ListArticleService listService = null;
	// 페이징처리 객체
	CommerceArticlePageVO articlePage = null;

	// 중고거래 게시판에 글 썼을때, 리퀘스트를 가져와 VO에 넣고 DB에 등록하는 메소드입니다
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, SerialException, SQLException, ClassNotFoundException, ServletException {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		SpaceCarrotDAO_Board_Commerce sc = null;
		
		MultipartRequest multi = null;
		int sizeLimit = 10 *1024 * 1024;
		String savePath = request.getRealPath("/upload");
		System.out.println(savePath);
		try {
			multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String category = multi.getParameter("category");
		String subject = multi.getParameter("title");
		String userID = (String)session.getAttribute("sessionID");
		String userNickName = (String)session.getAttribute("sessionNickName");
		//파일로 받아오기
		File repImageFile = multi.getFile("file1");
		//파일 to byte[]
		byte[] rep = Files.readAllBytes(repImageFile.toPath());
		//byte[] to blob
		Blob repImage = new javax.sql.rowset.serial.SerialBlob(rep);
		int amount = Integer.parseInt(multi.getParameter("amount"));
		int price = Integer.parseInt(multi.getParameter("price"));
		String content = multi.getParameter("content");
		
		sc = new SpaceCarrotDAO_Board_Commerce();
		sc.insertPost_Commerce(category, subject, userID, userNickName, repImage, price, amount, content);
		RequestDispatcher rd1 = request.getRequestDispatcher("/view.board/Board_Commerce_List_Fashion.jsp");
		rd1.forward(request, response);
		/*response.sendRedirect("../view.login/SignUpComplete.jsp");*/
	}
	
	// 중고거래 게시판 입장했을 때, 새로고침을 해주는 메소드입니다. 게시글을 보여주는 역할을 합니다
	public CommerceArticlePageVO reset(HttpServletRequest request, HttpServletResponse response) throws IOException, SerialException, SQLException, ClassNotFoundException {
		// 게시판에서 특정 검색어에 해당되는 게시글을 반환한다.
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// 페이지 넘버
		String pageNoVal = request.getParameter("pageNo");
		
		// 현재페이지를 입력해 ArticlePage 객체 정보를 가져온다
		listService = new Commerce_ListArticleService();
	
		// 현재페이지 넘버 구하기 만약 받아올 pageNo가 없다면 1로 설정
		int pageNo = 1;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		articlePage = listService.getArticlePage_reset(pageNo);
		return articlePage;
	}
	
}
