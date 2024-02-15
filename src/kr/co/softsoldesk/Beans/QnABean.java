package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class QnABean {
	
	private int qna_id;
	private int user_id;
	private String title;
	private String regdate;
	private String contents;
	private String reply;
	private int state;
	
	
	// 쿼리문 추가 변수
	private String nickname;
	
	private int total_count;
	private int state_1_count;
	private int state_0_count;
	
	private int row_number;

	public int getQna_id() {
		return qna_id;
	}

	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
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
