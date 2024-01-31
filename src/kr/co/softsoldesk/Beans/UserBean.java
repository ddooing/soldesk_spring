package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserBean {
	
	private boolean userIdExist;
	private boolean userLogin;
	
	public UserBean() {
		this.userIdExist = false;
		this.userLogin = false;
	}
	
	private int user_id;
	private String id;
	private String name;
	private String password;
	private String password2;
	private String nickname;
	private String birth;
	private String gender;
	private String email;
	private int point;
	private String telephone;
	private int exp;
	private String create_date;
	private String modify_date;
	private int state;

	public boolean isUserIdExist() {
		return userIdExist;
	}
	public void setUserIdExist(boolean userIdExist) {
		this.userIdExist = userIdExist;
	}
	public boolean isUserLogin() {
		return userLogin;
	}
	public void setUserLogin(boolean userLogin) {
		this.userLogin = userLogin;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPw2() {
		return pw2;
	}
	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}
	
	
	

}
