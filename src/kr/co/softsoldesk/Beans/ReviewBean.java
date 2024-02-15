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
}
