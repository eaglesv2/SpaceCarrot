package spacecarrotVO;

import java.sql.Blob;
import java.util.Date;

public class SpaceCarrotVO_Board_Commerce {
	private int Num; // 게시글넘버
	private String Category; // 카테고리
	private String Subject; // 글제목
	private String UserID; // 글쓴이
	private Blob RepImage; // 대표이미지 Represent 줄여서 Rep
	private int Price; // 가격
	private int Amount; // 수량
	private String Content; // 설명
	private Date RegDate; // 등록일
	private int Views; // 조회수
	
	public SpaceCarrotVO_Board_Commerce() { // 생성자
		
	}
	public SpaceCarrotVO_Board_Commerce(int Num, String Category, String Subject, String UserID,
			Blob RepImage, int Price, int Amount, String Content, Date RegDate, int Views) {
		this.Num = Num;
		this.Category = Category;
		this.Subject = Subject;
		this.UserID = UserID;
		this.RepImage = RepImage;
		this.Price = Price;
		this.Amount = Amount;
		this.Content = Content;
		this.RegDate = RegDate;
		this.Views = Views;
	}
	
	public SpaceCarrotVO_Board_Commerce(int Num, String Subject, Blob RepImage, int Price, Date RefDate, int Views) {
		this.Num = Num;
		this.Subject = Subject;
		this.RepImage = RepImage;
		this.Price = Price;
		this.Views = Views;
	}
	
	public SpaceCarrotVO_Board_Commerce(String Category, String Subject, String UserID, Blob RepImage, int Price,
			int Amount, String Content, Date RegDate) {
		this.Category = Category;
		this.Subject = Subject;
		this.UserID = UserID;
		this.RepImage = RepImage;
		this.Price = Price;
		this.Amount = Amount;
		this.Content = Content;
		this.RegDate = RegDate;
	}
	
	// getter, setter
	
	public int getNum() {
		return Num;
	}
	public void setNum(int num) {
		Num = num;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
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
	public Blob getRepImage() {
		return RepImage;
	}
	public void setRepImage(Blob repImage) {
		RepImage = repImage;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public int getViews() {
		return Views;
	}
	public void setViews(int views) {
		Views = views;
	}
	public Date getRegDate() {
		return RegDate;
	}
	public void setRegDate(Date regDate) {
		RegDate = regDate;
	}
}
