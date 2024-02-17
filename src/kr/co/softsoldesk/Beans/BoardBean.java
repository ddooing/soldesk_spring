package kr.co.softsoldesk.Beans;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardBean {
   
	private int board_id; // 게시판번호
    private int user_id; // 작성자
    @NotBlank
    private String title; // 제목
    private String create_date;   // 등록일자
    private int views;
    @NotBlank
    private String contents; // 내용
    private String update_date;   // 수정날짜
    private int state;
    
    private String nickname;
    
    
     
}
   