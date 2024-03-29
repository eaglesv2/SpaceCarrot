package spacecarrotVO;

public class SpaceCarrotVO_UserInfo {
	private int userSerial;
	private String userName;
	private String userID;
	private String userPW;
	private String userNickName;
	private String userGender;
	private String userBirth;
	private String userTel;
	
	public SpaceCarrotVO_UserInfo() {
		
	}
	public SpaceCarrotVO_UserInfo(int userSerial, String userName, String userID, String userPW, String userNickName, String userGender, String userBirth, String userTel) {
		this.userSerial = userSerial;
		this.userName = userName;
		this.userID = userID;
		this.userPW = userPW;
		this.userNickName = userNickName;
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
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
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
