package com.comment.sc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import spacecarrotDBConn.SpaceCarrotDBConn;

public class CommentDAO {

	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public CommentDAO() {
		con = new SpaceCarrotDBConn().getConnection();
	}

	public void insert_Comment(int boardNum, String nickName, String content) throws SQLException {
		// BoardNum, NickName, Content
		String sql = "INSERT INTO SpaceCarrot.COMMENT_BOARD(COMMENT_BOARDNUM, COMMENT_NICKNAME, COMMENT_CONTENT) "
				+ " VALUES(?, ?, ?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNum);
		pstmt.setString(2, nickName);
		pstmt.setString(3, content);
		rs = pstmt.executeQuery();

		rs.close();
		pstmt.close();
		con.close();
	}

	public List<CommentVO> select(int boardNum) throws SQLException {

		String sql = "SELECT * FROM SpaceCarrot.COMMENT_BOARD WHERE COMMENT_BOARDNUM = ? ";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNum);
		rs = pstmt.executeQuery();

		System.out.println("CommentDAO .list select error1");
		List<CommentVO> VOList = new ArrayList<CommentVO>();
		while (rs.next()) {
			VOList.add(convertVO(rs));
		}
		System.out.println("CommentDAO .list select error2");
		return VOList;
	}

	private CommentVO convertVO(ResultSet rs) throws SQLException {
		// ResultSet을 VO에 담는 메소드!!
		return new CommentVO(rs.getInt("COMMENT_NUM"), rs.getInt("COMMENT_BOARDNUM"),
				rs.getString("COMMENT_NICKNAME"), rs.getString("COMMENT_CONTENT"));
	}
}
