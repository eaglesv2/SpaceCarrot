package spacecarrotDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import spacecarrotDBConn.SpaceCarrotDBConn;
import spacecarrotVO.SpaceCarrotVO_UserInfo;

public class SpaceCarrotDAO_UserInfo {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// DB 기본정보 상수
	private static final String DB_DBNAME = "SpaceCarrot";
	private static final String DB_DBNAME_SUFFIX = ".";
	
	// 각 컬럼명을 상수로 정의해놓은 부분 "SC_USERLIST";
	private static final String DB_TABLE_USERLIST = "SC_USERLIST";
	public static final String COL_SERIAL = "UserSerial"; // 유저 Serial
	public static final String COL_USERNAME = "UserName"; // 유저 이름
	public static final String COL_USERID = "UserID"; // 유저 아이디
	public static final String COL_USERPW = "UserPW"; // 유저 비밀번호
	public static final String COL_USERNICKNAME = "UserNickName"; // 유저 닉네임
	public static final String COL_USERGENDER = "UserGender"; // 유저 성별
	public static final String COL_USERBIRTH = "UserBirth"; // 유저 생일
	public static final String COL_USERTEL = "UserTel"; // 유저 전화번호
	
	
	public SpaceCarrotDAO_UserInfo() throws ClassNotFoundException, SQLException {
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
	
	public ArrayList<SpaceCarrotVO_UserInfo> getAllInfo() throws SQLException{
		// 유저 전체 목록과 유저 정보를 불러오는 메소드
		ArrayList<SpaceCarrotVO_UserInfo> scarray = new ArrayList<SpaceCarrotVO_UserInfo>();
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_USERLIST + " ORDER BY " + COL_SERIAL;
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int userSerial = rs.getInt(COL_SERIAL);
			String userName = rs.getString(COL_USERNAME);
			String userID = rs.getString(COL_USERID);
			String userPW = rs.getString(COL_USERPW);
			String userNickName = rs.getString(COL_USERNICKNAME);
			String userGender = rs.getString(COL_USERGENDER);
			String userBirth = rs.getString(COL_USERBIRTH);
			String userTel = rs.getString(COL_USERTEL);
			
			SpaceCarrotVO_UserInfo scv = new SpaceCarrotVO_UserInfo(userSerial, userName, userID, userPW, userNickName, userGender, userBirth, userTel);
			
			scarray.add(scv);
		}
		return scarray;
	}
	
	public SpaceCarrotVO_UserInfo getInfo(String search_name) throws SQLException {
		// 유저 정보 검색하는 메소드
		SpaceCarrotVO_UserInfo scv = null;
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_USERLIST + " WHERE " + COL_USERNAME + " = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, search_name);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			int userSerial = rs.getInt(1);
			String userName = rs.getString(2);
			String userID = rs.getString(3);
			String userPW = rs.getString(4);
			String userNickName = rs.getString(5);
			String userGender = rs.getString(6);
			String userBirth = rs.getString(7);
			String userTel = rs.getString(8);
			scv = new SpaceCarrotVO_UserInfo(userSerial, userName, userID, userPW, userNickName, userGender, userBirth, userTel);
		}else {
			scv = null;
		}
		return scv;
	}
	
	public boolean insertUserInfo(String input_userName, String input_userID,
			String input_userPW, String input_userNickName, String input_userGender, String input_userBirth, String input_userTel){
		// 회원가입시 유저의 입력 정보를 DB에 저장하는 메소드
		// public boolean?
		String sql = "INSERT INTO " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_USERLIST + "(" +  
					 COL_USERNAME + ", " + COL_USERID + ", " + COL_USERPW + ", " + COL_USERNICKNAME + ", " +
					 COL_USERGENDER + ", " + COL_USERBIRTH + ", " + COL_USERTEL + ") VALUES(?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_userName);
			pstmt.setString(2, input_userID);
			pstmt.setString(3, input_userPW);
			pstmt.setString(4, input_userNickName);
			pstmt.setString(5, input_userGender);
			pstmt.setString(6, input_userBirth);
			pstmt.setString(7, input_userTel);
			rs = pstmt.executeQuery();
		} catch(SQLException e){
			System.out.println("insert Exception");
			return false;
		}
		return true;
	}
	
	public boolean updateUserInfo(String update_userPW, String update_userNickName, String update_userBirth, String update_userTel, int userSerial) {
		// 유저 정보 수정하는 메소드 (비밀번호, 생일, 전화번호)
		 String sql = "UPDATE " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_USERLIST + " SET " +
				 	  COL_USERPW + " = ?, " + COL_USERNICKNAME + " = ?, " + COL_USERBIRTH + " = ?, " + 
				 	  COL_USERTEL + " = ? WHERE " + COL_SERIAL + " = ?";
		 
		 try {
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, update_userPW);
			 pstmt.setString(2, update_userNickName);
			 pstmt.setString(3, update_userBirth);
			 pstmt.setString(4, update_userTel);
			 pstmt.setInt(5, userSerial);
			 pstmt.executeUpdate();
		 } catch(SQLException e){
				System.out.println("update Exception");
				return false;
			}
			return true;
	}
	
	public boolean deleteUserInfo(int userSerial) {
		// 유저 정보 삭제하는 메소드
		String sql = "DELETE from " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_USERLIST + " WHERE " + COL_SERIAL + " = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userSerial);
			pstmt.executeUpdate();
		} catch(SQLException e){
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}
	
	public boolean checkOverlapID(String input_userID) throws SQLException {
		// 입력된 ID 중복체크하는 메소드
		// true면 이미 존재하는 아이디, false면 새로운 아이디
		boolean result = true; // true 그대로 전달될 경우 중복된 아이디 <- 버그발생 가능

		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_USERLIST + " WHERE " + COL_USERID + " = ?";

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
	
	public boolean checkPW(String input_userPW, String check_userPW) {
		// 비밀번호와 비밀번호 확인란에 입력한 값이 일치하는지 확인하는 메소드
		// true면 비밀번호 일치, false면 불일치 
		if(input_userPW.equals(check_userPW)) {
			return true;
		} else {
			return false;
		}
	}
}
