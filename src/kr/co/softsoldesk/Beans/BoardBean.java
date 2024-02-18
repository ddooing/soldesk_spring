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
    
    // 쿼리문추가 
    private String nickname;
    private String user_name;
    
 	//?
 	private int total_count;
 	private int state_1_count;
 	private int state_0_count;
 	
 	private int row_number;
    
    
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	public int getState_1_count() {
		return state_1_count;
	}
	public void setState_1_count(int state_1_count) {
		this.state_1_count = state_1_count;
	}
	public int getState_0_count() {
		return state_0_count;
	}
	public void setState_0_count(int state_0_count) {
		this.state_0_count = state_0_count;
	}
	public int getRow_number() {
		return row_number;
	}
	public void setRow_number(int row_number) {
		this.row_number = row_number;
	}

    
     
}
   