package com.commerce.sc;

import java.util.Date;
// repImage를 String값으로 반환하기 위해서 다른 VO클래스를 만들었습니다
public class CommerceArticleVO {

	private int postNum; // 게시글넘버
	private String category; // 카테고리
	private String subject; // 글제목
	private String userID; // 글쓴이
	private String repImage; // 대표이미지 Represent 줄여서 String base64형식으로 바뀜
	private int price; // 가격
	private int amount; // 수량
	private String content; // 설명
	private Date regDate; // 등록일
	private int views; // 조회수

	public CommerceArticleVO() { // 생성자
		
	}

	public CommerceArticleVO(int postNum, String category, String subject, String userID,
				String repImage, int price, int amount, String content, Date regDate, int views) { // 생성자
		this.postNum = postNum;
		this.category = category;
		this.subject = subject;
		this.userID = userID;
		this.repImage = repImage;
		this.price = price;
		this.amount = amount;
		this.content = content;
		this.regDate = regDate;
		this.views = views;
	}
	
	//getter, setter
	
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

	public String getRepImage() {
		return repImage;
	}

	public void setRepImage(String repImage) {
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
