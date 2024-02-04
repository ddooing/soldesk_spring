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
	
	
	// 테이블 외 조인 변수들
	private String grade;
	
	// 마이페이지용
	private int exp_to_next_level;
	private String next_grade;
	

}
