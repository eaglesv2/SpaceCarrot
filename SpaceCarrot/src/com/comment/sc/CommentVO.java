package com.comment.sc;

public class CommentVO {

	public int num; // 댓글 serial Auto Increment
	public int boardnum; // 게시글 넘버, 받아와야 함
	public String nickName; // 닉네임
	public String content; // 글 내용
	
	public CommentVO() { // 생성자
	
	}
	
	public CommentVO(int num, int boardnum, String Nick, String content) { // 생성자
		this.num = num;
		this.boardnum = boardnum;
		this.nickName = Nick;
		this.content = content;
	}

	public int getnum() {
		return num;
	}

	public void setnum(int num) {
		this.num = num;
	}

	public int getboardnum() {
		return boardnum;
	}

	public void setboardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getnickName() {
		return nickName;
	}

	public void setnickName(String nickName) {
		this.nickName = nickName;
	}

	public String getcontent() {
		return content;
	}

	public void setcontent(String content) {
		this.content = content;
	}
	
	
	
}
