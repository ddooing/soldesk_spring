package kr.co.softsoldesk.Beans;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserBean {
   
   private boolean IdExist;
      private boolean NickExist;
      private boolean PassExist;
      private boolean userLogin;
      
      public UserBean() {
         this.IdExist = false;
         this.userLogin = false;
      }
      
   private int user_id;
      
      @Pattern(regexp = "[가-힣]{2,4}")
      private String name;
      
      @Size(min = 4, max = 20)
      @Pattern(regexp = "[a-zA-Z0-9]*")
      private String id;
      
      @Size(min = 6, max = 20)
      @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).*$")
      private String password;
      private String password2;


      @Size(min = 6, max = 20)
      @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).*$")
      private String icpassword;
      private String icpasscheck;
      
      @Size(min = 2, max = 8)
      private String nickname;
      
      @NotNull(message = "생년월일을 선택하세요.")
      private String birth;
      
      @NotNull(message = "성별을 선택하세요.")
      private String gender;
      
      @NotEmpty(message = "이메일은 필수 입력 항목입니다.")
      @Email
      private String email;
      
      private int point;
      
      @Pattern(regexp = "^\\d{11}$")
      private String telephone;
      private int exp;
      private String create_date;
      private String modify_date;
      private int state;
   
   
   // 테이블 외 조인 변수들
   private String grade;
    private String keyword;
   // 마이페이지용
   private int exp_to_next_level;
   private String next_grade;

public boolean isIdExist() {
	return IdExist;
}
public void setIdExist(boolean idExist) {
	IdExist = idExist;
}
public boolean isNickExist() {
	return NickExist;
}
public void setNickExist(boolean nickExist) {
	NickExist = nickExist;
}
public boolean isPassExist() {
	return PassExist;
}
public void setPassExist(boolean passExist) {
	PassExist = passExist;
}
public boolean isUserLogin() {
	return userLogin;
}
public void setUserLogin(boolean userLogin) {
	this.userLogin = userLogin;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
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
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getPassword2() {
	return password2;
}
public void setPassword2(String password2) {
	this.password2 = password2;
}
public String getIcpassword() {
	return icpassword;
}
public void setIcpassword(String icpassword) {
	this.icpassword = icpassword;
}
public String getIcpasscheck() {
	return icpasscheck;
}
public void setIcpasscheck(String icpasscheck) {
	this.icpasscheck = icpasscheck;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public String getBirth() {
	return birth;
}
public void setBirth(String birth) {
	this.birth = birth;
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
public int getPoint() {
	return point;
}
public void setPoint(int point) {
	this.point = point;
}
public String getTelephone() {
	return telephone;
}
public void setTelephone(String telephone) {
	this.telephone = telephone;
}
public int getExp() {
	return exp;
}
public void setExp(int exp) {
	this.exp = exp;
}
public String getCreate_date() {
	return create_date;
}
public void setCreate_date(String create_date) {
	this.create_date = create_date;
}
public String getModify_date() {
	return modify_date;
}
public void setModify_date(String modify_date) {
	this.modify_date = modify_date;
}
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}
public String getGrade() {
	return grade;
}
public void setGrade(String grade) {
	this.grade = grade;
}
public String getKeyword() {
	return keyword;
}
public void setKeyword(String keyword) {
	this.keyword = keyword;
}
public int getExp_to_next_level() {
	return exp_to_next_level;
}
public void setExp_to_next_level(int exp_to_next_level) {
	this.exp_to_next_level = exp_to_next_level;
}
public String getNext_grade() {
	return next_grade;
}
public void setNext_grade(String next_grade) {
	this.next_grade = next_grade;
}
   

}