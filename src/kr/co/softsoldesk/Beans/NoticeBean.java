package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeBean {
	
	private int notice_id;
	private String title;
	private String create_date;
	private int views;
	private String contents;
	private String update_date;
	private int state;
	
	private int total_count;
	private int state_1_count;
	private int state_0_count;
	
	private int row_number;
	private int rnum;
	private int count;

}
