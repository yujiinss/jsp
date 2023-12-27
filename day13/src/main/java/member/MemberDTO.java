package member;

public class MemberDTO {

// USERID   VARCHAR2(500)   primary key, 
//	  USERPW    VARCHAR2(500)  NOT NULL, 
//	  USERNAME VARCHAR2(500) NOT NULL ,
//	  GENDER VARCHAR2(100) check  (gender in ('남성', '여성')),
//	  EMAIL VARCHAR2(100) 
	
	private String userId;
	private String userPw;
	private String userName;
	private String gender;
	private String email;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
	
}
