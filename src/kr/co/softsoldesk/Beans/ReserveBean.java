package kr.co.softsoldesk.Beans;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserveBean {

	private int reserve_id;
	private int user_id;
	private int exhibition_id;
	private String reserve_date;
	private int total_price;
	private int point_deduction;
	private int payment;
	private int ticket_count;
	private String reserve_time;
	private int state;
	private int payment_state;
	private String order_id;
	private String paymentkey;

	// 추가용
	private float pointsaving;

}
