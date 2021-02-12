package com.SCservlet.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import spacecarrotDAO.SpaceCarrotDAO_Board_Community;

/**
 * Servlet implementation class test_Board_Community
 */
@WebServlet("/testCommunityInsert/*")
public class testCommunityInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testCommunityInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		//out.print를 쓰기 위해..
		PrintWriter out = response.getWriter();
		
		
		 // 해당 폴더에 이미지를 저장시킨다 
		String uploadDir = "d:/upbang";

		out.println("절대경로 : " + uploadDir + "<br/>"); 
		
		// 총 100M 까지 저장 가능하게 함
		int maxSize = 1024 * 1024 * 10;
		String encoding = "euc-kr";
		
		// 사용자가 전송한 파일정보 토대로 업로드 장소에 파일 업로드 수행할 수 있게 함
		MultipartRequest multipartRequest
		= new MultipartRequest(request, uploadDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String subject = multipartRequest.getParameter("subject");
		String userID = multipartRequest.getParameter("userid");
		String content = multipartRequest.getParameter("content");
		File file = multipartRequest.getFile("file"); // 파일로 Request받아오기
		
		// 받아온 파일을 바이트로 변환
		byte[] fileContent = Files.readAllBytes(file.toPath());
		
		// 바이트를 Blob 형태로 변환
		Blob fileBlob = null;
		try {
			fileBlob = new javax.sql.rowset.serial.SerialBlob(fileContent);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		SpaceCarrotDAO_Board_Community scv = null;
		try {
			scv = new SpaceCarrotDAO_Board_Community();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		Boolean b = scv.insertPost_Community(subject, userID, content, fileBlob);
		
		if(b) {//true면 insert 되었으므로
			request.setAttribute("result1", "입력good");
		} else {
			request.setAttribute("result1", "입력오류");
		}
		
		
		RequestDispatcher rd1 = request.getRequestDispatcher("result.jsp");
		rd1.forward(request, response);
	}

}
