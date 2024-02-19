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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getExhibition_id() {
		return exhibition_id;
	}
	public void setExhibition_id(int exhibition_id) {
		this.exhibition_id = exhibition_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMain_poster_path() {
		return main_poster_path;
	}
	public void setMain_poster_path(String main_poster_path) {
		this.main_poster_path = main_poster_path;
	}
	public String getMain_poster_name() {
		return main_poster_name;
	}
	public void setMain_poster_name(String main_poster_name) {
		this.main_poster_name = main_poster_name;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}
	public int getTicket_count() {
		return ticket_count;
	}
	public void setTicket_count(int ticket_count) {
		this.ticket_count = ticket_count;
	}
	
	
	
	
	
}
