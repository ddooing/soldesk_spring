package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExhibitionBean {
	
	private String keyword;
	
	// 테이블 요소
	private int exhibition_id;
	private String title;
	private String regdate;
	private String author;
	private int price;
	private String exhibition_start;
	private String exhibition_end;
	private String open;
	private String holiday;
	private int ticket_cnt;
	private String address;
	private String place;
	private String site;
	private int views;
	private double latitude;
	private double longitude;
	private int state;
	private int main_poster_file_id;
	private int detail_poster_file_id;
	
	
	
	// select 쿼리문 사용
	private String main_poster_path;
	private String main_poster_name;
	
	private String detail_poster_path;
	private String detail_poster_name;
	
	private int user_id;
	private int bookmark_id;
	
	private String open_state;
	
	private int total_exhibitions_count;
	private int upcoming_exhibitions_count;
	private int past_exhibitions_count;
	private int current_exhibitions_count;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getExhibition_start() {
		return exhibition_start;
	}
	public void setExhibition_start(String exhibition_start) {
		this.exhibition_start = exhibition_start;
	}
	public String getExhibition_end() {
		return exhibition_end;
	}
	public void setExhibition_end(String exhibition_end) {
		this.exhibition_end = exhibition_end;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public int getTicket_cnt() {
		return ticket_cnt;
	}
	public void setTicket_cnt(int ticket_cnt) {
		this.ticket_cnt = ticket_cnt;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getMain_poster_file_id() {
		return main_poster_file_id;
	}
	public void setMain_poster_file_id(int main_poster_file_id) {
		this.main_poster_file_id = main_poster_file_id;
	}
	public int getDetail_poster_file_id() {
		return detail_poster_file_id;
	}
	public void setDetail_poster_file_id(int detail_poster_file_id) {
		this.detail_poster_file_id = detail_poster_file_id;
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
	public String getDetail_poster_path() {
		return detail_poster_path;
	}
	public void setDetail_poster_path(String detail_poster_path) {
		this.detail_poster_path = detail_poster_path;
	}
	public String getDetail_poster_name() {
		return detail_poster_name;
	}
	public void setDetail_poster_name(String detail_poster_name) {
		this.detail_poster_name = detail_poster_name;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getBookmark_id() {
		return bookmark_id;
	}
	public void setBookmark_id(int bookmark_id) {
		this.bookmark_id = bookmark_id;
	}
	public String getOpen_state() {
		return open_state;
	}
	public void setOpen_state(String open_state) {
		this.open_state = open_state;
	}
	public int getTotal_exhibitions_count() {
		return total_exhibitions_count;
	}
	public void setTotal_exhibitions_count(int total_exhibitions_count) {
		this.total_exhibitions_count = total_exhibitions_count;
	}
	public int getUpcoming_exhibitions_count() {
		return upcoming_exhibitions_count;
	}
	public void setUpcoming_exhibitions_count(int upcoming_exhibitions_count) {
		this.upcoming_exhibitions_count = upcoming_exhibitions_count;
	}
	public int getPast_exhibitions_count() {
		return past_exhibitions_count;
	}
	public void setPast_exhibitions_count(int past_exhibitions_count) {
		this.past_exhibitions_count = past_exhibitions_count;
	}
	public int getCurrent_exhibitions_count() {
		return current_exhibitions_count;
	}
	public void setCurrent_exhibitions_count(int current_exhibitions_count) {
		this.current_exhibitions_count = current_exhibitions_count;
	}
	
	
	
	
	
	
}
