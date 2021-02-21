package spacecarrotDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import spacecarrotDBConn.SpaceCarrotDBConn;
import spacecarrotVO.SpaceCarrotVO_Board_Community;

public class SpaceCarrotDAO_Board_Community {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// DB 기본정보 상수
	private static final String DB_DBNAME = "SpaceCarrot";
	private static final String DB_DBNAME_SUFFIX = ".";

	// 각 컬럼명을 상수로 정의해놓은 부분 "BOARD_COMMUNITY";
	private static final String DB_TABLE_BOARD_COMMUNITY = "BOARD_COMMUNITY"; // 커뮤니티 게시판 테이블 명
	public static final String COL_POSTNUM = "Num"; // 게시글 번호
	public static final String COL_CATEGORY = "Category"; // 게시판 카테고리
	public static final String COL_SUBJECT = "Subject"; // 게시글 제목
	public static final String COL_USERID = "UserID"; // 게시글 작성자
	public static final String COL_USERNICKNAME = "UserNickName"; // 작성자닉네임
	public static final String COL_CONTENT = "Content"; // 게시글 본문 내용
	public static final String COL_REGDATE = "RegDate"; // 게시글 작성 시간
	public static final String COL_VIEWS = "Views"; // 게시글 조회수

	public SpaceCarrotDAO_Board_Community() throws ClassNotFoundException, SQLException {
		con = new SpaceCarrotDBConn().getConnection();
	}

	public void pstmtClose() throws SQLException {
		if (pstmt != null) {
			pstmt.close();
		}
	}

	public void getAllInfoClose() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<SpaceCarrotVO_Board_Community> getAllPost_Community() throws SQLException {
		// 커뮤니티 게시판 거래 글 목록 불러오는 메소드 (게시글넘버, 제목, 작성자, 작성시간, 조회수)
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " ORDER BY "
				+ COL_REGDATE + " DESC";
		List<SpaceCarrotVO_Board_Community> result = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			result = new ArrayList<SpaceCarrotVO_Board_Community>();
			while (rs.next()) {
				result.add(convertArticle(rs));
			}
			return result;
		} finally {

		}
	}

	public ResultSet getAllPost_Community2() throws SQLException {
		// 커뮤니티 게시판 거래 글 목록 불러오는 메소드 (게시글넘버, 제목, 작성자, 작성시간, 조회수)
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " ORDER BY "
				+ COL_REGDATE + " DESC";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			return rs;
		} finally {

		}
	}

	public SpaceCarrotVO_Board_Community getOnePost_Community(int postNum) throws SQLException {
		// 커뮤니티 게시판 글 선택했을 때 게시글 정보 불러오는 메소드 (제목, 카테고리, 작성자, 닉네임, 글 내용, 작성일, 조회수)
		SpaceCarrotVO_Board_Community scv = null;
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " WHERE "
				+ COL_POSTNUM + " = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				scv = convertArticle(rs);
			} else {
				scv = null;
			}
		} finally {

		}
		return scv;
	}

	public void insertPost_Community(String input_category, String input_userID, String input_userNickName,
			String input_subject, String input_content) {
		// 게시물 작성 카테고리, 유저아이디, 제목, 내용
		String sql = "INSERT INTO " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + "(" + COL_CATEGORY
				+ ", " + COL_USERID + ", " + COL_USERNICKNAME + ", " + COL_SUBJECT + ", " + COL_CONTENT
				+ ") VALUES(?, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_category);
			pstmt.setString(2, input_userID);
			pstmt.setString(3, input_userNickName);
			pstmt.setString(4, input_subject);
			pstmt.setString(5, input_content);
			rs = pstmt.executeQuery();
			System.out.println("insert success");
		} catch (SQLException e) {
			System.out.println("insert Exception");
		} finally {

		}
	}

	/*
	 * public boolean updatePost_Community(int postNum, String update_subject,
	 * String update_content, Blob update_filename) { // 게시물 수정하는 메소드 // 글제목, 내용,
	 * 첨부파일 // 조건 WHERE 게시글넘버 String sql = "UPDATE " + DB_DBNAME + DB_DBNAME_SUFFIX
	 * + DB_TABLE_BOARD_COMMUNITY + " SET " + COL_SUBJECT + " = ?, " + COL_CONTENT +
	 * " = ?, " + COL_FILENAME + " = ? WHERE " + COL_POSTNUM + " = ?";
	 * 
	 * try { pstmt = con.prepareStatement(sql); pstmt.setString(1, update_subject);
	 * pstmt.setString(2, update_content); pstmt.setBlob(3, update_filename);
	 * pstmt.setInt(4, postNum); rs = pstmt.executeQuery(); } catch(SQLException e){
	 * System.out.println("insert Exception"); return false; } return true; }
	 */
	public boolean deletePost_Community(int postNum) {
		// 커뮤니티 게시물을 삭제하는 메소드
		String sql = "DELETE from " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " WHERE " + COL_POSTNUM
				+ " = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			System.out.println("delete Exception");
			return false;
		} finally {

		}
	}

	public void hitUpdate_Community(int postNum) {
		// 게시물 조회수 업데이트
		String sql = "UPDATE " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " SET " + COL_VIEWS + " = "
				+ COL_VIEWS + " + 1 " + "WHERE " + COL_POSTNUM + " = ? ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			pstmt.executeUpdate();
			System.out.println("hitUpdate Success");
		} catch (SQLException e) {
			System.out.println("hitUpdate Exception");
		} finally {

		}
	}

	public int selectCount() {
		// 게시글 수 int로 반환 메서드
		Statement stmt = null;
		String sql = "SELECT count(*) FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				System.out.println("count success");
				return rs.getInt(1);
			}
			return 0;
		} catch (SQLException e) {
			System.out.println("count Exception");
			return 0;
		} catch (NullPointerException e) {
			System.out.println("nullpointerror");
			return 0;
		} finally {

		}
	}
