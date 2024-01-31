package kr.co.softsoldesk.Beans;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardBean {
	private Integer board_Id; // 게시판번호
    private Integer user_Id; // 작성자
    private String title; // 제목
    private Date regDate;	// 등록일자
    private String contents; // 내용
    private Date updateDate;	// 수정날짜
    private Integer state;	// 상태
	public Integer getBoard_Id() {
		return board_Id;
	}
	public void setBoard_Id(Integer board_Id) {
		this.board_Id = board_Id;
	}
	public Integer getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(Integer user_Id) {
		this.user_Id = user_Id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
    
 
}
