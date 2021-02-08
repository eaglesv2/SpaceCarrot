package telinfoVO;

import java.sql.Date;

public class TelInfoVO_BOARDLIST {

	private int bbsID; // 게시글 ID
	private String bbsTitle; // 게시글제목
	private String UserID; // 유저ID
	private Date bbsDate; // 게시글날짜
	private String bbsContent; // 게시글내용
	
	public TelInfoVO_BOARDLIST() { // 생성자
		
	}
	
	public TelInfoVO_BOARDLIST(int bbsID, String bbsTitle, String UserID, Date bbsDate, String bbsContent) {
		this.bbsID = bbsID;
		this.bbsTitle = bbsTitle;
		this.UserID = UserID;
		this.bbsDate = bbsDate;
		this.bbsContent = bbsContent;
	}

	// Getter, Setter
	
	public int getBbsID() {
		return bbsID;
	}

	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}

	public String getBbsTitle() {
		return bbsTitle;
	}

	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}

	public String getUserID() {
		return UserID;
	}

	public void setUserID(String userID) {
		UserID = userID;
	}

	public Date getBbsDate() {
		return bbsDate;
	}

	public void setBbsDate(Date bbsDate) {
		this.bbsDate = bbsDate;
	}

	public String getBbsContent() {
		return bbsContent;
	}

	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	
	
}
