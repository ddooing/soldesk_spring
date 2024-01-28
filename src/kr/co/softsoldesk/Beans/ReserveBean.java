package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserveBean {

	private int reserve_idx;
	private int user_idx;
	private int exhibition_idx;
	private String reserve_date;
	private int total_price;
	private int point_use;
	private int cash_use;
	private int ticket_count;
	private String regdate;
	
}
