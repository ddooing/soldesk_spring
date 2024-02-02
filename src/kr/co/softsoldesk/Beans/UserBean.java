package kr.co.softsoldesk.Beans;

import javax.validation.constraints.Email;
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
      this.point = 0;
   }
   
   private int user_id;
   
   @Pattern(regexp = "[가-힣]{2,4}")
   private String name;
   
   @Size(min = 4, max = 20)
   @Pattern(regexp = "[a-zA-Z0-9]*")
   private String id;
   
   @Size(min = 6, max = 20)
   @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$")
   private String password;
   
   @Size(min = 6, max = 20)
   @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$")
   private String password2;
   
   @Size(min = 6, max = 20)
   @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$")
   private String password3;
   
   private String crpassword;
   
   private String nickname;
   private String birth;
   private String gender;
   
   @Email
   private String email;
   
   private int point;
   private String telephone;
   private int exp;
   private String create_date;
   private String modify_date;
   private int state;
   
}