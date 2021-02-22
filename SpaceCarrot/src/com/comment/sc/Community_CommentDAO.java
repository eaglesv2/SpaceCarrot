package com.comment.sc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import spacecarrotDBConn.SpaceCarrotDBConn;
import spacecarrotVO.SpaceCarrotVO_Board_Community;

public class Community_CommentDAO {

	private Connection con; // 연결 커넥트
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// DB 기본정보 상수
	private static final String DB_DBNAME = "SpaceCarrot";
	private static final String DB_DBNAME_SUFFIX = ".";

	// 각 컬럼명을 상수로 정의해놓은 부분 "COMMUNITY_COMMENT";
	private static final String DB_TABLE_COMMUNITY_COMMENT = "COMMUNITY_COMMENT"; // 커뮤니티 댓글 테이블 명
	public static final String COL_COMMENTNUM = "COMMENT_NUM"; // 댓글 Serial
	public static final String COL_BOARDNUM = "COMMENT_BOARDNUM"; // 게시판 번호
	public static final String COL_NICKNAME = "COMMENT_NICKNAME"; // 작성자 닉네임
	public static final String COL_CONTENT = "COMMENT_CONTENT"; // 댓글 컨텐츠

	public Community_CommentDAO() { // 생성자
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
		String sql = "INSERT INTO " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_COMMUNITY_COMMENT + " (" + COL_BOARDNUM
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
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_COMMUNITY_COMMENT + " WHERE "
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

	// 작성자 검색시 총 댓글 반환 메소드
	public int selectCount_Writer_Comment(String input_UserNickName) {
		// 게시글 수 int로 반환 메서드
		String sql = "SELECT count(*) FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_COMMUNITY_COMMENT + " WHERE "
				+ COL_NICKNAME + " = ? "; 

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_UserNickName);
			rs = pstmt.executeQuery();
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
	
	public List<CommentVO> select_Search_Writer_Comment(String input_userNickName, int startRow, int size)
			throws SQLException {
		// 특정 작성자가 쓴 글을 찾는 메소드
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_COMMUNITY_COMMENT + " WHERE "
				+ COL_NICKNAME + " = ? ORDER BY " + COL_COMMENTNUM + " desc limit ?, ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_userNickName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, size);
			rs = pstmt.executeQuery();
			List<CommentVO> result = new ArrayList<CommentVO>();
			while (rs.next()) {
				result.add(convertVO(rs));
				System.out.println("select_Search success");
			}
			return result;
		} catch(SQLException e) {
			System.out.println("select_Search fail");
			e.printStackTrace();
			return null;
		} finally {

		}
	}
	
}
