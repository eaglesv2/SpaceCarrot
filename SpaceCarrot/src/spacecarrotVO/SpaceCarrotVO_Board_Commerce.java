package spacecarrotVO;

import java.sql.Blob;
import java.util.Date;

public class SpaceCarrotVO_Board_Commerce {
	private int postNum; // 게시글넘버
	private String category; // 카테고리
	private String subject; // 글제목
	private String userID; // 글쓴이
	private String userNickName; // 글쓴이 닉네임
	private Blob repImage; // 대표이미지 Represent 줄여서 Rep
	private int price; // 가격
	private int amount; // 수량
	private String content; // 설명
	private Date regDate; // 등록일
	private int views; // 조회수
	
	public SpaceCarrotVO_Board_Commerce() { // 생성자
		
	}
	
	public SpaceCarrotVO_Board_Commerce(int postNum, String category, String subject, String userID, String userNickName,
										Blob repImage, int price, int amount, String content, Date regDate, int views) {
		this.postNum = postNum;
		this.category = category;
		this.subject = subject;
		this.userID = userID;
		this.userNickName = userNickName;
		this.repImage = repImage;
		this.price = price;
		this.amount = amount;
		this.content = content;
		this.regDate = regDate;
		this.views = views;
	}
	
	public SpaceCarrotVO_Board_Commerce(int postNum, String subject, Blob repImage, int price, Date regDate, int views) {
		this.postNum = postNum;
		this.subject = subject;
		this.repImage = repImage;
		this.price = price;
		this.regDate = regDate;
		this.views = views;
	}
	
	public SpaceCarrotVO_Board_Commerce(String category, String subject, String userID,  String userNickName, 
										Blob repImage, int price, int amount, String content, Date regDate) {
		this.category = category;
		this.subject = subject;
		this.userID = userID;
		this.userNickName = userNickName;
		this.repImage = repImage;
		this.price = price;
		this.amount = amount;
		this.content = content;
		this.regDate = regDate;
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
	
	public Blob getRepImage() {
		return repImage;
	}

	public void setRepImage(Blob repImage) {
		this.repImage = repImage;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
