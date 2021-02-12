package spacecarrotDAO;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

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
   public static final String COL_SUBJECT = "Subject"; // 게시글 제목
   public static final String COL_USERID = "UserID"; // 게시글 작성자
   public static final String COL_CONTENT = "Content"; // 게시글 본문 내용
   public static final String COL_FILENAME = "FileName"; // 첨부자료
   public static final String COL_REGDATE = "RegDate"; // 게시글 작성 시간
   public static final String COL_VIEWS = "Views"; // 게시글 조회수
   
   public SpaceCarrotDAO_Board_Community() throws ClassNotFoundException, SQLException {
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
   

   
   public ArrayList<SpaceCarrotVO_Board_Community> getAllPost_Community() throws SQLException{
      //커뮤니티 게시판 거래 글 목록 불러오는 메소드 (게시글넘버, 제목, 작성자, 작성시간, 조회수)
      ArrayList<SpaceCarrotVO_Board_Community> scarray = new ArrayList<SpaceCarrotVO_Board_Community>();
      String sql = "SELECT * FROM " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " ORDER BY " + COL_REGDATE + "DESC";
      
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) {
         int postNum = rs.getInt(COL_POSTNUM);
         String subject = rs.getString(COL_SUBJECT);
         String userid = rs.getString(COL_USERID);
         Date regDate = rs.getDate(COL_REGDATE);
         int views = rs.getInt(COL_VIEWS);
         
         SpaceCarrotVO_Board_Community scv = new SpaceCarrotVO_Board_Community(postNum, subject, userid, regDate, views);
         
         scarray.add(scv);
      }
      return scarray;
   }
   
   public SpaceCarrotVO_Board_Community getOnePost_Community(int postNum) throws SQLException {
      //커뮤니티 게시판 글 선택했을 때 게시글 정보 불러오는 메소드 (제목, 작성자, 글 내용, 첨부파일, 작성일, 조회수)
      SpaceCarrotVO_Board_Community scv = null;
      String sql = "SELECT * FROM " +  DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " WHERE " + COL_POSTNUM + " = ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, postNum);
      rs = pstmt.executeQuery();
      if(rs.next()) {
         String subject = rs.getString(COL_SUBJECT);
         String userid = rs.getString(COL_USERID);
         String content = rs.getString(COL_CONTENT);
         Blob filename = rs.getBlob(COL_FILENAME);
         Date regDate = rs.getDate(COL_REGDATE);
         int views = rs.getInt(COL_VIEWS);
         scv = new SpaceCarrotVO_Board_Community(subject, userid, content, filename, regDate, views);
      } else {
         scv = null;
      }
      return scv;
   }
   
   public boolean insertPost_Community(String input_subject, String input_userID, String input_content,
                              Blob input_filename) {
      // 게시물 작성시 게시물 정보 DB에 저장 // 제목, 작성자, 내용, 첨부파일 // 게시글넘버x, 작성일x, 조회수 x 디폴트가 있음
      String sql = "INSERT INTO " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + "("  + 
                COL_SUBJECT + ", " +  COL_USERID + ", " + COL_CONTENT  + ", " + COL_FILENAME + 
                ") VALUES(?, ?, ?, ?)";
      
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, input_subject);
         pstmt.setString(2, input_userID);
         pstmt.setString(3, input_content);
         pstmt.setBlob(4, input_filename);
         rs = pstmt.executeQuery();
      } catch(SQLException e){
         System.out.println("insert Exception");
         return false;
      }
      return true;
   }
   
   public boolean updatePost_Community(int postNum, String update_subject, String update_content, Blob update_filename) {
      // 게시물 수정하는 메소드 //  글제목, 내용, 첨부파일  // 조건 WHERE 게시글넘버
      String sql = "UPDATE " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " SET " +
                 COL_SUBJECT + " = ?, " + COL_CONTENT + " = ?, " + COL_FILENAME + " = ? WHERE " + COL_POSTNUM + " = ?";
      
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, update_subject);
         pstmt.setString(2, update_content);
         pstmt.setBlob(3, update_filename);
         pstmt.setInt(4, postNum);
         rs = pstmt.executeQuery();
      } catch(SQLException e){
         System.out.println("insert Exception");
         return false;
      }
      return true;
   }
   
   public boolean deletePost_Community(int postNum) {
      // 커뮤니티 게시물을 삭제하는 메소드
      String sql = "DELETE from " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " WHERE " + COL_POSTNUM + " = ?";
      
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
   
   public boolean hitUpdate_Community(int postNum) {
	   // 게시물 조회수 업데이트
	   String sql = "UPDATE " + DB_DBNAME + DB_DBNAME_SUFFIX + DB_TABLE_BOARD_COMMUNITY + " SET " + COL_VIEWS + " = " + COL_VIEWS + " + 1 " + "WHERE " + COL_POSTNUM + " = ? ";
	   
	   try {
		   pstmt = con.prepareStatement(sql);
		   pstmt.setInt(1, postNum);
		   pstmt.executeUpdate();
		   System.out.println("hitUpdate Success");
	   } catch(SQLException e) {
		   System.out.println("hitUpdate Exception");
		   return false;
	   }
	   return true;
   }
   
   
}