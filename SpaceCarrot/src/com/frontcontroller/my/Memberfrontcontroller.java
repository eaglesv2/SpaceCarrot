package com.frontcontroller.my;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haeva.my.HaevaImpl;
import com.haeva.my.HaevaInsert;



/**
 * Servlet implementation class Sawonfrontcontroller
 */
// @WebServlet("/Sawonfrontcontroller")
@WebServlet("*.do") /*front controller*/
public class Memberfrontcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Memberfrontcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		System.out.println(request.getRequestURI());
		System.out.println(request.getContextPath());
		
		
		String c = request.getRequestURI().substring(request.getContextPath().length());
		
		String str = null;
		HaevaImpl h1 = null;
		
		switch (c) {
		case "/DBInsert.do" :
			h1 = new HaevaInsert();
			
			try {
				h1.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			str = "SignUpComplete.jsp";
			break;
		}
		
		
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
