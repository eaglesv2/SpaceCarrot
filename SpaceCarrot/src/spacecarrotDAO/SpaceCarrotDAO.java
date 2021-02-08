package spacecarrotDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import spacecarrotDBConn.SpaceCarrotDBConn;
import spacecarrotVO.SpaceCarrotVO;

public class SpaceCarrotDAO {
	private static Connection con;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	
	public SpaceCarrotDAO() throws ClassNotFoundException, SQLException {
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
	
	public ArrayList<SpaceCarrotVO> getAllInfo() throws SQLException{
		// 유저 전체 목록과 유저 정보를 불러오는 메소드
		ArrayList<SpaceCarrotVO> scarray = new ArrayList<SpaceCarrotVO>();
		String sql = "SELECT * FROM SC_USERLIST ORDER BY UserSerial";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int userSerial = rs.getInt("UserSerial");
			String userName = rs.getString("UserName");
			String userID = rs.getString("UserID");
			String userPW = rs.getString("UserPW");
			String userGender = rs.getString("UserGender");
			String userBirth = rs.getString("UserBirth");
			String userTel = rs.getString("UserTel");
			
			SpaceCarrotVO scv = new SpaceCarrotVO(userSerial, userName, userID, userPW, userGender, userBirth, userTel);
			
			scarray.add(scv);
		}
		return scarray;
	}
	
	public static void insertUserInfo(int input_userSerial, String input_userName, String input_userID,
			String input_userPW, String input_userGender, String input_userBirth, String input_userTel) throws SQLException {
		// 입력된 ID를 토대로 해당 유저의 정보를 원하는만큼 가져오는 메소드
		// public boolean?
		String sql = "INSERT INTO spacecarrot.SC_USERLIST "
				+ "(UserSerial, UserName, UserID, UserPW, UserGender, UserBirth, UserTel) VALUES(?, ?, ?, ?, ?, ?, ?);";

		pstmt = con.prepareStatement(sql);

		pstmt.setInt(1, input_userSerial);
		pstmt.setString(2, input_userName);
		pstmt.setString(3, input_userID);
		pstmt.setString(4, input_userPW);
		pstmt.setString(5, input_userGender);
		pstmt.setString(6, input_userBirth);
		pstmt.setString(7, input_userTel);
		ResultSet rs = pstmt.executeQuery();

		rs.close();
		pstmt.close();
	}
	
	public static void updateUserInfo(String update_userPW, String update_userBirth, String update_userTel, int userSerial) throws SQLException {
		// 유저 정보 수정하는 메소드 (비밀번호, 생일, 전화번호)
		 String sql = "UPDATE spacecarrot.SC_USERLIST SET UserPW=?, UserBirth=?, UserTel=? WHERE UserSerial=?";
		 
		 pstmt = con.prepareStatement(sql);
		 
		 pstmt.setString(1, update_userPW);
		 pstmt.setString(2, update_userBirth);
		 pstmt.setString(3, update_userTel);
		 pstmt.setInt(4, userSerial);
		 pstmt.executeUpdate();
	}
	
	public static void deleteUserInfo(int userSerial) throws SQLException {
		// 유저 정보 삭제하는 메소드
		String sql = "DELETE from spacecarrot.SC_USERLIST WHERE UserSerial=?";
		
		 pstmt = con.prepareStatement(sql);
		 pstmt.setInt(1, userSerial);
		 pstmt.executeUpdate();
	}
	
	public static boolean checkOverlapID(String input_userID) throws SQLException {
		// 입력된 ID 중복체크하는 메소드
		// true면 이미 존재하는 아이디, false면 새로운 아이디
		boolean result = true; // true 그대로 전달될 경우 중복된 아이디 <- 버그발생 가능

		String sql = "SELECT * FROM spacecarrot.SC_USERLIST WHERE UserID = ?";

		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, input_userID);
		rs = pstmt.executeQuery();

		if (!rs.last()) {
			result = false;
		}

		rs.close();
		pstmt.close();
		
		return result;
	}
	
	public static boolean checkPW(String input_userPW, String check_userPW) {
		// 비밀번호와 비밀번호 확인란에 입력한 값이 일치하는지 확인하는 메소드
		// true면 비밀번호 일치, false면 불일치 
		if(input_userPW.equals(check_userPW)) {
			return true;
		} else {
			return false;
		}
	}
}
