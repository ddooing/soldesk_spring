package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewBean {
	
	private int review_id;
	private int reserve_id;
	private String contents;
	private int rating;
	private int expose;

	private String modify_date;
	private String create_date;
		
	
	// 경험치 업데이트 변수추가
	private int exp;
	private String nickname;
	private String grade;
	private String short_contents;
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getReserve_id() {
		return reserve_id;
	}
	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getExpose() {
		return expose;
	}
	public void setExpose(int expose) {
		this.expose = expose;
	}
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getShort_contents() {
		return short_contents;
	}
	public void setShort_contents(String short_contents) {
		this.short_contents = short_contents;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
