package telinfoVO;

import java.sql.Date;

public class TelInfoVO_SignUp { // 회원가입폼 VO
	private int UserSerial; // 유저시리얼
	private String UserName; // 유저이름
	private String UserID; // 아이디
	private String UserPW; // 패스워드
	private String UserGender; // 성별
	private Date UserBirth; // 생일
	private String UserTel; // 번호
	
	public TelInfoVO_SignUp() { // 생성자
		
	}
	
	public TelInfoVO_SignUp(int UserSerial, String UserName, String UserID, String UserPW, String UserGender,
			Date UserBirth, String UserTel) {
		this.UserSerial = UserSerial;
		this.UserName = UserName;
		this.UserID = UserID;
		this.UserPW = UserPW;
		this.UserGender = UserGender;
		this.UserBirth = UserBirth;
		this.UserTel = UserTel;
	}
	
	// getter, setter
	
	public int getUserSerial() {
		return UserSerial;
	}
	public void setUserSerial(int userSerial) {
		UserSerial = userSerial;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getUserPW() {
		return UserPW;
	}
	public void setUserPW(String userPW) {
		UserPW = userPW;
	}
	public String getUserGender() {
		return UserGender;
	}
	public void setUserGender(String userGender) {
		UserGender = userGender;
	}
	public Date getUserBirth() {
		return UserBirth;
	}
	public void setUserBirth(Date userBirth) {
		UserBirth = userBirth;
	}
	public String getUserTel() {
		return UserTel;
	}
	public void setUserTel(String userTel) {
		UserTel = userTel;
	}
	
}
