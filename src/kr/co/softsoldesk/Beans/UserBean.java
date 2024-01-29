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
	
	private int user_idx;
	private String name;
	private String id;
	private String pw;
	private String pw2;
	
	private String nick;
	private String birth;
	private String gender;
	private String email;
	
	
	private int point;
	private String tel;
	private int exp;
	private String create_date;
	private String modify_date;
	private int state;
}
