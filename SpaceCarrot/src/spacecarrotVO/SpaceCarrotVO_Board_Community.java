package spacecarrotVO;

import java.sql.Blob;
import java.util.Date;

public class SpaceCarrotVO_Board_Community {
	private int postNum; // 게시글 ID
	private String subject; // 게시글제목
	private String userID; // 유저ID
	private String content; // 게시글내용
	private Blob fileName; // 첨부파일
	private Date regDate; // 등록일
	private int views; // 조회수
	
	public SpaceCarrotVO_Board_Community() { // 생성자
		
	}
	
	public SpaceCarrotVO_Board_Community(int postNum, String subject, String userID, String content, 
			Blob fileName, Date regDate, int views) {
		this.postNum = postNum;
		this.subject = subject;
		this.userID = userID;
		this.content = content;
		this.fileName = fileName;
		this.regDate = regDate;
		this.views = views;
	}


	
	public SpaceCarrotVO_Board_Community(int postNum, String subject, String userID, Date regDate, int views) {
		this.postNum = postNum;
		this.subject = subject;
		this.userID = userID;
		this.regDate = regDate;
		this.views = views;
	}

	public SpaceCarrotVO_Board_Community(String subject, String userID, String content, Blob fileName,
										Date regDate, int views) {
		this.subject = subject;
		this.userID = userID;
		this.content = content;
		this.fileName = fileName;
		this.regDate = regDate;
		this.views = views;
	}

	// getter, setter
	
	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Blob getFileName() {
		return fileName;
	}

	public void setFileName(Blob fileName) {
		this.fileName = fileName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

}
