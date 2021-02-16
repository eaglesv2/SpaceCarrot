package spacecarrotVO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SpaceCarrotVO_Board_Community {
	private int postNum; // 게시글 ID
	private String category; // 게시판 카테고리
	private String subject; // 게시글제목
	private String userID; // 유저ID
	private String userNickName; // 유저닉네임
	private String content; // 게시글내용
	private String regDate; // 등록일
	private int views; // 조회수
	
	public SpaceCarrotVO_Board_Community(String category, String title, String content) { // 생성자
		this.category = category;
		this.subject = title;
		this.content = content;
	}
	
	public SpaceCarrotVO_Board_Community(int postNum, String category, String subject, String userID, String userNickName, String content, 
			String regDate, int views) {
		this.postNum = postNum;
		this.category = category;
		this.subject = subject;
		this.userID = userID;
		this.userNickName = userNickName;
		this.content = content;
		this.regDate = regDate;
		this.views = views;
	}

	public SpaceCarrotVO_Board_Community(int postNum, String subject, String userID, String regDate, int views) {
		this.postNum = postNum;
		this.subject = subject;
		this.userID = userID;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = toSdate(regDate);
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	private String toSdate(Date regDate) {
		String sDate = new SimpleDateFormat("MM.dd").format(regDate);
		return sDate;
	}
}
