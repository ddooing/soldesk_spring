package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExhibitionBean {
	
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
}