// 카테고리 총 게시글 카운트 메소드
	public int selectCount(String category) {
		// 게시글 수 int로 반환 메서드
		Statement stmt = null;
		String sql = "SELECT count(*) FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " WHERE " + COL_CATEGORY + " = ? ";
		
		try {
			pstmt = con.prepareStatement(category);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery(sql);
			if (rs.next()) {
				System.out.println("count success");
				return rs.getInt(1);
			}
			return 0;
		} catch (SQLException e) {
			System.out.println("count Exception");
			return 0;
		} catch (NullPointerException e) {
			System.out.println("nullpointerror");
			return 0;
		} finally {

		}
	}
	public List<SpaceCarrotVO_Board_Community> select(int startRow, int size) throws SQLException {
		// 1번부터 size 만큼의 게시글 수를 List에 담는 메소드
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " ORDER BY "
				+ COL_POSTNUM + " desc limit ?, ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<SpaceCarrotVO_Board_Community> result = new ArrayList<SpaceCarrotVO_Board_Community>();
			while (rs.next()) {
				result.add(convertArticle(rs));
			}
			return result;
		} finally {

		}
	}

	private SpaceCarrotVO_Board_Community convertArticle(ResultSet rs) throws SQLException {
		// ResultSet을 VO에 담는 메소드!!
		return new SpaceCarrotVO_Board_Community(rs.getInt(COL_POSTNUM), rs.getString(COL_CATEGORY),
				rs.getString(COL_SUBJECT), rs.getString(COL_USERID), rs.getString(COL_USERNICKNAME),
				rs.getString(COL_CONTENT), toDate(rs.getTimestamp(COL_REGDATE)), rs.getInt(COL_VIEWS));
	}

	private String toDate(Date regDate) {
		// Date 형식을 SimpleDateFormat을 통해 String으로 바꿈
		String sDate = new SimpleDateFormat("yy.MM.dd").format(regDate);
		return sDate;
	}

	public List<SpaceCarrotVO_Board_Community> select_Search_Category(String input_Category, int startRow, int size)
			throws SQLException {
		// 특정카테고리를 찾는 메소드
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " WHERE "
				+ COL_CATEGORY + " = ? ORDER BY " + COL_POSTNUM + " desc limit ?, ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_Category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, size);
			rs = pstmt.executeQuery();
			List<SpaceCarrotVO_Board_Community> result = new ArrayList<SpaceCarrotVO_Board_Community>();
			while (rs.next()) {
				result.add(convertArticle(rs));
				System.out.println("select_Search success");
			}
			return result;
		} finally {

		}
	}

	public List<SpaceCarrotVO_Board_Community> select_Search(String input_Search, int startRow, int size)
			throws SQLException {
		// 특정 제목을 찾는 메소드 like % ? % 를 쓰기 위해서 concat을 사용했다
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " WHERE "
				+ COL_SUBJECT + " like concat ('%', ?, '%') ORDER BY " + COL_POSTNUM + " desc limit ?, ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_Search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, size);
			rs = pstmt.executeQuery();
			List<SpaceCarrotVO_Board_Community> result = new ArrayList<SpaceCarrotVO_Board_Community>();
			while (rs.next()) {
				result.add(convertArticle(rs));
			}
			return result;
		} finally {

		}
	}
	// 메인에 커뮤니티 게시판 글 올리는 메소드
	public List<SpaceCarrotVO_Board_Community> getSubject_Community() throws SQLException {
       
        String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " ORDER BY "
                + COL_POSTNUM + " DESC LIMIT 5";
        List<SpaceCarrotVO_Board_Community> result = null;
        try {
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            result = new ArrayList<SpaceCarrotVO_Board_Community>();
            while (rs.next()) {
                result.add(convertArticle(rs));
            }
            return result;
        } finally {

        }
	}
}