package com.comment.sc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import spacecarrotDBConn.SpaceCarrotDBConn;

public class Commerce_CommentDAO {

	private Connection con; // 연결 커넥트
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// DB 기본정보 상수
	private static final String DB_DBNAME = "SpaceCarrot";
	private static final String DB_DBNAME_SUFFIX = ".";

	// 각 컬럼명을 상수로 정의해놓은 부분 "COMMUNITY_COMMENT";
	private static final String DB_TABLE_COMMERCE_COMMENT = "COMMERCE_COMMENT"; // 커뮤니티 댓글 테이블 명
	public static final String COL_COMMENTNUM = "COMMERCE_NUM"; // 댓글 Serial
	public static final String COL_BOARDNUM = "COMMERCE_BOARDNUM"; // 게시판 번호
	public static final String COL_NICKNAME = "COMMERCE_NICKNAME"; // 작성자 닉네임
	public static final String COL_CONTENT = "COMMERCE_CONTENT"; // 댓글 컨텐츠

	public Commerce_CommentDAO() { // 생성자
		con = new SpaceCarrotDBConn().getConnection();
	}

	public void getAllInfoClose() {
		// DB 접속 완료되면 끊기
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

	public void insert_Comment(int boardNum, String nickName, String content) throws SQLException {
		// 댓글 인서트 메서드 // 게시글번호, 닉네임, 컨텐츠를 입력한다 반환값은 x
		String sql = "INSERT INTO " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_COMMERCE_COMMENT + " (" + COL_BOARDNUM
				+ ", " + COL_NICKNAME + ", " + COL_CONTENT + " ) VALUES(?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, nickName);
			pstmt.setString(3, content);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}

	}

	public List<CommentVO> select(int boardNum) throws SQLException {
		// 게시글번호를 입력받아 VO의 리스트로 반환한다
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_COMMERCE_COMMENT + " WHERE "
				+ COL_BOARDNUM + " = ? ";
		List<CommentVO> VOList = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();

			// VO의 List 객체 생성
			VOList = new ArrayList<CommentVO>();

			while (rs.next()) {
				// ResultSet값을 VO로 변환하고 List에 값을 추가한다
				VOList.add(convertVO(rs));
			}
		} finally {

		}
		return VOList;
	}

	private CommentVO convertVO(ResultSet rs) throws SQLException {
		// ResultSet을 VO에 담는 메소드!!
		return new CommentVO(rs.getInt(COL_COMMENTNUM), rs.getInt(COL_BOARDNUM), rs.getString(COL_NICKNAME),
				rs.getString(COL_CONTENT));
	}

}
