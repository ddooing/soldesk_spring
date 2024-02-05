package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class CartBean { 
	//장바구니 페이지에서 보여질 
	private int user_id; // ???
	
	private int exhibition_id;
	private String title;
	private String main_poster_path;
	private String main_poster_name;
	private int total_price;
	private String reserve_date;
	private int ticket_count;
}
