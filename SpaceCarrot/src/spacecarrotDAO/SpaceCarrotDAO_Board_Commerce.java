package spacecarrotDAO;

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
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;

import com.comment.sc.CommentVO;
import com.commerce.sc.CommerceArticleVO;

import spacecarrotDBConn.SpaceCarrotDBConn;
import spacecarrotVO.SpaceCarrotVO_Board_Commerce;

public class SpaceCarrotDAO_Board_Commerce {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// DB 기본정보 상수
	private static final String DB_DBNAME = "SpaceCarrot";
	private static final String DB_DBNAME_SUFFIX = ".";
	
	// 각 컬럼명을 상수로 정의해놓은 부분 "BOARD_COMMERCE";
	private static final String DB_TABLE_BOARD_COMMERCE = "BOARD_COMMERCE"; // 중고거래 게시판 테이블 명
	public static final String COL_POSTNUM = "Num"; // 게시글 번호
	public static final String COL_CATEGORY = "Category"; // 게시글 카테고리
	public static final String COL_SUBJECT = "Subject"; // 게시글 제목
	public static final String COL_USERID = "UserID"; // 게시글 작성자
	public static final String COL_USERNICKNAME = "UserNickName"; // 게시글 작성자 닉네임
	public static final String COL_REPIMAGE = "RepImage"; // 게시글 대표 이미지
	public static final String COL_PRICE = "Price"; // 상품 가격
	public static final String COL_AMOUNT = "Amount"; // 상품 수량
	public static final String COL_CONTENT = "Content"; // 게시글 본문 내용
	public static final String COL_REGDATE = "RegDate"; // 게시글 작성 시간
	public static final String COL_VIEWS = "Views"; // 게시글 조회수
	
	public SpaceCarrotDAO_Board_Commerce() throws ClassNotFoundException, SQLException {
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

	
	public ArrayList<SpaceCarrotVO_Board_Commerce> getAllPost_Commerce() throws SQLException{
		//중고거래 게시판 거래 글 목록 불러오는 메소드 (대표이미지, 제목, 가격, 시간)
		ArrayList<SpaceCarrotVO_Board_Commerce> scarray = new ArrayList<SpaceCarrotVO_Board_Commerce>();
		String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMERCE + " ORDER BY " + COL_REGDATE + "DESC";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int postNum = rs.getInt(COL_POSTNUM);
			String subject = rs.getString(COL_SUBJECT);
			Blob repImage = rs.getBlob(COL_REPIMAGE);
			int price = rs.getInt(COL_PRICE);
			Date regDate = rs.getDate(COL_REGDATE);
			int views = rs.getInt(COL_VIEWS);
			
			SpaceCarrotVO_Board_Commerce scv = new SpaceCarrotVO_Board_Commerce(postNum, subject, repImage, price, regDate, views);
			
			scarray.add(scv);
		}
		return scarray;
	}
	
	public SpaceCarrotVO_Board_Commerce getOnePost_Commerce(int postNum) throws SQLException {
		//중고거래 게시판 글 선택했을 때 게시글 정보 불러오는 메소드 (카테고리, 제목, 작성자, 이미지, 가격, 수량, 글 내용, 작성일) 
		SpaceCarrotVO_Board_Commerce scv = null;
		String sql = "SELECT * FROM " +  DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMERCE + " WHERE " + COL_POSTNUM + " = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, postNum);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String category = rs.getString(COL_CATEGORY);
			String subject = rs.getString(COL_SUBJECT);
			String UserID = rs.getString(COL_USERID);
			String UserNickName = rs.getString(COL_USERNICKNAME);
			Blob repImage = rs.getBlob(COL_REPIMAGE);
			int price = rs.getInt(COL_PRICE);
			int amount = rs.getInt(COL_AMOUNT);
			String content = rs.getString(COL_CONTENT);
			Date regDate = rs.getDate(COL_REGDATE);
			scv = new SpaceCarrotVO_Board_Commerce(category, subject, UserID, UserNickName, repImage, price, amount, content, regDate);
		} else {
			scv = null;
		}
		return scv;
	}
	
	public boolean insertPost_Commerce(String input_category, String input_subject, String input_userID, String input_userNickName,
									   Blob input_repImage, int input_price, int input_amount, String input_content) {
		// 게시물 작성시 게시물 정보 DB에 저장  // 게시글넘버x, 작성일x, 조회수 x 디폴트가 있음
		String sql = "INSERT INTO " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMERCE + "("  + 
					 COL_CATEGORY + ", " + COL_SUBJECT + ", " + COL_USERID + ", " + COL_USERNICKNAME + ", " + COL_REPIMAGE  + ", "
					 + COL_PRICE + ", " + COL_AMOUNT  + ", " + COL_CONTENT + ") VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_category);
			pstmt.setString(2, input_subject);
			pstmt.setString(3, input_userID);
			pstmt.setString(4, input_userNickName);
			pstmt.setBlob(5, input_repImage);
			pstmt.setInt(6, input_price);
			pstmt.setInt(7, input_amount);
			pstmt.setString(8, input_content);
			rs = pstmt.executeQuery();
		} catch(SQLException e){
			System.out.println("insert Exception");
			return false;
		}
		return true;
	}
	
	public boolean updatePost_Commerce(int postNum, String update_category, String update_subject, Blob update_repImage, 
									   int update_price, int update_amount, String update_content) {
		// 게시물 수정하는 메소드
		String sql = "UPDATE " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMERCE + " SET " +
				     COL_CATEGORY + " = ?, " + COL_SUBJECT + " = ?, " + COL_REPIMAGE + " = ?, " +
				     COL_PRICE + " = ?, " + COL_AMOUNT + " = ?, " + COL_CONTENT + " = ? WHERE " + COL_POSTNUM + " = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, update_category);
			pstmt.setString(2, update_subject);
			pstmt.setBlob(3, update_repImage);
			pstmt.setInt(4, update_price);
			pstmt.setInt(5, update_amount);
			pstmt.setString(6, update_content);
			pstmt.setInt(7, postNum);
			rs = pstmt.executeQuery();
		} catch(SQLException e){
			System.out.println("insert Exception");
			return false;
		}
		return true;
	}
	
	public boolean deletePost_Commerce(int postNum) {
		// 중고거래 게시물을 삭제하는 메소드
		String sql = "DELETE FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMERCE + " WHERE " + COL_POSTNUM + " = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			pstmt.executeUpdate();
		} catch(SQLException e){
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}
	
	public void hitUpdate_Commerce(int postNum) {
		// 게시물 조회수 업데이트
		String sql = "UPDATE " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMERCE + " SET " + COL_VIEWS + " = "
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
