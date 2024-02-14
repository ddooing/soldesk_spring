package kr.co.softsoldesk.Beans;

import java.util.Date;

public class CommentBean {
	private int comment_id; // 댓글 ID
    private int board_id; // 게시글 ID
    private int user_id; // 사용자 ID
    private String contents; // 댓글 내용
    private String regdate_date; // 등록 날짜
    private String modify_date; // 수정 날짜
    private int state; // 상태값 (0:삭제, 1:정상)
    private String user_name; // 수정 날짜
    
    
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate_date() {
		return regdate_date;
	}
	public void setRegdate_date(String regdate_date) {
		this.regdate_date = regdate_date;
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
    
    
    
}
