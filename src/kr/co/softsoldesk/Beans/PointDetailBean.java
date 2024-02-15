package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PointDetailBean {

	private int point_id;
	private int user_id;
	private int point;
	private int point_state_code;
	private int point_type_code;
	private String regdate;
	public int getPoint_id() {
		return point_id;
	}
	public void setPoint_id(int point_id) {
		this.point_id = point_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getPoint_state_code() {
		return point_state_code;
	}
	public void setPoint_state_code(int point_state_code) {
		this.point_state_code = point_state_code;
	}
	public int getPoint_type_code() {
		return point_type_code;
	}
	public void setPoint_type_code(int point_type_code) {
		this.point_type_code = point_type_code;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
