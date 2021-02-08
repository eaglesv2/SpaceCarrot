package spacecarrotDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import spacecarrotDBConn.SpaceCarrotDBConn;

public class SpaceCarrotDAO_Board {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public SpaceCarrotDAO_Board() throws ClassNotFoundException, SQLException {
		con = new SpaceCarrotDBConn().getConnection();
	}
	
	public void pstmtClose() throws SQLException {
		if(pstmt != null) {
			pstmt.close();
		}
	}
	
	public void getAllInfoClose() throws SQLException {
		if(rs != null) {
			rs.close();
		}
		if(pstmt != null) {
			pstmt.close();
		}
		if(con != null) {
			con.close();
		}
	}
	
	//커뮤니티 게시판
	
	//중고거래 게시판
}
