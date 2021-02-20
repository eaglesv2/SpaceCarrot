package com.commerce.sc;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import spacecarrotDBConn.SpaceCarrotDBConn;

public class Commerce_DAO {

	private Connection con; // 연결 커넥트
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// DB 기본정보 상수
	private static final String DB_DBNAME = "SpaceCarrot";
	private static final String DB_DBNAME_SUFFIX = ".";

	// 각 컬럼명을 상수로 정의해놓은 부분 "BOARD_COMMERCE";
	private static final String DB_TABLE_BOARD_COMMERCE = "BOARD_COMMERCE"; // 커뮤니티 댓글 테이블 명
	public static final String COL_POSTNUM = "Num"; // 게시글 번호
	public static final String COL_CATEGORY = "Category"; // 게시글 카테고리
	public static final String COL_SUBJECT = "Subject"; // 게시글 제목
	public static final String COL_USERID = "UserID"; // 게시글 작성자
	public static final String COL_REPIMAGE = "RepImage"; // 게시글 대표 이미지
	public static final String COL_PRICE = "Price"; // 상품 가격
	public static final String COL_AMOUNT = "Amount"; // 상품 수량
	public static final String COL_CONTENT = "Content"; // 게시글 본문 내용
	public static final String COL_REGDATE = "RegDate"; // 게시글 작성 시간
	public static final String COL_VIEWS = "Views"; // 게시글 조회수

	public Commerce_DAO() { // 생성자
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

	public boolean insertPost_Commerce(String input_category, String input_subject, String input_userID,
			Blob input_repImage, int input_price, int input_amount, String input_content) {
		// 게시물 작성시 게시물 정보 DB에 저장  // 게시글넘버x, 작성일x, 조회수 x 디폴트가 있음
		String sql = "INSERT INTO " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMERCE + "(" + COL_CATEGORY + ", "
				+ COL_SUBJECT + ", " + COL_USERID + ", " + COL_REPIMAGE + ", " + COL_PRICE + ", " + COL_AMOUNT + ", "
				+ COL_CONTENT + ") VALUES(?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_category);
			pstmt.setString(2, input_subject);
			pstmt.setString(3, input_userID);
			pstmt.setBlob(4, input_repImage);
			pstmt.setInt(5, input_price);
			pstmt.setInt(6, input_amount);
			pstmt.setString(7, input_content);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("insert Exception");
			return false;
		}
		return true;
	}

	public List<CommerceArticleVO> select(int startRow, int size) throws IOException {
		// 1번부터 size 만큼의 게시글 수를 List에 담는 메소드
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMERCE + " ORDER BY "
				+ COL_POSTNUM + " desc limit ?, ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<CommerceArticleVO> result = new ArrayList<CommerceArticleVO>();

			result = convertVO(rs);
		
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	// ResultSet을 받아 List<VO>로 반환해주는 메소드입니다
	// 이미지를 String으로 변환하는 작업이 중간에 있습니다
	private List<CommerceArticleVO> convertVO(ResultSet rs) throws IOException {
		// ResultSet을 VO에 담는 메소드!!
		String b64 = null;
		List<CommerceArticleVO> ListVO = null;
		CommerceArticleVO vo = null;
		ListVO = new ArrayList<CommerceArticleVO>();
		try {
			while (rs.next()) {
				vo = new CommerceArticleVO();
				vo.setPostNum(rs.getInt(COL_POSTNUM));
				vo.setCategory(rs.getString(COL_CATEGORY));
				vo.setSubject(rs.getString(COL_SUBJECT));
				vo.setUserID(rs.getString(COL_USERID));
				/////////////////////
				InputStream in = rs.getBinaryStream("RepImage");
				BufferedImage bimg = ImageIO.read(in);
				in.close();
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				ImageIO.write(bimg, "jpg", baos);
				baos.flush();
				byte[] imageInByteArray = baos.toByteArray();
				baos.close();
				b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
				////////////////////
				vo.setRepImage(b64);
				vo.setPrice(rs.getInt(COL_PRICE));
				vo.setAmount(rs.getInt(COL_AMOUNT));
				vo.setContent(rs.getString(COL_CONTENT));
				vo.setRegDate(rs.getDate(COL_REGDATE));
				vo.setViews(rs.getInt(COL_VIEWS));
				
				ListVO.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ListVO;
	}

	public int selectCount() {
		// 게시글 수 int로 반환 메서드
		Statement stmt = null;
		String sql = "SELECT count(*) FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMERCE;

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
	
}
