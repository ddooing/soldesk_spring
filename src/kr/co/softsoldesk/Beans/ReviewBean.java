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
	private String regdate;
	private String modify_date;
	private String create_date;
		
}
