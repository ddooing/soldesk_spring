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
      @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$")
      private String password;
      
      @NotEmpty(message = "필수 입력 항목입니다.")
      @Size(min = 6, max = 20)
      @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$")
      private String password2;
      
      @NotEmpty(message = "필수 입력 항목입니다.")
      @Size(min = 6, max = 20)
      @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$")
      private String password3;
      
      private String crpassword;
      
      private String nickname;
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
   

}