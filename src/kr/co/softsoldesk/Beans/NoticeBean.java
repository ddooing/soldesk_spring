package kr.co.softsoldesk.Beans;

import java.util.Date;

import javax.validation.constraints.NotBlank;


public class NoticeBean {
	 private int notice_id; // 공지사항 ID
	 @NotBlank
	 private String title; // 제목
	 private String create_date; // 생성 날짜
	 private int views; // 조회수
	 @NotBlank
	 private String contents; // 내용
	 private String update_date; // 수정 날짜
	 private int state;
	 
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
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
	
	 
	 
}
