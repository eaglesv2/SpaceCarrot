package spacecarrotVO;

import java.util.Date;

public class SpaceCarrotVO_Board_Community {
	private int Num; // 게시글 ID
	private String Subject; // 게시글제목
	private String UserID; // 유저ID
	private String Content; // 게시글내용
	private String FileName; // 첨부파일
	private Date RegDate; // 등록일
	private int Views; // 조회수
	
	public SpaceCarrotVO_Board_Community() { // 생성자
		
	}
	
	public SpaceCarrotVO_Board_Community(int Num, String Subject, String UserID, String Content, String FileName, Date RegDate, int Views) {
		this.Num = Num;
		this.Subject = Subject;
		this.UserID = UserID;
		this.Content = Content;
		this.FileName = FileName;
		this.RegDate = RegDate;
		this.Views = Views;
	}

	// getter, setter
	
	public int getNum() {
		return Num;
	}

	public void setNum(int num) {
		Num = num;
	}

	public String getSubject() {
		return Subject;
	}

	public void setSubject(String subject) {
		Subject = subject;
	}

	public String getUserID() {
		return UserID;
	}

	public void setUserID(String userID) {
		UserID = userID;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getFileName() {
		return FileName;
	}

	public void setFileName(String fileName) {
		FileName = fileName;
	}

	public Date getRegDate() {
		return RegDate;
	}

	public void setRegDate(Date regDate) {
		RegDate = regDate;
	}

	public int getViews() {
		return Views;
	}

	public void setViews(int views) {
		Views = views;
	}
}
