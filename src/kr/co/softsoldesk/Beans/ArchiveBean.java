package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ArchiveBean {

	private String contents;
	private int reserve_id;
	private int rating;
	private int expose;
	private String reserve_date;
	private String regdate;
	private String create_date;
	private String modify_date;
	private int ticket_count;
	private int total_price;
	private String title;
	private String place;
	private String main_poster_name;
	private String main_poster_path;
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getReserve_id() {
		return reserve_id;
	}
	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
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
	public String getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}
	public int getTicket_count() {
		return ticket_count;
	}
	public void setTicket_count(int ticket_count) {
		this.ticket_count = ticket_count;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getMain_poster_name() {
		return main_poster_name;
	}
	public void setMain_poster_name(String main_poster_name) {
		this.main_poster_name = main_poster_name;
	}
	public String getMain_poster_path() {
		return main_poster_path;
	}
	public void setMain_poster_path(String main_poster_path) {
		this.main_poster_path = main_poster_path;
	}

	
}
