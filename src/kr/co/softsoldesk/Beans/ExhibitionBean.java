package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExhibitionBean {

	private int exhibition_idx;
	private String title;
	private String reg_date;
	private String ad_start;
	private String ad_end;
	private String author;
	private int price;
	private String exhibition_start;
	private String exhibition_end;
	private String open;
	private String holiday;
	private String address;
	private String place;
	private String site;
	private int X;
	private int Y;
	private int state;
	private String main_poster_filename;
	private String main_poster_filepath;
	private String detail_poster_filename;
	private String detail_poster_filepath;
	public int getExhibition_idx() {
		return exhibition_idx;
	}
	public void setExhibition_idx(int exhibition_idx) {
		this.exhibition_idx = exhibition_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getAd_start() {
		return ad_start;
	}
	public void setAd_start(String ad_start) {
		this.ad_start = ad_start;
	}
	public String getAd_end() {
		return ad_end;
	}
	public void setAd_end(String ad_end) {
		this.ad_end = ad_end;
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
	public int getX() {
		return X;
	}
	public void setX(int x) {
		X = x;
	}
	public int getY() {
		return Y;
	}
	public void setY(int y) {
		Y = y;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getMain_poster_filename() {
		return main_poster_filename;
	}
	public void setMain_poster_filename(String main_poster_filename) {
		this.main_poster_filename = main_poster_filename;
	}
	public String getMain_poster_filepath() {
		return main_poster_filepath;
	}
	public void setMain_poster_filepath(String main_poster_filepath) {
		this.main_poster_filepath = main_poster_filepath;
	}
	public String getDetail_poster_filename() {
		return detail_poster_filename;
	}
	public void setDetail_poster_filename(String detail_poster_filename) {
		this.detail_poster_filename = detail_poster_filename;
	}
	public String getDetail_poster_filepath() {
		return detail_poster_filepath;
	}
	public void setDetail_poster_filepath(String detail_poster_filepath) {
		this.detail_poster_filepath = detail_poster_filepath;
	}
	
	
	
}
