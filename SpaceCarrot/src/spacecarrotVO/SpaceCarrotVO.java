package spacecarrotVO;

public class SpaceCarrotVO {
	private int userSerial;
	private String userName;
	private String userID;
	private String userPW;
	private String userGender;
	private String userBirth;
	private String userTel;
	
	public SpaceCarrotVO() {
		
	}
	public SpaceCarrotVO(int userSerial, String userName, String userID, String userPW, String userGender, String userBirth, String userTel) {
		this.userSerial = userSerial;
		this.userName = userName;
		this.userID = userID;
		this.userPW = userPW;
		this.userGender = userGender;
		this.userBirth = userBirth;
		this.userTel = userTel;
	}
	public int getUserSerial() {
		return userSerial;
	}
	public void setUserSerial(int userSerial) {
		this.userSerial = userSerial;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
}
